//
//  WebContentView.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//

import SwiftUI

public struct WebContentView: View {
    let url: String
    let animationName: String
    @State private var webViewFinishedLoading: Bool = false
    
    public init(url: String, animationName: String) {
        self.url = url
        self.animationName = animationName
    }
    
    public var body: some View {
        ZStack {
            WebView(url: URL(string: url)!,
                    finishedLoading: $webViewFinishedLoading)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            if !webViewFinishedLoading {
                LottieView(
                    name: animationName,
                    loopMode: .loop
                ).frame(width: 175, height: 175)
            }
        }
    }
}

struct WebContentView_Previews: PreviewProvider {
    static var previews: some View {
        WebContentView(url: "www.google.com", animationName: "loading_animation")
            .previewLayout(.sizeThatFits)
    }
}
