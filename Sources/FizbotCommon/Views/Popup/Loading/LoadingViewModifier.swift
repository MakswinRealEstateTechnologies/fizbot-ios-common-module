//
//  LoadingViewModifier.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//

import SwiftUI

struct LoadingViewModifier: ViewModifier {
        
    let isPresenting: Bool
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }
    
    func body(content: Content) -> some View {
        content.overlay(
//            EmptyView()
//                .fullScreenCover(isPresented: .constant(isPresenting), content: {
//
//                })
//                .transaction({ transaction in
//                    transaction.disablesAnimations = true
//                })
            LoadingView(isPresenting: isPresenting)
        )
    }
    
}

extension View {
    public func loading(isPresenting: Bool) -> some View {
        self.modifier(LoadingViewModifier(isPresenting: isPresenting))
    }
}
