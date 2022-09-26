//
//  LoadingViewModifier.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//

import SwiftUI

public struct LoadingViewModifier: ViewModifier {
    
    @ObservedObject var loadingViewManager: LoadingViewManager
    
    public func body(content: Content) -> some View {
        content.overlay(
            LoadingView().opacity(Double(loadingViewManager.alpha))
        )
    }
    
}

extension View {
    public func loading(with loadingViewManager: LoadingViewManager) -> some View {
        self.modifier(LoadingViewModifier(loadingViewManager: loadingViewManager))
    }
}
