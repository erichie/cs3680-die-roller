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
    
    var sideCount: Int = 4
    var diceCount: Int = 1
    var diceResults: [Int] = []
    var diceTotal: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the labels text equal to the minimum values
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
        self.diceResults = []
        for _ in 1...diceCount {
            let diceRoll = Int(arc4random_uniform(UInt32(self.sideCount)) + 1)
            self.diceResults.append(diceRoll)
        }
        self.diceTotal = self.diceResults.reduce(0, +)
        totalLabel.text = String(self.diceTotal)
        diceTotalTitleLabel.isHidden = false
        totalLabel.isHidden = false
        
        print(self.diceResults, self.diceTotal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

