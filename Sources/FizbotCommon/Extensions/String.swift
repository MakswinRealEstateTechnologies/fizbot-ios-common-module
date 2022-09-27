//
//  File.swift
//  
//
//  Created by Alkın Çakıralar on 27.09.2022.
//

import Foundation

extension String {
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
