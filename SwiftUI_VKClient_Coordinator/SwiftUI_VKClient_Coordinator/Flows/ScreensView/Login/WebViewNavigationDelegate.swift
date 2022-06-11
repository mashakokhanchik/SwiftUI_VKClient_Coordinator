//
//  WebViewNavigationDelegate.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import SwiftUI
import WebKit

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    
    // MARK: - Properties

    var viewModel: LoginViewModel?
    
    // MARK: - Methods
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse,
                                       decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let valye = param[1]
                dict[key] = valye
            return dict
            }
        
        guard let token = params["access_token"],
                let userIdString = params["user_id"],
                let _ = Int(userIdString)
        else {
            decisionHandler(.allow)
            return
        }
        
        viewModel!.token = token
        viewModel!.userId = userIdString
        viewModel!.isAutorized = true
        
        decisionHandler(.cancel)
    }

}

