//
//  NewsWebView_View.swift
//  BankMandiri
//
//  Created by Maitri Vira on 13/10/23.
//

import Foundation
import UIKit
import WebKit

class NewsWebViewViewController: UIViewController, WKUIDelegate {
    var presenter: NewsWebView_Presenter_Protocol?
    
    override func viewDidLoad() {
        setupView()
    }
    
    public func setupView() {
        setupNavigation()
        let myWebView: WKWebView = WKWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        myWebView.uiDelegate = self
        self.view.addSubview(myWebView)
        
        let myURL = URL(string: "http://www.swiftdeveloperblog.com")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        myWebView.load(myURLRequest)
    }
    
    func setupNavigation() {
        self.navigationItem.title = "DETAIL"
    }
}

extension NewsWebViewViewController: NewsWebView_View_Protocol {
    
}
