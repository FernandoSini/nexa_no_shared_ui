//
// Created by Fernando Fazio Sinigaglia on 18/09/25.
//

import Foundation
import SwiftUI
import SwiftData


struct SplashView: View {
    @State private var path = NavigationPath()
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    @AppStorage("isDarkMode") private var isDarkMode: Bool = true
    @Environment(\.modelContext) var modelContext
    //@Environment(\.colorScheme) private var colorScheme: ColorScheme
    @ObservedObject private var splashViewModel: SplashViewModel = SplashViewModel()
    @ObservedObject private var routeViewModel: RouteViewModel = RouteViewModel()
    @ObservedObject private var themeViewModel: ThemeViewModel = ThemeViewModel()


    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image("assets/gaminexa")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)

                if !splashViewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color(hex:0xff409B9B)))
                        .padding()
                        .animation(.easeInOut(duration: 5), value: UUID())
                        .accessibilityIdentifier("loadingIndicator")
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .colorScheme(themeViewModel.colorScheme)
            .background(themeViewModel.colorScheme == .light ? .white : Color(hex: 0xff151218))
            .edgesIgnoringSafeArea(.all)
            .onChange(of: splashViewModel.isLoading) {
                if splashViewModel.isLoading {
                    if (!path.isEmpty) {
                        path.removeLast(path.count)
                    }
                    path.append("base")
                }

            }
            .navigationDestination(for: String.self) {
                value in
                routeViewModel.routeTo(to: value, for: $path, pageType: nil)
            }
            .navigationDestination(for: MyPath.self) {
                value in
                routeViewModel.routeTo(to: value.routePath, for: $path, pageType: value.pageType)
            }

        }
    }


}
