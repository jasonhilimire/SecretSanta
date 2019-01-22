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
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
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
    
    func testMatchSantasPressedisEnabled() {
        let matchSantabtn = app.buttons["Match Santas!!"]
        XCTAssertTrue(matchSantabtn.isEnabled, "Match Santas Button should be Enabled")
    }
    
    func testHeaderLabelExists() {
        let label = app.staticTexts["headerLabel"]
        XCTAssertTrue(label.exists, "Label should exist")
    }
    
    func testPairsLabelExists() {
        let label = app.staticTexts["pairLabel"]
        XCTAssertTrue(label.exists, "Label should exist")
    }
    
    func testResetBtnExists() {
        let resetBtn = app.buttons["Reset"]
        XCTAssertTrue(resetBtn.exists, "Reset Button Should appear")
    }
    
    func testRotation() {
        // this will fail as i didnt apply any constraints on purpose
        // ideally would test this on all rotations ....
        let resetBtn = app.buttons["Reset"]
        XCUIDevice.shared.orientation = .landscapeLeft
        XCTAssertTrue(resetBtn.isHittable, "Reset Button Should appear on screen")
    }
    
    // Check button presses / functionality
    
    func testMatchSantaspressedFillsLabel() {
        let labelStaticText = app.staticTexts["pairLabel"]
        app.buttons["Match Santas!!"].tap()
        let labelText = labelStaticText.label
        let isValidLabelText = labelText.contains("jaymie")
        XCTAssertTrue(isValidLabelText, "Contains the string")
    }
    
    func testMatchSantasPressedthenDisabled() {
        let matchSantabtn = app.buttons["Match Santas!!"]
        app.buttons["Match Santas!!"].tap()
        XCTAssertTrue(!matchSantabtn.isEnabled, "Match Santas Button should be disabled")
    }
    
    func testResetPressedClearsLabel() {
        
        let labelStaticText = app.staticTexts["pairLabel"]
        app.buttons["Match Santas!!"].tap()
        app.buttons["Reset"].tap()
        let labelText = labelStaticText.label
        let isValidLabelText = labelText.isEmpty
        XCTAssertTrue(isValidLabelText, "Label should be empty")
    }
    
    func testMatchSantasPressedtisReEnabled() {
        let matchSantabtn = app.buttons["Match Santas!!"]
        app.buttons["Match Santas!!"].tap()
        app.buttons["Reset"].tap()
        XCTAssertTrue(matchSantabtn.isEnabled, "Match Santas Button should be Enabled")
    }

}
