//
//  File.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import SwiftUI

public struct AlertView: View {
    
    var configuration: AlertViewConfiguration
    
    public var body: some View {
        VStack(alignment: .center) {
            configuration.icon
            Spacer().frame(height: 22)
            TextView(text: configuration.message, font: .F15SB, color: .darkColor).multilineTextAlignment(.center).lineSpacing(5.0)
            Spacer().frame(height: 42)
            ForEach(configuration.buttons) { item in
                ButtonView(title: item.title, type: item.type, height: 44) {
                    item.onClick()
                }
                Spacer().frame(height: 22)
            }
        }.frame(maxWidth: .infinity)
            .padding([.top, .leading, .trailing], 22)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(configuration: .init(type: .Success, message: "OpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdationsOpasdations", buttons: [
            .createDefaultPositiveButton(positiveMessage: "Option 1", onClick: {
                
            }),
            .createDefaultPositiveButton(positiveMessage: "Option 2", onClick: {
                
            }),
            .createDefaultNegativeButton {
                
            }
        ])) .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Default preview")
    }
}
