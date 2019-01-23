//
//  Part3Tests-MultiFamilies.swift
//  SecretSantaTests
//
//  Created by Jason Hilimire on 1/22/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import XCTest
@testable import SecretSanta

class Part3Tests_MultiFamilies: XCTestCase {
    
    // Set up Class & common variables
    let mf = MultiFamilies()
    lazy var dict = mf.santasDict
    lazy var wholeFamilyData = mf.wholeFamilyArray
    lazy var availableFamilyData = mf.availableMembers
    lazy var getSantasFunc = mf.getSantas(members: wholeFamilyData, available: &availableFamilyData)

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        availableFamilyData = wholeFamilyData
        dict.removeAll()
        super.tearDown()
    }

    func testUnionSuccess() {
        let union = mf.union()
        let sets = mf.sets
        XCTAssertTrue(!union.isEmpty, "The set should not be empty")
    }
    
    func testNotMembersSameFamily() {
        func check() -> Bool {
            for (key, value) in getSantasFunc {
                getSantasFunc[key] != getSantasFunc[value]
            }
            return true
        }
        XCTAssertTrue(check(), "Receivers are not in their Santas Family")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
