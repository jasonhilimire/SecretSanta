//
//  ViewController.swift
//  SecretSanta
//
//  Created by Jason Hilimire on 1/21/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import UIKit

let fam = Family()
var availableFamily = fam.family

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    @IBOutlet weak var matchBtn: UIButton!
    
    @IBOutlet weak var pairsLabel: UILabel!
    
    @IBAction func matchBtnPressed(_ sender: UIButton) {
        
        fam.getSantas(members: fam.family, available: &availableFamily)
        setLabel()
        // disable the button because your available array is empty
        matchBtn.isEnabled = false
//        pairsLabel.text = ("\(fam.santasDict)")

    }
    
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBAction func resetBtnPressed(_ sender: Any) {
        resetSantas()
        pairsLabel.text = ""
    }
    
    func resetSantas() {
        availableFamily = fam.family
        fam.santasDict.removeAll()
        matchBtn.isEnabled = true
        print("The dict is empty \(fam.santasDict)")
    }
    
    func setLabel() {
        var displayDict = ""
        for (key, value) in fam.santasDict {
            displayDict += "\(key) will be giving a gift to: \(value)\n"
        }
        pairsLabel.text = displayDict
    }
    
}

