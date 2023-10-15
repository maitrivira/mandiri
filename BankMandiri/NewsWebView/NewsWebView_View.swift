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
    
    private let webView: WKWebView = {
        let preference = WKWebpagePreferences()
        preference.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preference
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    private let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DETAIL"
        view.addSubview(webView)
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}

extension NewsWebViewViewController: NewsWebView_View_Protocol {
    func reloadWeb(link: String) {
        let url = URL(string: link)!
        webView.load(URLRequest(url: url))
    }
}
