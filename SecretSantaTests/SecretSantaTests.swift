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
    
    let ss = Family()
    
//    let getSantasFunc = Family.getSantas(Family)
//    let availablefamilyData = availableFamily
//    let familyData = family
//    let dict = emptyDict
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCheckArrayContainsValues() {
        let familyData = ss.family
        
        XCTAssertTrue(!familyData.isEmpty, "The family array should contain data")
    }
    

    func testDictisEmpty() {
        let dict = ss.santasDict
        XCTAssertEqual(dict.count, 0, "The dictionary is empty")
    }
    
    func testDictContainsAllFamily(){
        let familyData = ss.family
        let getSantasFunc = ss.getSantas(members: familyData, available: familyData)
        XCTAssertEqual(getSantasFunc.count, familyData.count , "The Dictionary count must equal the Family Array count")
    }
    
    func testAllSantasHaveReceivers() {
        let familyData = ss.family
        let getSantasFunc = ss.getSantas(members: familyData, available: familyData)
        let valueExists = getSantasFunc.values.filter({ $0 == nil }).isEmpty
        XCTAssertTrue(valueExists, "All Keys in dictionary should also have values")
    }
    
    func testAllReceiversHaveSantas() {
        let familyData = ss.family
        let getSantasFunc = ss.getSantas(members: familyData, available: familyData)
        let keyExists = getSantasFunc.keys.filter({ $0 == nil }).isEmpty
        XCTAssertTrue(keyExists, "All Keys in dictionary should also have values")
    }
    
    func testAvailableRemovesAll() {
        let familyData = ss.family
        let availableFamilyData = ss.family
        let getSantasFunc = ss.getSantas(members: familyData, available: availableFamilyData)
        let isArrayEmpty = availableFamilyData.count == 0
        XCTAssertTrue(isArrayEmpty, "The AvailableFamilyArray should be empty at end of function")
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
