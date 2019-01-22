//
//  SecretSantaUITests.swift
//  SecretSantaUITests
//
//  Created by Jason Hilimire on 1/21/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import XCTest
@testable import SecretSanta

class SecretSantaUITests: XCTestCase {

    let app = XCUIApplication()
  
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
 // Check all elements appear on screen properly
    func testTitleExists() {
        let title = app.staticTexts["Secret Santas"]
        XCTAssertTrue(title.exists, "Title should appear")
    }
    
    func testMatchBtnExists() {
        let matchBtn = app.buttons["Match Santas!!"]
        XCTAssertTrue(matchBtn.exists, "Match Santas Button Should appear")
    }
    
    func testPairsLabelExists() {
        
    }
    
    func testResetBtnExists() {
        let resetBtn = app.buttons["Reset"]
        XCTAssertTrue(resetBtn.exists, "Reset Button Should appear")
    }
    
    func testRotation() {
        // this will fail as i didnt apply any constraints on purpose
        let resetBtn = app.buttons["Reset"]
        XCUIDevice.shared.orientation = .landscapeLeft
        XCTAssertTrue(resetBtn.isHittable, "Reset Button Should appear on screen")
    }
    func testMatchSantaspressed() {
        XCUIApplication().buttons["Match Santas!!"].tap()
        
    }
    
    func testResetPressed() {
        XCUIApplication().buttons["Reset"].tap()
    }

}
