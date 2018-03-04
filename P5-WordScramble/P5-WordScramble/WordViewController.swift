//
//  ViewController.swift
//  P5-WordScramble
//
//  Created by Stefano Pernat on 03/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class WordViewController: UITableViewController {

    // - MARK: Properties
    var allWords = [String]()
    var usedWords = [String]()
    
    // - MARK: View Controller callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readAllWords()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}

