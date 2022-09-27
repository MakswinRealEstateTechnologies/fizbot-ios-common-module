//
//  PullToRefresh.swift
//  
//
//  Created by Alkın Çakıralar on 27.09.2022.
//

import SwiftUI

public struct PullToRefresh: View {
    
    var coordinateSpaceName: String
    var onRefresh: ()->Void
    
    public init(coordinateSpaceName: String, onRefresh: @escaping () -> Void) {
        self.coordinateSpaceName = coordinateSpaceName
        self.onRefresh = onRefresh
    }
    
    @State var needRefresh: Bool = false
    
    public var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).midY > 30) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            onRefresh()
                        }
                    }
            }
            HStack {
                Spacer()
                if needRefresh {
                    ProgressView()
                } else {
                    ProgressView()
                }
                Spacer()
            }
        }.padding(.top, -50)
    }
}
