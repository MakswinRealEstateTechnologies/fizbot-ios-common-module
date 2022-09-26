//
//  LoadingViewManager.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//

import SwiftUI

public class LoadingViewManager : ObservableObject {
    
    @Published public var alpha: Int = 0
    
    public func present() {
        if alpha == 1 { return }
        withAnimation(.easeInOut(duration: 0.5)) {
            self.alpha = 1
        }
    }
    
    public func dismiss() {
        if alpha == 0 { return }
        withAnimation(.easeInOut(duration: 0.5)) {
            self.alpha = 0
        }
    }
    
    public init() {
        
    }

}
