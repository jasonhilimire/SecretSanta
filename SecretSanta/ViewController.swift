//
//  ViewController.swift
//  SecretSanta
//
//  Created by Jason Hilimire on 1/21/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import UIKit

let fam = Family()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    @IBOutlet weak var matchBtn: UIButton!
    
    @IBOutlet weak var pairsLabel: UILabel!
    
    @IBAction func matchBtnPressed(_ sender: UIButton) {
        
        fam.getSantas(members: fam.family, available: &fam.family)
        pairsLabel.text = ("\(fam.santasDict)")

    }
    
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBAction func resetBtnPressed(_ sender: Any) {
        fam.resetSantas()
        pairsLabel.text = ""
    }
    
}

