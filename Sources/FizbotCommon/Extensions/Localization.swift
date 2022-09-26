//
//  File.swift
//  
//
//  Created by Alkın Çakıralar on 26.09.2022.
//

import Foundation

public protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
