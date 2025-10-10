//
// Created by Fernando Fazio Sinigaglia on 16/09/25.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @Binding var path: NavigationPath
    @ObservedObject var routeViewModel: RouteViewModel = RouteViewModel()
    var body: some View {

        VStack() {
            Text("Welcome to the App!")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            Text("We're glad to have you here.\nLet's get started!")
                .font(.title2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)


            NavigationLink(value: "home") {
                Button(action: {
                    if (!path.isEmpty) {
                        path.removeLast(path.count)
                    }
                    path.append("home")
                    routeViewModel.routeTo(to: "home", for: $path, pageType: nil)
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
            }


        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("assets/onboarding")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 3, opaque: false)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all))

    }

    /*    private func routeTo(to destination: String, for path: NavigationPath) -> some View {
        switch destination {
        case "home":
            return HomeView(path: $path).navigationBarBackButtonHidden(true)
        default:
            return HomeView(path: $path).navigationBarBackButtonHidden(true)
        }
    } */

}

