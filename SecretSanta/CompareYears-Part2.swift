//
//  File.swift
//  SecretSanta
//
//  Created by Jason Hilimire on 1/23/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import Foundation

// This code will run in a playground - but isnt set to run within this application

var family = ["Joe", "Mike", "John", "jaymie", "Sean", "Dad", "Mom"]


// Create a custom struct so that we can compare recipients easily
struct Custom: Equatable {
    var value: String
}


var santasDict: [String: Custom] = [:]


func getSantas(members: [String], available: inout [String]) -> [String: Custom]{
    for santa in members {
        // Generate randomIndex number
        var randomIndex = Int(arc4random_uniform(UInt32(available.count)))
        
        // Don't let a santa be assigned to themself
        while available[randomIndex] == santa {
            randomIndex = Int(arc4random_uniform(UInt32(available.count)))
        }
        
        // prevent the last family member available from also being the last santa
        if available.count == 2 {
            let remainingIndex = randomIndex == 1 ? 0 : 1
            if available[remainingIndex] == members.last! {
                randomIndex = remainingIndex
            }
        }
        var recipient = Custom(value: available[randomIndex])
        
        // append to the SantasDict
        santasDict.updateValue(recipient, forKey: santa)
        
/*
         non functional as it doesnt account for all 3 years, but also there is an issue where the recipients can occur multiple times in the same list
         year1 = santasDict // needs to be declared
 
         for (key, value) in year1 {
            for (key2, val2) in year2 {
                if (key, value) == (key2, val2) {
                    print("there's a dup & it is \(key), giving to \(value) multiple times")
                    recipient = Custom(value: available[randomIndex])
                }
            }
         }
 
         year1.updateValue(recipient, forKey: santa)
        
  */
        // remove the family member if they've been chosen
        available.remove(at: randomIndex)
        print("\(santa) will be giving a gift to \(recipient)")
    }

    return santasDict
    //return year 1
}


// this resets our Data back to the beginning
func resetSantas() {
    availableFamily = family
    santasDict.removeAll()
}

// custom operand so can check if the Values are equal as they are now equatable
func == (lhs: Custom, rhs: Custom) -> Bool {
    if lhs.value == rhs.value {
        return true
    } else {
        return false
    }
}


/*

// Run the function for to get year1 data & then reset
var year1 = getSantas(members: family, available: &availableFamily)
resetSantas()

// Run the function for to get year2 data & then reset
var year2 = getSantas(members: family, available: &availableFamily)
resetSantas()

// Run the function for to get year1 data & then reset
var year3 = getSantas(members: family, available: &availableFamily)

// check for duplicates by comparing yearA to yearB - so we have to generate year1 and then compare to year2 & then again to compare against year 3 -- I'm struggling to run this inside the function at the moment
 
func checkDuplicatess(yearA: [String: Custom], yearB: [String: Custom] ) {
    for (key, value) in yearA {
        for (key2, val) in yearB {
            if (key, value) == (key2, val) {
                print("theres a dup & it is \(key), \(value) = \(key2), \(val)")
                // regenerate the recipient (change if to while to continue until no match)
            }
        }
    }
}

 */
 

