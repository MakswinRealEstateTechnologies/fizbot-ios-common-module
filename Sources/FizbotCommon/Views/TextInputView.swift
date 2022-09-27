//
//  TextInputView.swift
//  
//
//  Created by Alkın Çakıralar on 27.09.2022.
//

import SwiftUI

public struct TextInputView: View {
    var placeholder: String
    @Binding var text: String
    var font: Font
    var color: Color
    var keyboardType: UIKeyboardType
    
    public init(placeholder: String,
         text: Binding<String> = .constant(""),
         font: Font,
         color: Color,
         keyboardType: UIKeyboardType = .default) {
        self.placeholder = placeholder
        self._text = text
        self.font = font
        self.color = color
        self.keyboardType = keyboardType
    }
    
    public var body: some View {
        TextField(placeholder.localized, text: $text)
            .font(font)
            .foregroundColor(color)
            .keyboardType(keyboardType)
    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView(placeholder: "Test", font: .F17R, color: .darkColor)
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Default preview")
    }
}
