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
        
        // set buttons
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // - MARK: methods
    @objc func openTapped() {
        let websiteSelectionAlertController = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        
        websiteSelectionAlertController.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        websiteSelectionAlertController.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        websiteSelectionAlertController.addAction(UIAlertAction(title: "Learning Rust", style: .default, handler: openPage))
        websiteSelectionAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        websiteSelectionAlertController.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        
        present(websiteSelectionAlertController, animated: true, completion: nil)
    }
    
    func openPage(action: UIAlertAction) {
        if action.title?.lowercased() == "learning rust" {
            let url = URL(string: "https://learning-rust.github.io")!
            webView.load(URLRequest(url: url))
        } else {
            let url = URL(string: "https://\(action.title!)")!
            webView.load(URLRequest(url: url))
        }
    }
}

extension BrowserController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
