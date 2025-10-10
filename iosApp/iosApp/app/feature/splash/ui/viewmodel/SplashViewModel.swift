//
// Created by Fernando Fazio Sinigaglia on 26/09/25.
//

import Foundation
import SwiftUI
@preconcurrency import Shared

@MainActor
class SplashViewModel: ObservableObject {

    let userUseCase: UserUseCase = UserUseCase()
    @Published var user: UserEntity? = nil
    @Published var currentError: MyError? = nil
    @Published var isLoading: Bool = false

    init() {
        self.getUserInfo(forceRefresh: true);
    }

    func getUserInfo(forceRefresh: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            Task {
                do {
                    self.isLoading = true
                    self.user = try await self.userUseCase.getUser()
                    if let user = self.user, user != nil {
                        print(user.name)
                    }
                    self.isLoading = false
                    print(self.isLoading)
                } catch {
                    self.user = nil
                    self.isLoading = false
                    //  throw MyError(errorDescription: "Houve um erro", failureReason: nil)
                    self.currentError = MyError(errorDescription: "Houve um erro", failureReason: nil)
                }
            }
        }
    }
}

struct MyError: LocalizedError {
    var errorDescription: String?
    var failureReason: String?

    init(errorDescription: String?, failureReason: String?) {
        self.errorDescription = errorDescription
        self.failureReason = failureReason
    }

}

/* enum MyError: LocalizedError {
    case runtimeError(errorDescription:String, failureReason:String)
} */
