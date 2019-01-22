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
        self.view.backgroundColor = #colorLiteral(red: 0.8325467957, green: 0.0001600589836, blue: 0.1570640221, alpha: 1)
        
    }
    
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBAction func resetBtnPressed(_ sender: Any) {
        fam.resetSantas()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pairsLabel.text = ""
    }
    
}

