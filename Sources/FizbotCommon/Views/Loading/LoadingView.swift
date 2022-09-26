//
//  LoadingView.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//

import SwiftUI

public struct LoadingView: View {
    public var body: some View {
        ZStack {
            Color.white
                .opacity(0.6)
            LottieView(
                name: "loading_animation",
                loopMode: .loop
            ).frame(width: 175, height: 175)
        }.ignoresSafeArea()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
