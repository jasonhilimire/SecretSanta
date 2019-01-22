//
//  Family.swift
//  SecretSanta
//
//  Created by Jason Hilimire on 1/21/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import Foundation

class Family {
    var family = ["Joe", "Mike", "John", "jaymie", "Sean"]

    
    var santasDict: [String: String] = [:]
    
    func getSantas(members: [String], available: [String]) -> [String: String] {
        for santa in members {
            var availableFamily = available
            // Generate randomIndex number
            var randomIndex = Int(arc4random_uniform(UInt32(availableFamily.count)))
            
            // Don't let a santa be assigned to themself
            while available[randomIndex] == santa {
                randomIndex = Int(arc4random_uniform(UInt32(availableFamily.count)))
            }
            
            // prevent the last family member available from also being the last santa
            if availableFamily.count == 2 {
                let remainingIndex = randomIndex == 1 ? 0 : 1
                if availableFamily[remainingIndex] == family.last! {
                    randomIndex = remainingIndex
                }
            }
            
            let recipient = available[randomIndex]
            
            // append to the Assignment Array
            santasDict.updateValue(recipient, forKey: santa)
            //        print("\(santa.name) will be giving a gift to \(recipient.name)")
            
            // remove the family member if they've been chosen
            availableFamily.remove(at: randomIndex)
        }
        return santasDict
    }
    
    
    // reset the dictionary to empty & resets availableFamily back to all Family members (family)
    func resetSantas() {
        santasDict.removeAll()
    }
    
    
    
}
