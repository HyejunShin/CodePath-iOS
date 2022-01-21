//
//  ViewController.swift
//  Prework
//
//  Created by Hyejun Shin on 1/21/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipOtherTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        billAmountTextField.addTarget(self, action: #selector(ViewController.calculateTip(_:)), for: .editingChanged)
        
        tipOtherTextField.addTarget(self, action: #selector(ViewController.calculateOtherTip(_:)), for: .editingChanged)
    }

    @IBAction func calculateTip(_ sender: Any) {
        // get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15,0.18,0.2]
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill+tip
        
        // update tip Tip Amount Label
        tipAmountLabel.text = String(format:"$%.2f",tip)
        // update total amount
        totalLabel.text = String(format:"$%.2f",total)
        // make tipOtherTextField empty
        tipOtherTextField.text = String()
        
    }
    
    @IBAction func calculateOtherTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentages = Double(tipOtherTextField.text!) ?? 0
        
        let tip = bill*tipPercentages/100
        let total = bill+tip
        
        // update tip Tip Amount Label
        tipAmountLabel.text = String(format:"$%.2f",tip)
        // update total amount
        totalLabel.text = String(format:"$%.2f",total)
    }
    
    
}

