//
//  PetitionDetailViewController.swift
//  P7-WhiteHousePetitions
//
//  Created by Stefano Pernat on 21/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit
import WebKit

class PetitionDetailViewController: UIViewController {

    var selectedPetition: Petition?
    var webview: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webview = WKWebView()
        view = webview
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}