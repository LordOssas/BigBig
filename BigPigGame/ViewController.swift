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

   
    @IBOutlet var labelForDice: UILabel!
    @IBOutlet var labelNumber: UILabel!
    var play1or2: Bool = true
    var totalNumberPlayer1 = 0
    var totalNumberPlayer2 = 0
    //
    @IBAction func buttonPress(_ sender: Any) {
        labelNumber.text = "Player 1"
        let randomInt = Int.random(in: 1...6)
        if play1or2
        {
            if randomInt == 1 {
                labelForDice.text = "You rolled a \(randomInt)! Unforunately, you busted, but your total score, \(totalNumberPlayer1), is unchanged."
                labelNumber.text = "Player 2"
            } else {
                labelForDice.text = "You rolled a \(randomInt)!"
                totalNumberPlayer1 = randomInt + totalNumberPlayer1
            }
        }
        if !play1or2
        {
            if randomInt == 1 {
                labelForDice.text = "You rolled a \(randomInt)! Unforunately, you busted, but your total score, \(totalNumberPlayer2), is unchanged."
                labelNumber.text = "Player 2"

            } else {
                labelForDice.text = "You rolled a \(randomInt)!"
                totalNumberPlayer2 = randomInt + totalNumberPlayer2
            }
        }
        //
    }
    @IBAction func nextPlayerTurn(_ sender: Any) {
        var i = 0
        if i == 0 {
            play1or2 = false
            i = 1
        }
        if i == 1 {
            i = 0
            play1or2 = true
        }
    }
}

