//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // variables
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        // dismiss the keyboard when the user finish tapping
        
        billTextField.endEditing(true)
        
        // change button background color when pressed
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // isSelected
        
        sender.isSelected = true
        
        // take the current title of buttons and use it for the math
        
        let buttonTitle = sender.currentTitle!
        
        // take out the last character (%)
        
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        
        // make the number a Double (decimal)
        
        let buttonTitleAsANumber =
            Double(buttonTitleMinusPercentSign)!
        
        // divide by 100 to keep a number for the posterior math
        
        tip = buttonTitleAsANumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        // take the stepper value, format it, and display it in the label
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        // change the var value for the sender value
        
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        // take the input number and make it a constant
        
        let bill = billTextField.text!
        
        // prevent from crashing
        
        if bill != "" {
            
            // make the input number a decimal number
            
            billTotal = Double(bill)!
            
            // actual split math
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            // result to String for display
            
            finalResult = String(format: "%.2f", result)
            
        }
        
        // when "calculate" button pressed pass to results view controller
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    // pass the result, the tip % and number of people to results view controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check for the correct segue
        
        if segue.identifier == "goToResults" {
            
            // establish destination view controller
            
            let destinationVC = segue.destination as! ResultsViewController
            
            // pass result
            
            destinationVC.result = finalResult
            
            // pass tip %
            
            destinationVC.tip = Int(tip * 100)
            
            // pass number of people
            
            destinationVC.split = numberOfPeople
            
        }
        
    }
    
}
