//
//  SecretSantaTests.swift
//  SecretSantaTests
//
//  Created by Jason Hilimire on 1/21/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import XCTest
@testable import SecretSanta

class SecretSantaTests: XCTestCase {
    
    // import Classes & Set variables
    let ss = Family()

    var availableFamilyData = availableFamily
    lazy var familyData = ss.family
    lazy var dict = ss.santasDict
    lazy var getSantasFunc = ss.getSantas(members: familyData, available: &availableFamily)
    
    let vc = ViewController()
    lazy var resetVC = vc.resetSantas()
    lazy var setLabelsVC = vc.setLabel()
    
    
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        availableFamily = familyData
        dict.removeAll()
        super.tearDown()
    }

    func testCheckArrayContainsValues() {

        
        XCTAssertTrue(!familyData.isEmpty, "The family array should contain data")
    }
    

    func testDictisEmpty() {

        XCTAssertEqual(dict.count, 0, "The dictionary is empty")
    }
    
    func testDictContainsAllFamily(){

        XCTAssertEqual(getSantasFunc.count, familyData.count , "The Dictionary count must equal the Family Array count")
    }
    
    func testAllSantasHaveReceivers() {

        let valueExists = getSantasFunc.values.filter({ $0 == nil }).isEmpty
        XCTAssertTrue(valueExists, "All Keys in dictionary should also have values")
    }
    
    func testAllReceiversHaveSantas() {


        let keyExists = getSantasFunc.keys.filter({ $0 == nil }).isEmpty
        XCTAssertTrue(keyExists, "All Keys in dictionary should also have values")
    }
    
    func testAvailableRemovesAll() {

        var getSantasFunc = ss.getSantas(members: familyData, available: &availableFamilyData)
        let isArrayEmpty = availableFamilyData.count == 0
        XCTAssertTrue(isArrayEmpty, "The AvailableFamilyArray should be empty at end of function")
    }
    
    func testSantaisNotReceiver() {

//        var getSantasFunc = ss.getSantas(members: familyData, available: &availableFamilyData)
        func check() -> Bool {
            for (key, value) in getSantasFunc {
                getSantasFunc[key] != getSantasFunc[value]
            }
            return true
        }
        XCTAssertTrue(check(), "Santas are not their own receiver")
    }
    
    
    func testResetClearsArray() {
        
    }
    
    func testResetClearsLabel() {
        
    }
    
    func testLabelsSet() {
        
    }
    
    
    func testPerformanceExample() {
        self.measure {
            //
        }
    }

}
