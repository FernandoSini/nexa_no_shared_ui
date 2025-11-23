//
//  LoginTestUI.swift
//  iosApp
//
//  Created by Fernando Fazio Sinigaglia on 14/10/25.
//

import XCTest
import SwiftUI
import Shared


final class LoginTestUI: XCTestCase {

    // private var loginView: LoginView
    private var app = XCUIApplication()
    private var navigationPath: NavigationPath?;

    override func setUpWithError() throws {
        try super.setUpWithError()
        app.launch()
        continueAfterFailure = false
    }


    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app.terminate()
        //navigationPath = nil
    }


    func testSuccessLogin() async throws {
        let loginView = await app.otherElements["loginView"]
        if (await !loginView.exists) {
            app.terminate()
            throw XCTSkip("Jumping test because we dont have the loginView")
        } else {
            let email = await app.textFields["emailField"]
            let exists = await email.waitForExistence(timeout: 5)
            await print(app.debugDescription)
            XCTAssertTrue(exists, "email exist")
            let emailUsernameField = await app.textFields["emailField"]
            emailUsernameField.tap()
            emailUsernameField.typeText("teste@teste.com")
            let passwordField = app.secureTextFields["passwordField"]
            passwordField.waitForExistence(timeout: 5)
            passwordField.tap()
            let loginBtn = app.buttons["loginButton"]
            loginBtn.tap()

        }


    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
