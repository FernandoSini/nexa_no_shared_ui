//
// Created by Fernando Fazio Sinigaglia on 02/10/25.
//

import Foundation
import SwiftUI


struct SignInView: View {
    @Binding var path: NavigationPath
    @State private var userNameText: String = ""
    @State private var passwordText: String = ""
    @State private var verifyPasswordText: String = ""
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @ObservedObject private var themeViewModel: ThemeViewModel = ThemeViewModel()
    @State private var passwordIsVisible: Bool = false
    @State private var verifyPasswordisVisible: Bool = false

    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    Text("SignIn")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer().frame(height: 10)
                    Text("Welcome, we're glad to have you here")
                        .multilineTextAlignment(.center)
                        .font(.headline).foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 15)
            .safeAreaPadding(.horizontal, 25)
            VStack {
                Section() {
                }

                Section {

                    HStack {
                        ZStack {
                            TextField("Your password", text: $passwordText)
                                .opacity(passwordIsVisible ? 0 : 1)
                                .textContentType(.password)
                                .frame(height: 50)
                                .foregroundColor(Color(hex: 0xff787878, alpha: 0.95))
                            SecureField("Your password", text: $passwordText)
                                .opacity(passwordIsVisible ? 1 : 0)
                                .textContentType(.password)
                                .frame(height: 50)
                                .foregroundColor(Color(hex: 0xff787878, alpha: 0.95))


                        }
                        Button {
                            passwordIsVisible.toggle()
                        } label: {
                            Image(systemName: passwordIsVisible ? "eye.slash" : "eye")
                                .foregroundColor(Color(hex: 0xff787878, alpha: 0.95))
                        }

                    }
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: 0xff787878, alpha: 0.15))
                    .cornerRadius(10)

                    HStack {
                        ZStack {
                            TextField("Verify password", text: $verifyPasswordText)
                                .opacity(verifyPasswordisVisible ? 0 : 1)
                                .textContentType(.password)
                                .frame(height: 50)
                                .foregroundColor(Color(hex: 0xff787878, alpha: 0.95))
                            SecureField("Verify password", text: $verifyPasswordText)

                                .opacity(verifyPasswordisVisible ? 1 : 0)
                                .textContentType(.password)
                                .frame(height: 50)
                                .foregroundColor(Color(hex: 0xff787878, alpha: 0.95))

                        }


                        Button {
                            verifyPasswordisVisible.toggle()
                        } label: {
                            Image(systemName: verifyPasswordisVisible ? "eye.slash" : "eye")
                                .foregroundColor(Color(hex: 0xff787878, alpha: 0.95))
                        }
                    }
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: 0xff787878, alpha: 0.15))
                    .cornerRadius(10)

                    Button {
                    } label: {
                        Text("SignIn")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .background(Color.blue).cornerRadius(10)
                    }


                }
                .padding(.vertical, 5)
                .safeAreaPadding(.horizontal, 25)
                .listRowBackground(Color.clear)

            }
            .scrollContentBackground(.hidden)
            Spacer()
            HStack {
                Text("Already have account?")
                    .font(.subheadline)
                Button {
                    if !path.isEmpty {
                        path.removeLast(path.count)
                    }
                    path.append("login")
                } label: {
                    Text("Back to Login")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
            }
            Spacer().frame(height: 20)
        }
        .colorScheme(themeViewModel.colorScheme)
        .background(themeViewModel.colorScheme == .light ? .white : Color(hex: 0xff151218))

    }
}
