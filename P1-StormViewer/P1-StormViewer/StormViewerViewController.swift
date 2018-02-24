//
//  StormViewerViewController.swift
//  P1-StormViewer
//
//  Created by Stefano Pernat on 24/02/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class StormViewerViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
//                print(item)
                pictures.append(item)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

