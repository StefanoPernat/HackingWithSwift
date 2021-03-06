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
    var progressView: UIProgressView!
    var websites = [String]()
    
    // MARK: - ViewController callbacks
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebsites()
        
        // set buttons
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let url = URL(string: "https://\(websites[0])")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // not the case but remember to unregister the observer when finished
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    // - MARK: methods
    @objc func openTapped() {
        let websiteSelectionAlertController = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        
        for website in websites {
            websiteSelectionAlertController.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        websiteSelectionAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        websiteSelectionAlertController.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        
        present(websiteSelectionAlertController, animated: true, completion: nil)
    }
    
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://\(action.title!)")!
        webView.load(URLRequest(url: url))
    }
    
    func loadWebsites() {
        let websitesPath = Bundle.main.path(forResource: "websites", ofType: "txt")
        
        if let allowedWebsites = try? String(contentsOfFile: websitesPath!) {
            websites = allowedWebsites.components(separatedBy: "\n")
        } else {
            websites = ["apple.com", "hackingwithswift.com", "learning-rust.github.io"]
        }
        
    }
}

extension BrowserController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in websites {
                if host.range(of: website) != nil {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        
        decisionHandler(.cancel)
    }
}
