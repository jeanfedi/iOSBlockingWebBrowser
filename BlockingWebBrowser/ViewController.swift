//
//  ViewController.swift
//  BlockingWebBrowser
//
//  Created by Phoedo on 01/08/2019.
//  Copyright © 2019 Phoedo. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController, WKNavigationDelegate, UIWebViewDelegate {
    var browser : WKWebView!
    var blockingSettings: BlockingSetting? = nil
    
    override func loadView() {
        super.loadView()
        browser = WKWebView()
        browser.navigationDelegate = self
        view = browser
        
        BlockerConfiguration().loadConfiguration(filename: "blockTrackers.json",completionHandler: { (contentRuleList, error) in
            
            if let error = error {
                return
            }
            
            let configuration = self.browser.configuration
            configuration.userContentController.add(contentRuleList!)
            let url = "http://phoedo.url.ph/test.html"
            let finalUrl = URL(string: url)!
            let request = URLRequest(url : finalUrl)
            self.browser.load(request)
        })
}





func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    print("NavigationAction: \(navigationAction.request.url?.absoluteString ?? "null")")
    
    decisionHandler(WKNavigationActionPolicy.allow)
    
    
    
}


func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
    print("NavigationResponse: \(navigationResponse.response.url?.absoluteString ?? "null")")
    decisionHandler(WKNavigationResponsePolicy.allow)
}

func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: ((WKNavigationActionPolicy) -> Void)) {
    print("NavigationResponse: \(navigationAction.request.url?.absoluteString ?? "null")")
    decisionHandler(WKNavigationActionPolicy.allow)
}


func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    print("Navigation1: \(navigation.debugDescription)")
    
}


func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
    print("Navigation2: \(navigation.debugDescription)")
    
    
}

func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    print("Navigation3: \(navigation.debugDescription)")
    
}

func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    print("Navigation4: \(navigation.debugDescription)")
    
}



func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("Navigation5: \(navigation.debugDescription)")
    
}


func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    print("Navigation6: \(navigation.debugDescription)")
    
    
}


func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
    print("Terminated")
    
}

}




