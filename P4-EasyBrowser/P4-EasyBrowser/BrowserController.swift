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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension BrowserController: WKNavigationDelegate {
    
}
