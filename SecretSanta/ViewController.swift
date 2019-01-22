//
//  ViewController.swift
//  SecretSanta
//
//  Created by Jason Hilimire on 1/21/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import UIKit

let family = ["Joe", "Mike", "John", "jaymie", "Sean"]

// Create an Empty array to keep track of all santa/recipient matches
var emptyDict: [String: String] = [:]

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func getSantas() {
        for santa in family {
            // Create an array to keep track of the available family members
            var availableFamily = family
            
            // Generate randomIndex number
            var randomIndex = Int(arc4random_uniform(UInt32(availableFamily.count)))
            
            // Don't let a santa be assigned to themself
            while availableFamily[randomIndex] == santa {
                randomIndex = Int(arc4random_uniform(UInt32(availableFamily.count)))
            }
            
            // prevent the last family member available from also being the last santa
            if availableFamily.count == 2 {
                let remainingIndex = randomIndex == 1 ? 0 : 1
                if availableFamily[remainingIndex] == family.last! {
                    randomIndex = remainingIndex
                }
            }
            
            let recipient = availableFamily[randomIndex]
            
            // append to the Assignment Array
            emptyDict.updateValue(recipient, forKey: santa)
            //        print("\(santa.name) will be giving a gift to \(recipient.name)")
            
            // remove the family member if they've been chosen
            availableFamily.remove(at: randomIndex)
            
        }
    }
    

    // reset the dictionary to empty
    func resetSantas() {
        emptyDict.removeAll()
    }


}

