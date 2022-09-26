//
//  WebView.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//

import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
 
    var url: URL
    var finishedLoading: Binding<Bool>
    
    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            withAnimation {
                parent.finishedLoading.wrappedValue = true
            }
        }
    }
        
    func makeCoordinator() -> WebView.Coordinator {
        Coordinator(self)
    }
 
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.navigationDelegate = context.coordinator
        webView.load(request)
    }
}
