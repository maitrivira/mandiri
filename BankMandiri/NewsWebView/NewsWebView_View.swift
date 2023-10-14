//
//  NewsWebView_View.swift
//  BankMandiri
//
//  Created by Maitri Vira on 13/10/23.
//

import Foundation
import UIKit
import WebKit

class NewsWebViewViewController: UIViewController, WKNavigationDelegate {
    var presenter: NewsWebView_Presenter_Protocol?
    
    var webView: WKWebView!
    var link: String? = "https://www.hackingwithswift.com"
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DETAIL"
        
        let url = URL(string: link ?? "")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

extension NewsWebViewViewController: NewsWebView_View_Protocol {
    
}
