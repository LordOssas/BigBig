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
    let randomInt = Int.random(in: 1...6)
    @IBAction func buttonPress(_ sender: Any) {
        
    }
    
}

