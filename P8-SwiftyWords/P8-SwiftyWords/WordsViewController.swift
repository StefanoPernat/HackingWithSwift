//
//  ViewController.swift
//  P8-SwiftyWords
//
//  Created by Stefano Pernat on 27/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit
import GameKit

class WordsViewController: UIViewController {
    
    // - MARK: IBOutlets
    @IBOutlet weak var cluesLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var currentAnswer: UITextField!
    
    // - MARK: Properties
    var letterButtons = [UIButton]()
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    
    var score = 0 {
        didSet {
            if score >= 0 {
                scoreLabel.text = "Score: \(score)"
            }
        }
    }
    var level = 1
    
    // - MARK: ViewController callback methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initButtons()
        loadLevel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // - MARK: IBActions
    @IBAction func submitTapped(_ sender: UIButton) {
        if let solutionPosition = solutions.index(of: currentAnswer.text!) {
            activatedButtons.removeAll()
            var splitAnswers = answersLabel.text!.components(separatedBy: "\n")
            splitAnswers[solutionPosition] = currentAnswer.text!
            answersLabel.text = splitAnswers.joined(separator: "\n")
            
            currentAnswer.text = ""
            score += 1
            
            if score % 7 == 0 {
                let nextLevelAlertController = UIAlertController(title: "Well done", message: "Are you ready for the next level?", preferredStyle: .alert)
                nextLevelAlertController.addAction(UIAlertAction(title: "Let's go", style: .default, handler: levelUp))
                present(nextLevelAlertController, animated: true)
            }
        } else {
            score -= 1
            if score >= 0 {
                let wrongAnswerAlertController = UIAlertController(title: "Wrong Answer", message: "Incorrect guess", preferredStyle: .alert)
                wrongAnswerAlertController.addAction(UIAlertAction(title: "Try again", style: .default, handler: clearAfterWrongAnswer))
                present(wrongAnswerAlertController, animated: true)
            } else {
                let lostAlertController = UIAlertController(title: "You lost", message: "Try again", preferredStyle: .alert)
                lostAlertController.addAction(UIAlertAction(title: "OK", style: .default, handler: forceNewGame))
                present(lostAlertController, animated: true)
            }
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        currentAnswer.text = ""
        for btn in activatedButtons {
            btn.isHidden = false
        }
        activatedButtons.removeAll()
    }
    
    // - MARK: Methods
    @objc func letterTapped(_ sender: UIButton) {
        currentAnswer.text = currentAnswer.text! + sender.titleLabel!.text!
        activatedButtons.append(sender)
        sender.isHidden = true
    }
    
    fileprivate func initButtons() {
        for subview in view.subviews where subview.tag == 1001 {
            let button = subview as! UIButton
            letterButtons.append(button)
            button.addTarget(self, action: #selector(letterTapped(_:)), for: .touchUpInside)
        }
    }
    
    func loadLevel() {
        var clueString = ""
        var solutionString = ""
        var letterBits = [String]()
        
        if let levelFilePath = Bundle.main.path(forResource: "level\(level)", ofType: ".txt") {
            if let levelContents = try? String(contentsOfFile: levelFilePath) {
                var lines = levelContents.components(separatedBy: "\n")
                lines = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: lines) as! [String]
                
                for (index, line) in lines.enumerated() {
                    let parts = line.components(separatedBy: ":")
                    let answer = parts[0]
                    let clue = parts[1]
                    
                    clueString += "\(index + 1). \(clue)\n"
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(solutionWord.count) letters\n"
                    solutions.append(solutionWord)
                    
                    letterBits += answer.components(separatedBy: "|")
                }
            }
        }
        
        cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
        answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
        letterBits = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: letterBits) as! [String]
        
        if letterBits.count == letterButtons.count {
            for i in 0..<letterBits.count {
                letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }
    }
    
    func levelUp(action: UIAlertAction) {
        level += 1
        solutions.removeAll(keepingCapacity: true)
        
        loadLevel()
        
        for btn in letterButtons {
            btn.isHidden = false
        }
    }
    
    func forceNewGame(action: UIAlertAction) {
        level = 1
        score = 0
        
        solutions.removeAll(keepingCapacity: true)
        activatedButtons.removeAll(keepingCapacity: true)
        currentAnswer.text = ""
        
        for button in letterButtons {
            button.isHidden = false
        }
        
        loadLevel()
    }
    
    func clearAfterWrongAnswer(action: UIAlertAction) {
        for btn in activatedButtons {
            btn.isHidden = false
        }
        
        activatedButtons.removeAll(keepingCapacity: true)
        
        currentAnswer.text = ""
    }
}

