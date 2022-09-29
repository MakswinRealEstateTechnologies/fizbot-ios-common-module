//
//  SelectOptionViewManager.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import SwiftUI

public class SelectOptionViewManager : ObservableObject {
        
    @Published public var state: Bool = false
        
    @Published var configuration: SelectOptionViewConfiguration = .init { _ in
        
    }
    
    public init() {
        
    }
    
    public func dismiss(onDismissed: @escaping () -> Void) {
        withAnimation {
            self.state = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            onDismissed()
        })
    }
    
    public func present() {
        withAnimation(.spring()) {
            self.state = true
        }
    }
    
    public func present(type: SelectOptionViewConfiguration.SelectOptionViewType,
                 onClick: @escaping (Int) -> Void) {
        self.configuration = .init(type: type, onOptionClicked: { index in
            self.dismiss {
                onClick(index)
            }
        })
        self.present()
    }
    
}
