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

    // MARK: - Properites
    var selectedPetition: Petition?
    var webview: WKWebView!
    
    // MARK: - VC Callback Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        webview = WKWebView()
        view = webview
        
        guard let petition = selectedPetition else {
            return
        }
        
        petitionToHtml(petition.body)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private methods
    fileprivate func petitionToHtml(_ petitionBody: String) {
        var html    =   "<html>"
        
            html    +=  "<head>"
            html    +=  "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
            html    +=  "<style>"
            html    +=  "body {font-size: 150%}"
            html    +=  "</style>"
            html    +=  "</head>"
            html    +=  "<body>"
            html    +=  petitionBody
            html    +=  "</body>"
            html    +=  "</html>"
        
        webview.loadHTMLString(html, baseURL: nil)
        
    }
}
