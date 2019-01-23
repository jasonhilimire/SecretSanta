//
//  MultiFamilies.swift
//  SecretSanta
//
//  Created by Jason Hilimire on 1/22/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import Foundation

class MultiFamilies {
    
    // in real world would give a secondary identifier to keep members unique in case 2 people shared the same name: ex- email or phone number
    
    let family1 = Set([
        "Joe",
        "Jane"])
    
    let family2 = Set([
        "John",
        "Billy",
        "Joanne"])

    let family3 = Set([
        "Grandma",
        "Grandpa",
        "Jimmy"])

    let family4 = Set([
        "Ricky",
        "Walker",
        "Texas Ranger",
        "Carly"
        ])

    // Create an empty set
    var emptySet = Set<String>()

    lazy var sets = [family1, family2, family3, family4]

    // loop over all sets and combine
    func union() -> Set<String>  {
        for set in sets{
            emptySet.formUnion(set)
        }
        return emptySet
    }

    // use the loop to combine the sets
    lazy var bigFamily = self.union()

    // convert the sets back into an Array
    lazy var wholeFamilyArray = Array(bigFamily)

    // Create a Dictionary to hold the Santas: Receivers
    var santasDict: [String: String] = [:]

    // copy the FamilyArray into an array that will continually decrease as receivers are chosen
    lazy var availableMembers = wholeFamilyArray


    func getSantas(members: [String], available: inout [String]) -> [String: String] {

        for santa in members {
            // Generate randomIndex number
            func random() -> Int{
                let randomNum = Int(arc4random_uniform(UInt32(available.count)))
                return randomNum
            }
            var randomIndex = random()

            // assign the recipient to the availableArrays index
            var recipient = available[randomIndex]


            // check that the recipient & the santa are not in the same family set - may be a better way to rewrite this, but it guarantees each time that recipient wont be reset to a member of their set
//            while family1.contains(santa) && family1.contains(recipient) {
//                recipient = available[random()]
//            }
            while family2.contains(santa) && family2.contains(recipient) {
                recipient = available[random()]
            }
            while family3.contains(santa) && family3.contains(recipient) {
                recipient = available[random()]
            }
            while family4.contains(santa) && family4.contains(recipient) {
                recipient = available[random()]
            }

            // Check to make sure the recipient isnt also the santa
            while available[randomIndex] == santa {
                randomIndex = random()
            }


            // prevent the last family member available from also being the last santa
            if available.count == 2 {
                let remainingIndex = randomIndex == 1 ? 0 : 1
                if available[remainingIndex] == members.last! {
                    randomIndex = remainingIndex
                }
            }

            // append to the SantasDict
            santasDict.updateValue(recipient, forKey: santa)

            // remove the family member if they've been chosen
            available.remove(at: randomIndex)
        }
        return santasDict
    }
    
}
