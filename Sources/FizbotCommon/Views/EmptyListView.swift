//
//  EmptyListView.swift
//  
//
//  Created by Alkın Çakıralar on 27.09.2022.
//

import Foundation
import SwiftUI

public enum EmptyListViewType {
    case UpComingTraining
    case PreviousTraining
    
    var title: String {
        switch self {
            case .UpComingTraining:
                return "empty_view_next_trainings_title"
            case .PreviousTraining:
                return "empty_view_previous_trainings_title"
        }
    }
    
    var description: String {
        switch self {
            case .UpComingTraining:
                return "empty_view_next_trainings_message"
            case .PreviousTraining:
                return "empty_view_previous_trainings_message"
        }
    }
    
    var image: Image {
        switch self {
            case .UpComingTraining:
                return Image("empty_view_next_trainings")
            case .PreviousTraining:
                return Image("empty_view_past_training")
        }
    }
}

public struct EmptyListView: View {
    
    var pageType: EmptyListViewType
    var hideImage: Bool = false
    
    public init(pageType: EmptyListViewType, hideImage: Bool) {
        self.pageType = pageType
        self.hideImage = hideImage
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 32) {
            if !hideImage {
                VStack {
                    pageType.image
                }.frame(width: 120, height: 120)
                 .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .stroke(Color.coolGray3, lineWidth: 1)
                 )
            }
            TextView(text: pageType.title, font: .F20SB, color: .darkColor)
                .lineSpacing(5.0)
                .multilineTextAlignment(.center)
            TextView(text: pageType.description, font: .F15R, color: .darkColor).lineSpacing(5.0)
                .multilineTextAlignment(.center)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(32)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView(pageType: .UpComingTraining, hideImage: false)
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Default preview")
    }
}
