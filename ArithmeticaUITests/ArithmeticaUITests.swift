//
//  ArithmeticaUITests.swift
//  ArithmeticaUITests
//
//  Created by Max Mercer on 2022-09-01.
//

import XCTest

class ArithmeticaUITests: XCTestCase {
    var app: XCUIApplication!

    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        //let app = XCUIApplication()
        //app.buttons[about]

        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
