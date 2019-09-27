import UIKit
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelNumber.text = "Player 1"
        // Do any additional setup after loading the view.
    }
    
    
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
        if play1or2
        {
            if randomInt == 1 {
                labelForDice.text = "You rolled a \(randomInt)! Unforunately, you busted, but your total score, \(totalNumberPlayer1), is unchanged."
                Score.text = "Score: \(totalNumberPlayer1)"
                rolls = 0
                play1or2.toggle()
                turnScoreVar = 0
                return
            } else {
                if rolls == 0 {labelNumber.text = "Player 1"}
                labelForDice.text = "You rolled a \(randomInt)!"
                turnScoreVar += randomInt
                turnScore.text = "Turn Score: \(turnScoreVar)"
            }
            rolls += 1
        }
        if !play1or2
        {
            if randomInt == 1 {
                labelForDice.text = "You rolled a \(randomInt)! Unforunately, you busted, but your total score, \(totalNumberPlayer2), is unchanged."
                Score.text = "Score: \(totalNumberPlayer2)"
                play1or2.toggle()
                rolls = 0
                turnScoreVar = 0
                return
            } else {
                if rolls == 0 {labelNumber.text = "Player 2"}
                labelForDice.text = "You rolled a \(randomInt)!"
                turnScoreVar += randomInt
                turnScore.text = "Turn Score: \(turnScoreVar)"
            }
            rolls += 1
        }
        //
    }
    @IBAction func nextPlayerTurn(_ sender: Any) {
        play1or2.toggle();
        labelNumber.text = play1or2 ? "Player 1" : "Player 2"
        if (play1or2) {totalNumberPlayer1 += turnScoreVar}
        else{totalNumberPlayer1 += turnScoreVar}
    }
    
    func winCondition() -> String
    {
        var returner: String
        if(totalNumberPlayer1 == 300)
        {
            returner = "Player1 won with " + (String)(totalNumberPlayer1) + " points!"
            return returner
        }
        else if(totalNumberPlayer2 == 300)
        {
            returner = "Player2 won with " + (String)(totalNumberPlayer2) + " points!"
            return returner
        }
        else {return "incorect calling of winCondition function."}
    }
    
    
}
