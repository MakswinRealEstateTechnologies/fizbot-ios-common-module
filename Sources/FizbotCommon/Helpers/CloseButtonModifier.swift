//
//  CloseButtonModifier.swift
//  
//
//  Created by Alkın Çakıralar on 27.09.2022.
//

import SwiftUI

struct CloseButtonModifier: ViewModifier {
  func body(content: Content) -> AnyView {
    if #available(iOS 15, *) {
        return AnyView(content.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button {
                    UIApplication.shared.endEditing()
                } label: {
                    Text("shared_close".localized)
                        .font(.F15SB)
                        .padding([.leading, .trailing], 24)
                        .padding([.top, .bottom], 7)
                        .foregroundColor(.background)
                        .background(Color.darkBlue)
                        .cornerRadius(5, corners: .allCorners)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        })
    }
    else { return AnyView(content) }
  }
}

public extension View {
   @ViewBuilder
   func addCloseButtonToolbar() -> some View {
       if #available(iOS 15, *) {
           self.modifier(CloseButtonModifier())
       }
       else {
           self
       }
   }
}
