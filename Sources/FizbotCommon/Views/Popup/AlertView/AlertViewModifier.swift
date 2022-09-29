//
//  AlertViewModifier.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import SwiftUI

public struct AlertViewModifier: ViewModifier {
    
    @ObservedObject var alertViewManager: AlertViewManager
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            PopupView(isShowing: $alertViewManager.state) {
                AlertView(configuration: alertViewManager.configuration)
            }.ignoresSafeArea()
        }.ignoresSafeArea()
    }
    
}

public extension View {
    func alert(with alertViewManager: AlertViewManager) -> some View {
        self.modifier(AlertViewModifier(alertViewManager: alertViewManager))
    }
}
