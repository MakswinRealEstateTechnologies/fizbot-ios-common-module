//
//  LoadingView.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//

import SwiftUI

struct LoadingView: View {
    let isPresenting: Bool
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }
    
    var body: some View {
        ZStack {
            Color.white
                .opacity(0.8)
            LottieView(
                name: "loading_animation",
                loopMode: .loop
            ).frame(width: 175, height: 175)
        }.ignoresSafeArea()
            .opacity(isPresenting ? 1.0 : 0.0)
            .animation(Animation.easeInOut(duration: 0.3), value: isPresenting)
    }
}
