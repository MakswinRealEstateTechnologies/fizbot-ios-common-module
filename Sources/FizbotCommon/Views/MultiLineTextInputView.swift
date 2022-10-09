//
//  MultiLineTextInputView.swift
//  
//
//  Created by Alkın Çakıralar on 27.09.2022.
//

import SwiftUI

public struct MultiLineTextInputView: View {

    var placeholder: String
    @Binding var text: String
    var font: Font
    var color: Color
    @State private var isFocused = false

    public init(placeholder: String, text: Binding<String> = .constant(""), font: Font, color: Color) {
        self.placeholder = placeholder
        self._text = text
        self.font = font
        self.color = color
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            if !self.isFocused {
                TextView(text: placeholder, font: font, color: color)
            }
            TextEditor(text: $text)
                .font(font)
                .foregroundColor(color)
                .opacity(self.text.isBlank ? 0.50 : 1)
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                    isFocused = true
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                    isFocused = false
                }
        }
    }
}

struct MultiLineTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineTextInputView(placeholder: "Test", font: .F17R, color: .darkColor)
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Default preview")
    }
}
