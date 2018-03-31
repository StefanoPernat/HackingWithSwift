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
    
    
    
    // - MARK: ViewController callback methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
}

