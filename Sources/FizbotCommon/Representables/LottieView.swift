//
//  LottieView.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//

import SwiftUI
import Lottie

public struct LottieView: UIViewRepresentable {
    var name = "success"
    var loopMode: LottieLoopMode = .loop
    
    public init(name: String = "success", loopMode: LottieLoopMode) {
        self.name = name
        self.loopMode = loopMode
    }

    public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
