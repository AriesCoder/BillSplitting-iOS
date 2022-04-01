//
//  ResultViewController.swift
//  Bill Splitting
//
//  Created by Aries Lam on 3/31/22.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var resultAmount = 0.0
    var numOfPeople = 2
    var tip = "10%"
    var totalAmount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        resultLabel.text = String(format: "$ %.2f", resultAmount)
        detailLabel.text = "\(totalAmount) is splitted between \(numOfPeople) people, with \(tip) tip"
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}
