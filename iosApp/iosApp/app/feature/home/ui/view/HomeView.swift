//
// Created by Fernando Fazio Sinigaglia on 16/09/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @Binding var path: NavigationPath
    @State private var showContent = false
    @State private var textFieldInput = ""
    @State private var headerText = "Gaminexa"
    @State private var y_axis: CGFloat = 0.0
    @Environment(\.colorScheme) private var colorSchemeSystem: ColorScheme
    @ObservedObject private var themeViewModel: ThemeViewModel = ThemeViewModel()



    var body: some View {
        VStack {
            ScrollView(showsIndicators: true) {
                GeometryReader { geometry in
                    Color.clear.preference(key: ScrollOffsetKey.self, value: geometry.frame(in: .named(".scroll")).minY)
                }
                ZStack {
                    HStack {
                        TextField("Type something", text: $textFieldInput)
                            .foregroundColor(Color(hex: 0xff787878, alpha: 0.95))
                            .onSubmit {
                                print("Submitted value: \(textFieldInput)")
                            }
                        Button {
                            print("Submit button tapped with value: \(textFieldInput)")
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(hex: 0xff787878, alpha: 0.5))
                        }
                        .edgesIgnoringSafeArea(.trailing)
                    }
                    .padding(.horizontal, 10)
                }
                .frame(height: 40)
                .background(Color(hex: 0xff787878, alpha: 0.15))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.clear, lineWidth: 1)
                )
                .padding(.horizontal, 20)
            }
            .coordinateSpace(name: ".scroll")
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                withAnimation(.easeIn(duration: 0.25)) {
                    DispatchQueue.main.async {
                        y_axis = value
                    }
                    print("Scroll offset: \(value)")
                }

            }
        }
        .onAppear {
            //themeViewModel.colorScheme = colorSchemeSystem
        }
        .background(themeViewModel.colorScheme == .light ? .white : Color(hex: 0xff151218))
        .toolbarBackground(.clear, for: .navigationBar)
        .navigationBarTitle(headerText)
        .colorScheme(themeViewModel.colorScheme)
        .overlay(y_axis < 0 ? nil : Image(systemName: "person.circle")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .padding(.trailing, 30)
            .offset(x: 0, y: y_axis > 0 ? y_axis - 40 : -40), alignment: .topTrailing)
        .navigationBarItems(trailing: Image(systemName: "person.circle")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .padding(.trailing, 15).opacity(y_axis <= -10 ? 1 : 0))
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(themeViewModel.colorScheme == .light ? Color.white : Color(hex: 0xff151218), for: .tabBar)


    }
}

struct ScrollOffsetKey: @preconcurrency PreferenceKey {
    typealias Value = CGFloat
    @MainActor static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
