//
//  UIApplication.swift
//  
//
//  Created by Alkın Çakıralar on 27.09.2022.
//

import SwiftUI
import Foundation

public extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
