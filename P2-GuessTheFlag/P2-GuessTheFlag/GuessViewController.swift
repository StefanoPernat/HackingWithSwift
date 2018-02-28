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
    
    // - MARK: Properties
    var countries = [
        "estonia", "france", "germany", "ireland", "italy", "monaco",
        "nigeria", "poland", "russia", "spain", "uk", "us"
    ]
    var score = 0
    
    // - MARK: ViewController callback methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setFlagsAppearance(with: UIColor.lightGray)
        askQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // - MARK: functions
    func askQuestion() {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
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
}

