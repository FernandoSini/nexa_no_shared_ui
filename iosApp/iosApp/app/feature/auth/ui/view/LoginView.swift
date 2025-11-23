//
// Created by Fernando Fazio Sinigaglia on 01/10/25.
//

import Foundation
import SwiftUI
import Shared


struct LoginView: View {
    @Binding var path: NavigationPath
    @State private var loginString: String = ""
    @State private var passwordString: String = ""
    @State private var isVisible: Bool = false
    @ObservedObject private var routeViewModel: RouteViewModel = RouteViewModel()
    @ObservedObject private var themeViewModel: ThemeViewModel = ThemeViewModel()

    init(path: Binding<NavigationPath>) {
        self._path = path
    }

    var body: some View {
        VStack() {
            Spacer()
            HStack {
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer().frame(height: 10)
                    Text("We're happy to see you back")
                        .font(.headline)
                        .foregroundColor(.gray)

                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 15)
            .safeAreaPadding(.horizontal, 25)
            Section {
                ZStack {
                    HStack {
                        TextField("vou comer seu lulu", text: $loginString)
                            .foregroundColor(Color(hex: 0xff787878, alpha: 0.95)).foregroundColor(Color(hex: 0xff787878, alpha: 0.95))
                            .accessibilityLabel("emailField")
                            .accessibilityIdentifier("emailField")
                    }
                    .edgesIgnoringSafeArea(.trailing)
                    .padding(.horizontal, 10)
                }
                .frame(height: 50)
                .background(Color(hex: 0xff787878, alpha: 0.15))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.clear, lineWidth: 1))

                // .overlay(<#T##style: ShapeStyle##ShapeStyle#>)

                HStack {
                    ZStack {
                        TextField("Type your password", text: $passwordString)
                            .opacity(isVisible ? 1 : 0)
                            .textContentType(.password)
                            .frame(height: 50)
                            .foregroundColor(Color(hex: 0xff787878, alpha: 0.95))
                        SecureField("Type your password", text: $passwordString)
                            .opacity(isVisible ? 0 : 1)
                            .textContentType(.password)
                            .frame(height: 50)
                            .foregroundColor(Color(hex: 0xff787878, alpha: 0.95))

                    }
                    .accessibilityLabel("passwordField")
                    .accessibilityIdentifier("passwordField")
                    Button {
                        isVisible.toggle()
                    } label: {
                        Image(systemName: isVisible ? "eye.slash" : "eye")
                            .foregroundColor(isVisible ? .blue : Color(hex: 0xff787878, alpha: 0.95))

                    }
                    .accessibilityLabel("loginBtnLabel")
                    .accessibilityIdentifier("loginBtn")


                }
                .padding(.horizontal, 10)
                .background(Color(hex: 0xff787878, alpha: 0.15))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.clear, lineWidth: 1))

                Button {
                    // Add login action here
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .safeAreaPadding(.horizontal, 25)
            .padding(.vertical, 5)
            Spacer()
            HStack {
                Text("Don't have account?").font(.subheadline)
                Button {
                    if (!path.isEmpty) {
                        path.removeLast(path.count)
                    }
                    path.append("signIn")
                } label: {
                    Text("Sign in").font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }

            }
            .frame(maxWidth: .infinity, alignment: .center)
            Spacer().frame(height: 20)

        }
        .accessibilityLabel("loginView")
        .accessibilityIdentifier("loginView")

        .colorScheme(themeViewModel.colorScheme)
        // .navigationBarTitle("Login")
        .background(themeViewModel.colorScheme == .light ? Color.white : Color(hex: 0xff151218))


    }
}
