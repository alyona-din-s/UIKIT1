//
//  UIKitTutorialWebViewController.swift
//  Test_1
//
//  Created by admin_user on 29/08/24.
//

import Foundation
import WebKit
 
class UIKitTutorialWebViewController: UIViewController, WKNavigationDelegate{
    
    var webView: WKWebView!
 
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let url = URL(string: "https://www.google.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
