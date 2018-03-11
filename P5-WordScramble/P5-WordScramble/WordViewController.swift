//
//  ViewController.swift
//  P5-WordScramble
//
//  Created by Stefano Pernat on 03/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

// EDITS
// 1    Disallow Answer that are shorter than 3 letters, or empty string

import UIKit
import GameplayKit

class WordViewController: UITableViewController {

    // - MARK: Properties
    var allWords = [String]()
    var usedWords = [String]()
    
    // - MARK: View Controller callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        readAllWords()
        startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // - MARK: tableview methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }

    // - MARK: utility methods
    fileprivate func readAllWords() {
        if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt") {
            if let startWords = try? String(contentsOfFile: startWordsPath) {
                allWords = startWords.components(separatedBy: "\n")
            } else {
                allWords = ["silkworm"]
            }
        }
    }
    
    func startGame() {
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
        title = allWords[0]
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = title!.lowercased()
        
        for letter in word {
            if let pos = tempWord.range(of: String(letter)) {
                tempWord.remove(at: pos.lowerBound)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        if word == "" || word.count < 3{
            return false
        }
        
        let checker = UITextChecker()
        let range = NSMakeRange(0, word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func submit(answer: String) {
        let lowerCasedAnswer = answer.lowercased()
        let errorTitle: String
        let errorMessage: String
        
        if isPossible(word: lowerCasedAnswer)  {
            if isOriginal(word: lowerCasedAnswer) {
                if isReal(word: lowerCasedAnswer) {
                    usedWords.insert(answer, at: 0)
                    tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                    return
                } else {
                    errorTitle = "Word not recognised"
                    errorMessage = "You can't just make them up, you know!"
                }
            } else {
                errorTitle = "Word used already"
                errorMessage = "Be more original!"
            }
        } else {
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from '\(title!.lowercased())'!"
        }
        
        let errorAlertController = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(errorAlertController, animated: true)
    }
    
    @objc func promptForAnswer() {
        let answerAlertController = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        answerAlertController.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [unowned self, answerAlertController] _ in
            let answer = answerAlertController.textFields![0]
            self.submit(answer: answer.text!)
        }
        
        answerAlertController.addAction(submitAction)
        present(answerAlertController, animated: true)
    }
}
