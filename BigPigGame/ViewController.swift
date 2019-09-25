//
//  ViewController.swift
//  BigPigGame
//
//  Created by Kulkarni, Shaunak S on 9/23/19.
//  Copyright © 2019 Kulkarni, Shaunak S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var labelForDice: UILabel!
    //     
    var randomInt = Int.random(in: 1...6)
    var totalNumber = 0
    @IBAction func buttonPress(_ sender: Any) {
        if randomInt == 1 {
            labelForDice.text = "You rolled a \(randomInt)! Unforunately, you busted, but your total score, \(totalNumber), is unchanged. "
        } else {
            labelForDice.text = "You rolled a \(randomInt)!"
            totalNumber = randomInt + totalNumber
        }
    }
}

