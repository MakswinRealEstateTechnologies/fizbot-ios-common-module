//
//  PopupView.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import SwiftUI

public struct PopupView<Content: View>: View {
    
    @Binding var isShowing: Bool
    @ViewBuilder var content: Content
    
    @State private var offSet: CGFloat = 0
    
    public init(isShowing: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isShowing = isShowing
        self.content = content()
    }
    
    public var body: some View {
        VStack {
            Spacer()
            VStack {
                Capsule()
                    .frame(width: 40, height: 6)
                    .foregroundColor(Color.gray)
                .frame(height: 20)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.00001))
                content
                    .contentShape(Rectangle())
                    .padding(.bottom, 32)
            }
            .contentShape(Rectangle())
            .background(Color.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .offset(y: offSet)
            .highPriorityGesture(dragGesture)
            .offset(y: isShowing ? 0 : UIScreen.main.bounds.height)
        }
        .ignoresSafeArea()
        .background(
            Color.black.opacity(isShowing ? 0.5 : 0).ignoresSafeArea()
                .onTapGesture(perform: {
                    withAnimation {
                        isShowing = false
                    }
                }
            )
        )
        .onDisappear {
            offSet = 0
        }
    }
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .global)
            .onChanged { val in
                if val.translation.height > 0 {
                    withAnimation {
                        offSet = val.translation.height
                    }
                }
            }
            .onEnded { val in
                withAnimation {
                    offSet = 0
                }
                
                let velocity = CGSize(
                    width:  val.predictedEndLocation.x - val.location.x,
                    height: val.predictedEndLocation.y - val.location.y
                )
                
                if velocity.height > 300 {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
    }
    
}


struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(isShowing: .constant(true)) {
            Text("TasasddEST")
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
        .previewDisplayName("iPhone 12 Pro Max")
        .edgesIgnoringSafeArea(.bottom)
                            
    }
}
