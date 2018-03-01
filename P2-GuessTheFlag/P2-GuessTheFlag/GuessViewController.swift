//
//  ViewController.swift
//  P2-GuessTheFlag
//
//  Created by Stefano Pernat on 27/02/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit
import GameplayKit

class GuessViewController: UIViewController {

    // - MARK: Outlets
    @IBOutlet weak var firstFlag: UIButton!
    @IBOutlet weak var secondFlag: UIButton!
    @IBOutlet weak var thirdFlag: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    // - MARK: Properties
    var countries = [
        "estonia", "france", "germany", "ireland", "italy", "monaco",
        "nigeria", "poland", "russia", "spain", "uk", "us"
    ]
    var correctAnswer = 0
    var score = 0
    
    // - MARK: ViewController callback methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setFlagsAppearance(with: UIColor.lightGray)
        askQuestion()
        scoreLabel.text = "Score: \(score)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // - MARK: IBActions
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
        } else {
            score -= 1
            title = "Wrong"
        }
        
        /*let scoreAlert = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        scoreAlert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(scoreAlert, animated: true)*/
        
        if score < 0 {  // force new game
            let gameFinishedAlert = UIAlertController(title: title, message: "You lost", preferredStyle: .alert)
            gameFinishedAlert.addAction(UIAlertAction(title: "New Game", style: .default, handler: newGame))
            present(gameFinishedAlert, animated: true, completion: nil)
        } else {
            scoreLabel.text = "Score: \(score)"
            askQuestion()
        }
    }
    
    // - MARK: functions
    func askQuestion(action: UIAlertAction! = nil) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        
        title = countries[correctAnswer].uppercased()
        
        firstFlag.setImage(UIImage(named: countries[0]), for: .normal)
        secondFlag.setImage(UIImage(named: countries[1]), for: .normal)
        thirdFlag.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    func setFlagsAppearance(with color: UIColor) {
        firstFlag.layer.borderWidth     = 1
        secondFlag.layer.borderWidth    = 1
        thirdFlag.layer.borderWidth     = 1
        
        firstFlag.layer.borderColor     = color.cgColor
        secondFlag.layer.borderColor    = color.cgColor
        thirdFlag.layer.borderColor     = color.cgColor
    }
    
    func newGame(action: UIAlertAction! = nil) {
        score = 0
        scoreLabel.text = "Score: \(score)"
        askQuestion()
    }
}

