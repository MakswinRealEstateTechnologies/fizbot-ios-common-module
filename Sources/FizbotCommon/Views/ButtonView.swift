//
//  ButtonView.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import SwiftUI

public struct ButtonView: View {
    @Environment(\.redactionReasons) var redactionReasons

    var title: String = ""
    var type: ButtonViewType = .Positive
    var isLoading: Bool
    var font: Font = .F17SB
    var height: CGFloat = 48.0
    var onClick: () -> Void
    var positiveButtonBackground: Color = Color.darkBlue
    
    public init(title: String,
         type: ButtonViewType,
         isLoading: Bool = false,
         font: Font? = nil,
         height: CGFloat = 48.0,
         positiveButtonBackground: Color? = nil,
         onClick: @escaping () -> Void) {
        self.title = title
        self.type = type
        self.isLoading = isLoading
        self.font = font ?? .F17SB
        self.height = height
        self.positiveButtonBackground = positiveButtonBackground ?? .darkBlue
        self.onClick = onClick
    }
    
    public var body: some View {
        Button {
            if !isLoading {
                onClick()
            }
        } label: {
            ZStack {
                Rectangle()
                    .fill(type == .Positive ? positiveButtonBackground : Color.background)
                    .frame(width: isLoading ? height : nil)
                    .cornerRadius(isLoading ? height/2 : 5)
                if isLoading {
                    CircleLoadingBar(type: type)
                }
                else {
                    VStack {
                        Text(redactionReasons.contains(.placeholder) ? "" : title.localized)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .font(font)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(redactionReasons.contains(.placeholder) ? Color.clear : positiveButtonBackground, lineWidth: 1)
                            )
                            .foregroundColor(
                                redactionReasons.contains(.placeholder) ? (Color.clear) :
                                    (type == .Positive ? Color.background : positiveButtonBackground)
                                )
                            .background(
                                redactionReasons.contains(.placeholder) ?  (RoundedRectangle(cornerRadius: 5).fill(Color.coolGray3)) :
                                    (RoundedRectangle(cornerRadius: 5).fill(type == .Positive ? positiveButtonBackground : Color.background))
                            )
                        
                    }.frame(maxHeight: .infinity)
                }
            }
            .frame(height: height)
            .disabled(isLoading)
            .animation(.easeInOut, value: isLoading)
        }
        
    }
    
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Test", type: .Positive, font: .F17SB, positiveButtonBackground: .darkBlue) {
            
        }.previewLayout(.sizeThatFits)
        .previewDisplayName("Default preview")
        .padding()
    }
}

public enum ButtonViewType {
    case Negative
    case Positive
}

struct CircleLoadingBar: View {
    @State private var isLoading = false
    var type: ButtonViewType = .Positive
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.5)
            .stroke(type == .Positive ? Color.background : Color.darkBlue, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
            .padding(8)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.default.repeatForever(autoreverses: false).speed(0.50), value: isLoading)
            .onAppear() {
                self.isLoading = true
            }
    }
}
