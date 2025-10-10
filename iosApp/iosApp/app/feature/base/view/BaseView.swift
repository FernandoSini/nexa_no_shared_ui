//
// Created by Fernando Fazio Sinigaglia on 18/09/25.
//

import Foundation
import SwiftUI


struct BaseView: View {
    @Binding var path: NavigationPath
    // @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @ObservedObject private var themeViewModel: ThemeViewModel = ThemeViewModel()

    init(path: Binding<NavigationPath>) {
        self._path = path
    }

    var body: some View {

        TabView {

            NavigationView {
                HomeView(path: $path)

            }
            .tabItem {
                Image(systemName: "house.fill")
               // Text("Home")
            }
            NavigationView {
                ExploreView(path: $path)
            }
            .tabItem {
                Image(systemName: "mosaic.fill")
                    .environment(\.layoutDirection, .rightToLeft)
               // Text("Explore")
            }

            NavigationView {
                SettingsView(path: $path)
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
              //  Text("Settings")
            }

        }
        .toolbarColorScheme(themeViewModel.colorScheme, for: .bottomBar)
        .environment(\.colorScheme, themeViewModel.colorScheme)

    }


    private func initTabBarTheme() {
        //UITabBar.appearance().backgroundColor = UIColor.red
        UITabBar.appearance().shadowImage = UIImage() // Remove default shadow

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = themeViewModel.colorScheme == .light ? .white : Color(hex: 0xff151218).toUIColor()
        appearance.stackedLayoutAppearance.selected.iconColor = .red
        appearance.stackedLayoutAppearance.normal.iconColor = .gray

        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red]
        let topBorder = UIImage() // Placeholder, UIImage(color:size:) does not exist by default
        appearance.shadowImage = topBorder
        appearance.shadowImage = topBorder
        appearance.shadowColor = .gray


        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}
