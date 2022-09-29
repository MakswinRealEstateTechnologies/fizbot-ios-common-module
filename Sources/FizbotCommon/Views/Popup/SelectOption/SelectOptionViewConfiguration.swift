//
//  SelectOptionViewConfiguration.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import Foundation
import SwiftUI

public struct SelectOptionViewConfiguration {
    var type: SelectOptionViewType = .NA
    
    var options: [SelectOption] {
        switch type {
            case .HelpDesk:
                return [
                    .init(title: "Whatsapp", image: Image("item_option_wp"), onClick: {
                        self.onOptionClicked(0)
                    }),
                    .init(title: "help_page_live_desk", image: Image("item_option_user"), onClick: {
                        self.onOptionClicked(1)
                    })
                ]
            case .NA:
                return []
        }
    }
    
    var onOptionClicked: (Int) -> Void
    
    struct SelectOption : Identifiable {
        let id = UUID()
        var title: String
        var image: Image
        var onClick: () -> Void
    }
    
    public enum SelectOptionViewType {
        case HelpDesk
        case NA
    }
}
