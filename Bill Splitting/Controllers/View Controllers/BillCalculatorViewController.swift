//
//  BillCalculatorViewController.swift
//  Bill Splitting
//
//  Created by Aries Lam on 3/31/22.
//

import UIKit

class BillCalculatorViewController: UIViewController {

    @IBOutlet weak var billTotalField: UITextField!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var twentyLabel: UIButton!
    @IBOutlet weak var tenLabel: UIButton!
    @IBOutlet weak var zeroLabel: UIButton!
    @IBOutlet weak var calculateLabel: UIButton!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billPerPerson = 0.0
    var tipLabel = "10%"
    var totalAmount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zeroLabel.layer.cornerRadius = 15
        tenLabel.layer.cornerRadius = 15
        twentyLabel.layer.cornerRadius = 15
        calculateLabel.layer.cornerRadius = 15
        }
    @IBAction func tipBtnPressed(_ sender: UIButton) {
        zeroLabel.isSelected = false
        tenLabel.isSelected = false
        twentyLabel.isSelected = false
        
        sender.isSelected = true
        
        tip = Double(sender.currentTitle!.dropLast())!/100
        
        tipLabel = sender.currentTitle!
    }
    
    @IBAction func calculatedPressed(_ sender: Any){
        let billAmount = billTotalField.text!
        if billAmount != ""{
            totalAmount = Double(billAmount)!
        }
        
        billPerPerson = (totalAmount + totalAmount * tip) / Double(numberOfPeople)
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        peopleLabel.text = String(Int(sender.value))
        numberOfPeople = Int(sender.value)
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult"{
            let destination = segue.destination as!
            ResultViewController
            destination.resultAmount = billPerPerson
            destination.tip = tipLabel
            destination.numOfPeople = numberOfPeople
            destination.totalAmount = totalAmount
        }
    }


}
