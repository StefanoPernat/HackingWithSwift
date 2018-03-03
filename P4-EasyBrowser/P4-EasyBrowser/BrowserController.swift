//
//  ViewController.swift
//  P4-EasyBrowser
//
//  Created by Stefano Pernat on 02/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit
import WebKit

class BrowserController: UIViewController {

    // MARK: - Properties
    var webView: WKWebView!
    
    // MARK: - ViewController callbacks
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // - MARK: methods
    func openTapped() {
        let websiteSelectionAlertController = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        
        websiteSelectionAlertController.addAction(UIAlertAction(title: "apple.com", style: .default, handler: nil))
        websiteSelectionAlertController.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: nil))
        websiteSelectionAlertController.addAction(UIAlertAction(title: "Learning Rust", style: .default, handler: nil))
        websiteSelectionAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(websiteSelectionAlertController, animated: true, completion: nil)
    }
}

extension BrowserController: WKNavigationDelegate {
    
}
