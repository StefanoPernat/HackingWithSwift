//
//  ViewController.swift
//  P7-WhiteHousePetitions
//
//  Created by Stefano Pernat on 17/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class PetitionsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        PetitionsAPI.fetchMostRecent(limit: 100)
        PetitionsAPI.fetchMostSigned(threshold: 10_000, limit: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

