//
//  SelectOptionView.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import SwiftUI

public struct SelectOptionView: View {
    
    var configuration: SelectOptionViewConfiguration
    
    public var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(configuration.options.enumerated()), id: \.offset) { index, item in
                Button {
                    item.onClick()
                } label: {
                    HStack(alignment: .center, spacing: 12) {
                        item.image
                        TextView(text: item.title, font: .F17R, color: .darkColor)
                        Spacer()
                    }
                    .frame(height: 70)
                    .frame(maxWidth: .infinity)
                    .border(width: index == (configuration.options.count - 1) ? 0 : 1, edges: [.bottom], color: .coolGray3)
                }
            }
        }.frame(maxWidth: .infinity)
            .padding([.leading, .trailing], 22)
    }
}

struct SelectOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectOptionView(configuration: .init(type: .HelpDesk, onOptionClicked: { index in
            
        }))
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Default preview")
    }
}
