//
//  RemoteImageView.swift
//
//
//  Created by Alkın Çakıralar on 27.09.2022.
//

import SwiftUI
import SDWebImageSwiftUI

public struct RemoteImageView: View {
    let url: String
    
    public init(url: String) {
        self.url = url
    }
    
    public var body: some View {
        WebImage(url: .init(string: url))
            .resizable()
            .indicator { _, _ in
                ProgressView()
            }
    }
}
