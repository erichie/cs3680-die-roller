//
//  ViewController.swift
//  ER Die Roller
//
//  Created by Edward Richards on 1/19/17.
//  Copyright © 2017 Edward Richards. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var sideCountLabel: UILabel!
    @IBOutlet var diceCountLabel: UILabel!
    @IBOutlet var diceTotalTitleLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var stack: UIStackView!
    
    var sideCount: Int = 4
    var diceCount: Int = 1
    var diceResults: [Int] = []
    var diceTotal: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the labels text equal to the minimum values and hide other labels
        sideCountLabel.text = "4"
        diceCountLabel.text = "1"
        diceTotalTitleLabel.isHidden = true
        totalLabel.isHidden = true
    }
    
    @IBAction func changeSidecount(sender: UIStepper) {
        self.sideCount = Int(sender.value)
        self.sideCountLabel.text = Int(sender.value).description
    }
    
    @IBAction func changeDicecount(sender: UIStepper) {
        self.diceCount = Int(sender.value)
        self.diceCountLabel.text = Int(sender.value).description
    }
    
    @IBAction func rollDice(sender: UIButton) {
        self.clearStack()
        self.diceResults = []
        
        for i in 1...diceCount {
            let diceRoll = Int(arc4random_uniform(UInt32(self.sideCount)) + 1)
            let diceNumLabel = "Dice #" + String(i) + ": "
            self.diceResults.append(diceRoll) // add the dice roll to the array of dice results
            
            // create a label to display the dice results
            let label = UILabel()
            label.textAlignment = .center
            label.text = diceNumLabel + String(diceRoll)
            self.stack.addArrangedSubview(label) // add the label to the vertical stack view
        }

        self.diceTotal = self.diceResults.reduce(0, +) // add up all the dice roll results
        
        // display all the labels and the sum of all the dice rolls
        totalLabel.text = String(self.diceTotal)
        diceTotalTitleLabel.isHidden = false
        totalLabel.isHidden = false
    }
    
    // clear the stack view of all the labels from the previous dice roll
    func clearStack() {
        for view in self.stack.subviews {
            view.removeFromSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

