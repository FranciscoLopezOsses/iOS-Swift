//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Francisco Lopez Osses on 24/01/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    // variables
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // display the result
        
        totalLabel.text = result
        
        // display a phrase that says tip% and the number of people
        
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip"
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        // go back to the previos view controller
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
