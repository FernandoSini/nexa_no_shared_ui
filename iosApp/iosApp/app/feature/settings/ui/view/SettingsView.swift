//
// Created by Fernando Fazio Sinigaglia on 18/09/25.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @Binding var path: NavigationPath

    //@State private var customColorScheme: ColorScheme
    @State private var y_axis: CGFloat = 0.0
    @State private var isTapped: Bool = false

    @ObservedObject var menuViewModel = MenuViewModel()
    @ObservedObject var themeViewModel: ThemeViewModel = ThemeViewModel()

    init(path: Binding<NavigationPath>) {
        self._path = path
        //   self._customColorScheme = State(initialValue: self._colorSchemeSetting.wrappedValue == "light" ? .light : .dark)
    }


    var body: some View {
        VStack {

            List {
                ForEach(menuViewModel.menuItems) {
                    item in
                    MenuItemView(menuItem: item, path: $path)
                }
            }


            .background(
                GeometryReader { listGeometry in
                    Color.clear.preference(
                        key: ScrollOffsetKey.self,
                        value: listGeometry.frame(in: .global).minY
                    )
                }
            )
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                withAnimation(.easeIn(duration: 0.25)) {
                    DispatchQueue.main.async {
                        y_axis = value
                    }
                    print("Scroll OffsetSettings: \(value)")
                }
            }
            .scrollIndicatorsFlash(onAppear: true)
            .scrollIndicators(.visible, axes: .vertical)
            .scrollContentBackground(.hidden)
            .coordinateSpace(name: "scroll")
        }
        .navigationBarTitle("Settings")
        .preferredColorScheme(themeViewModel.colorScheme)
        .navigationViewStyle(.columns)
        //.toolbarTitleDisplayMode(.large)
        .navigationBarTitleDisplayMode(.large)
        .background(themeViewModel.colorScheme == .light ? Color.white : Color(hex: 0xff151218))
        .toolbar {

            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    if (themeViewModel.colorSchemeSettings == "dark") {
                        themeViewModel.changeColorScheme(new: "light")
                    } else {
                        themeViewModel.changeColorScheme(new: "dark")
                    }
                    // Action for the button
                }) {
                    Image(systemName: themeViewModel.colorScheme == .dark ? "moon" : "sun.max.fill")
                        .foregroundColor(themeViewModel.colorScheme == .dark ? .white : .yellow)
                        .frame(width: 15, height: 15)
                }
                    // .opacity(y_axis <= 110 ? 1 : 0)
                .padding(.trailing, 20)

            }

        }
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(themeViewModel.colorScheme == .light ? Color.white : Color(hex: 0xff151218), for: .tabBar)
        /* .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    if (colorSchemeSetting == "dark") {
                        customColorScheme = .light
                        UserDefaults.standard.setValue("light", forKey: "color_scheme")
                    } else {
                        customColorScheme = .dark
                        UserDefaults.standard.setValue("dark", forKey: "color_scheme")
                    }
                    // Action for the button
                }) {
                    Image(systemName: customColorScheme == .dark ? "moon.fill" : "sun.max.fill")
                        .foregroundColor(customColorScheme == .dark ? .white : .yellow)
                        .frame(width: 15, height: 15)
                }
                .opacity(y_axis <= 110 ? 1 : 0)
                .padding(.trailing, 20)

            }
        }*/
        .environment(\.colorScheme, themeViewModel.colorScheme)
    }

}