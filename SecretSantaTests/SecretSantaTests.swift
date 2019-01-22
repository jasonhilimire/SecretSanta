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
    
    
    let availablefamilyData = availableFamily
    let familyData = family
    let dict = emptyDict
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCompareArrayCounts() {
        XCTAssertEqual(availablefamilyData.count, familyData.count, "The array counts are equal")
    }
    
    func testCompareArrayValues() {
        XCTAssertEqual(availablefamilyData, familyData, "The arrays are equal")
    }
    
    func testDictisEmpty() {
        XCTAssertEqual(dict.count, 0, "The dictionary is empty")
    }
    
    func testDictContainsAllFamily(){
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
