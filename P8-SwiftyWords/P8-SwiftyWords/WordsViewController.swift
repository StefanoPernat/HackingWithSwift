//
//  ViewController.swift
//  P8-SwiftyWords
//
//  Created by Stefano Pernat on 27/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

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
    
    var score = 0
    var level = 1
    
    // - MARK: ViewController callback methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // - MARK: IBActions
    @IBAction func submitTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
    }
    
    // - MARK: Methods
    @objc func letterTapped(_ sender: UIButton) {
        print("tapped button!")
    }
    
    fileprivate func initButtons() {
        for subview in view.subviews where subview.tag == 1001 {
            let button = subview as! UIButton
            letterButtons.append(button)
            button.addTarget(self, action: #selector(letterTapped(_:)), for: .touchUpInside)
        }
    }
}

