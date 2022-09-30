//
//  AlertViewManager.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import SwiftUI

public class AlertViewManager : ObservableObject {
        
    @Published public var state: Bool = false
    @Published var configuration: AlertViewConfiguration = .init()
    
    public func showErrorAlert() {
        configuration = .init(type: .Error, message: "shared_unexpected_error", buttons: [
            .createDefaultPositiveButton {
                self.dismissAlert()
            }
        ])
        presentAlert()
    }
    
    public func showErrorAlert(onClick: @escaping () -> Void) {
        configuration = .init(type: .Error, message: "shared_unexpected_error", buttons: [
            .createDefaultPositiveButton {
                self.dismissAlert {
                    onClick()
                }
            }
        ])
        presentAlert()
    }
    
    public func showErrorAlert(message: String) {
        configuration = .init(type: .Error, message: message, buttons: [
            .createDefaultPositiveButton {
                self.dismissAlert()
            }
        ])
        presentAlert()
    }
    
    public func showSuccessAlert(message: String) {
        configuration = .init(type: .Success, message: message, buttons: [
            .createDefaultPositiveButton {
                self.dismissAlert()
            }
        ])
        presentAlert()
    }
    
    public func showSuccessAlert(message: String, onClick: @escaping () -> Void) {
        configuration = .init(type: .Success, message: message, buttons: [
            .createDefaultPositiveButton {
                self.dismissAlert {
                    onClick()
                }
            }
        ])
        presentAlert()
    }
    
    public func showAlert(configuration: AlertViewConfiguration) {
        self.configuration = configuration
        presentAlert()
    }
    
    private func presentAlert() {
        withAnimation(.spring()) {
            state = true
        }
    }
    
    public func dismissAlert(onDismissed: @escaping () -> Void) {
        withAnimation {
            state = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            onDismissed()
        })
    }
    
    public func dismissAlert() {
        withAnimation {
            state = false
        }
    }
    
    public init() {
        
    }
    
}
