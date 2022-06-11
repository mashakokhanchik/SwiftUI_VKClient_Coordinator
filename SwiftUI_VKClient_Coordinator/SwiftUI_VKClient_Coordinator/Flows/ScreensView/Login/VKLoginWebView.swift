//
//  VKLoginWebView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 27.05.2022.
//

import SwiftUI
import WebKit

struct VKLoginWebView: UIViewRepresentable {
    
    // MARK: - Properties

    @ObservedObject var viewModel: LoginViewModel
    fileprivate let navigationDelegate = WebViewNavigationDelegate()
    
    // MARK: - Methods
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        navigationDelegate.viewModel = self.viewModel
        webView.navigationDelegate = navigationDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }
    
    // MARK: - Private methods
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: viewModel.clientId),
            URLQueryItem(name: "scope", value: "401502"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_url", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: viewModel.version)
        ]
        
        return components.url.map { URLRequest(url: $0) }
    }

}

