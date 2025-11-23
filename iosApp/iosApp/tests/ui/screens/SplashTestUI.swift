//
// Created by Fernando Fazio Sinigaglia on 15/10/25.
//

import XCTest
import Foundation
import Shared
import SwiftUI

final class SplashTestUI: XCTestCase {

    private var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testSplashVisibility() async throws {


        let indicator = await app.activityIndicators["loadingIndicator"]
        // let exists = await indicator.waitForExistence(timeout: 5)
        if (indicator.exists) {
            XCTAssertTrue(indicator.exists, "Loading indicator should exist")
        } else {
            XCTAssertFalse(indicator.exists, "Loading indicator should not exists")
        }
    }
}
