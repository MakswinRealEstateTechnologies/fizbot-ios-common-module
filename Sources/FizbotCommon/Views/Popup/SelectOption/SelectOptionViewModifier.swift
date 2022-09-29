//
//  SelectOptionViewModifier.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import SwiftUI

public struct SelectOptionViewModifier: ViewModifier {
    
    @ObservedObject var selectOptionViewManager: SelectOptionViewManager
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            PopupView(isShowing: $selectOptionViewManager.state) {
                SelectOptionView(configuration: selectOptionViewManager.configuration)
            }
        }
    }
    
}

extension View {
    public func selectOptionView(with selectOptionViewManager: SelectOptionViewManager) -> some View {
        self.modifier(SelectOptionViewModifier(selectOptionViewManager: selectOptionViewManager))
    }
}
