//
// Created by Fernando Fazio Sinigaglia on 01/10/25.
//

import Foundation
import SwiftUI

@MainActor
class RouteViewModel: ObservableObject, Identifiable {

    @ViewBuilder
    func routeTo(to destination: String, for path: Binding<NavigationPath>, pageType: PageType?) -> some View {
        switch destination {
        case "login":
            LoginView(path: path).navigationBarBackButtonHidden(true)
        case "onboarding":
            OnboardingView(path: path).navigationBarBackButtonHidden(true)
        case "home":
            HomeView(path: path).navigationBarBackButtonHidden(true)
        case "base":
            BaseView(path: path).navigationBarBackButtonHidden(true)
        case "signIn":
            SignInView(path: path).navigationBarBackButtonHidden(true)
        case "internal-page":
            MenuItemPageView(path: path, pageType: pageType)
        default:
            SplashView().navigationBarBackButtonHidden(true)
        }
    }

    @ViewBuilder
    func renderPageByType(pageType: PageType, path: Binding<NavigationPath>?) -> some View {
        switch pageType {

        case .account:
            AccountSettingsView(path:path!)
        case .billing:
            VStack {
            }
        case .contents:
            
            ContentItemView(path: path!)
        case .notifications:
            VStack {
            }
        case .monetization:
            VStack {
            }
        case .privacy:
            VStack {
            }
        case .terms:
            VStack {
            }
        case .support:
            VStack {
            }
        case .partnership:
            VStack {
            }
        }


    }
}
