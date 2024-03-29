import UIKit
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelNumber.text = "Player 1"
        dice.image = UIImage(named:"download")
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet var pigPics: UIImageView!
    @IBOutlet weak var dice: UIImageView!
    @IBOutlet weak var turnScore: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet var labelForDice: UILabel!
    @IBOutlet var labelNumber: UILabel!
    var play1or2: Bool = true
    var totalNumberPlayer1 = 0
    var totalNumberPlayer2 = 0
    var turnScoreVar = 0
    var rolls = 0
    //
    @IBAction func buttonPress(_ sender: Any) {
        let randomInt = Int.random(in: 1...6)
        let percentage = Int.random(in: 1...100)
        pigPics.image = percentage < 25 ? UIImage(named: "1") : percentage > 25 && percentage < 50 ? UIImage(named: "2") : percentage > 50 && percentage < 75 ? UIImage(named: "3") : UIImage(named: "4")
        if play1or2
        {
            if randomInt == 1 {
                labelForDice.text = "You rolled a \(randomInt)! Unforunately, you busted, but your total score, \(totalNumberPlayer1), is unchanged."
                Score.text = "Score: \(totalNumberPlayer2)"
                turnScore.text = "Turn Score: 0"
                rolls = 0
                play1or2.toggle()
                turnScoreVar = 0
                turnScore.text = "Turn Score: \(totalNumberPlayer2)"
                nextTurn.isEnabled = false;
                
                return
            } else {
                changeDice(roll: randomInt)
                if rolls == 0 {labelNumber.text = "Player 1"
                    nextTurn.isEnabled = true;
                }
                labelForDice.text = "You rolled a \(randomInt)!"
                turnScoreVar = randomInt + turnScoreVar
                turnScore.text = "Turn Score: \(turnScoreVar)"
                winCondition()
            }
            rolls += 1
        }
        if !play1or2
        {
            if randomInt == 1 {
                changeDice(roll: 1)
                labelForDice.text = "You rolled a \(randomInt)! Unforunately, you busted, but your total score, \(totalNumberPlayer2), is unchanged."
                Score.text = "Score: \(totalNumberPlayer1)"
                play1or2.toggle()
                rolls = 0
                turnScoreVar = 0
                nextTurn.isEnabled = false;
                return
            } else {
                changeDice(roll: randomInt)
                if rolls == 0 {labelNumber.text = "Player 2"
                    nextTurn.isEnabled = true;
                }
                labelForDice.text = "You rolled a \(randomInt)!"
                turnScoreVar += randomInt
                turnScore.text = "Turn Score: \(turnScoreVar)"
                winCondition()
            }
            rolls += 1
        }
        //
    }
    @IBAction func nextPlayerTurn(_ sender: Any)
    {
        
        if (play1or2)
        {
            totalNumberPlayer1 += turnScoreVar
            Score.text = "Score: \(totalNumberPlayer2)"
            labelNumber.text = "Player 2"
        }
        else
        {
            totalNumberPlayer2 += turnScoreVar
            Score.text = "Score: \(totalNumberPlayer1)"
            labelNumber.text = "Player 1"
        }
        play1or2.toggle();
        //labelNumber.text = play1or2 ? "Player 1" : "Player 2"
        turnScoreVar = 0
        turnScore.text = "Turn Score: \(turnScoreVar)"
        winCondition()
    }
    func changeDice(roll:Int)
    {
        switch roll {
        case 1:
            dice.image = UIImage(named:"Dice1")
        case 2:
            dice.image = UIImage(named:"Dice2")
        case 3:
            dice.image = UIImage(named:"Dice3")
        case 4:
            dice.image = UIImage(named:"Dice4")
        case 5:
            dice.image = UIImage(named:"Dice5")
        case 6:
            dice.image = UIImage(named:"Dice6")
        default:
            dice.image = UIImage(named: "download")
        }
        
    }
    //
    @IBOutlet weak var nextTurn: UIButton!
    @IBOutlet weak var rollDice: UIButton!
    func winCondition()
    {
        if(totalNumberPlayer1 > 20)
        {
            labelForDice.text = "Player 1 won with " + (String)(totalNumberPlayer1) + " points!"
            rollDice.isEnabled = false;
            nextTurn.isEnabled = false;
            
        }
            
        else if(totalNumberPlayer2 > 20)
        {
            labelForDice.text =  "Player 2 won with " + (String)(totalNumberPlayer2) + " points!"
            rollDice.isEnabled = false;
            nextTurn.isEnabled = false;
        }
    }
    
}
