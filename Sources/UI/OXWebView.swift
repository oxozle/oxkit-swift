//
//  OXWebView.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 17/10/2017.
//  Copyright © 2017 Oxozle. All rights reserved.
//

import UIKit
import WebKit

public class OXWebView: WKWebView {
    public init(configuration: WKWebViewConfiguration) {
        super.init(frame: CGRect.zero, configuration: configuration)
        
        let bundle = Bundle(for: type(of: self))
        let source = try! String(contentsOf: bundle.url(forResource: "OXWebView", withExtension: "js")!, encoding: String.Encoding.utf8)
        let userScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        configuration.userContentController.addUserScript(userScript)
        configuration.userContentController.add(self, name: "oxkithandler")
        
        translatesAutoresizingMaskIntoConstraints = false
        scrollView.decelerationRate = UIScrollViewDecelerationRateNormal
        
        navigationDelegate = self
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        uiDelegate = self
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func load(url: String) {
        if let startUrl = URL(string: url) {
            var request = URLRequest(url: startUrl)
            load(request)
        }
    }
}

extension OXWebView: WKScriptMessageHandler {
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
}

extension OXWebView: WKNavigationDelegate {
    public func webView(_ webView: WKWebView,
                 didFail navigation: WKNavigation,
                 withError error: Error) {
        print("webView:\(webView) didFailNavigation:\(navigation) withError:\(error)")
    }
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

extension OXWebView: WKUIDelegate {
    public func webView(_ webView: WKWebView,
                 runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping () -> Void) {
//        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        let ok = UIAlertAction(title: "OK", style: .default) { (_: UIAlertAction) -> Void in
//            alert.dismiss(animated: true, completion: nil)
//        }
//        alert.addAction(ok)
//        webViewDelegate?.webView(present: alert)
        completionHandler()
    }
    
    public func webView(_ webView: WKWebView,
                 runJavaScriptConfirmPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo,
                 completionHandler: @escaping (Bool) -> Void) {
//        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (_: UIAlertAction) -> Void in
//            completionHandler(false)
//        })
//        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_: UIAlertAction) -> Void in
            completionHandler(true)
//        })
//        webViewDelegate?.webView(present: alert)
    }
    
    @available(iOS 10.0, *)
    public func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
        return false
    }
}

