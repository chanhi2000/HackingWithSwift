//
//  ViewController.swift
//  project04
//
//  Created by LeeChan on 5/24/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    let websites = ["hackingwithswift.com", "apple.com"]
    
    lazy var webView: WKWebView = {
        let wv = WKWebView()
        wv.navigationDelegate = self
        return wv
    }()
    
    let progressView: UIProgressView = {
        let pv = UIProgressView(progressViewStyle: .default)
        pv.sizeToFit()
        return pv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WKWebView"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let progressButton = UIBarButtonItem(customView: progressView)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        setupWebView()
    }
    
    fileprivate func setupWebView() {
        let url = URL(string: websites[0])!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        view = webView
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    func openTapped() {
        let ac = UIAlertController(title: "Open a page...", message: nil, preferredStyle: .actionSheet)
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }
    
    
    // MARK: - WKWebView
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        /**
         *  This factory method decides whether the page should be loaded or not.
         */
        
        let url = navigationAction.request.url
        
        if let host = url!.host {
            // if there's a host found for this url...
            for website in websites {
                if host.range(of: website) != nil {
                    // if there exists a safe website somewhere in a host name...
                    decisionHandler(.allow)
                    return
                }
            }
        }
        
        decisionHandler(.cancel)
    }

}

