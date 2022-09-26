//
//  File.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//
import SwiftUI

public struct TextView: View {
    
    private var text: String = ""
    private var font: Font = .title
    private var color: Color = .darkBlue
    
    public init(text: String, font: Font, color: Color) {
        self.text = text
        self.font = font
        self.color = color
    }
    
    public var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(color)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "onboarding_page_tiasdtle2", font: .title, color: .darkBlue)
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Default preview")
    }
}
