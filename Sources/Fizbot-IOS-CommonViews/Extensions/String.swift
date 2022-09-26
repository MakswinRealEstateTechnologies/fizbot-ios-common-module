//
//  File.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//

extension String {
    public var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
