//
//  AlertViewConfiguration.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import SwiftUI

public struct AlertViewConfiguration {
    var type: AlertViewType = .Error
    var message: String = ""
    var buttons: [AlertViewButton] = []
    var icon: Image {
        switch self.type {
            case .Success:
                return Image("alert_dialog_success")
            case .Error:
                return Image("alert_dialog_warning")
            case .Question:
                return Image("alert_dialog_question")
        }
    }
    
    public init(type: AlertViewType, message: String, buttons: [AlertViewButton]) {
        self.type = type
        self.message = message
        self.buttons = buttons
    }
    
    public init(type: AlertViewType) {
        self.type = type
    }
    
    public init() {
        
    }
    
    public struct AlertViewButton: Identifiable {
        public let id = UUID()
        var type: ButtonViewType
        var title: String
        var onClick: () -> Void
        
        public init(type: ButtonViewType, title: String, onClick: @escaping () -> Void) {
            self.type = type
            self.title = title
            self.onClick = onClick
        }
        
        public static func createDefaultPositiveButton(positiveMessage: String = "shared_okay".localized, onClick: @escaping () -> Void) -> AlertViewButton {
            return .init(type: .Positive, title: positiveMessage, onClick: onClick)
        }
        
        public static func createDefaultNegativeButton(negativeMessage: String = "shared_cancel".localized, onClick: @escaping () -> Void) -> AlertViewButton {
            return .init(type: .Negative, title: negativeMessage, onClick: onClick)
        }
        
    }
    
    public enum AlertViewType {
        case Success
        case Error
        case Question
    }
}
