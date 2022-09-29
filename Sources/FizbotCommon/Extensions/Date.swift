//
//  Date.swift
//  
//
//  Created by Alkın Çakıralar on 29.09.2022.
//

import Foundation

public enum DateFormatType: String {
    case ddMMMMyyyy = "dd MMMM yyyy"
    case HHmm = "HH:mm"
}

public extension String {
    func parseDate(formatType: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: NSLocale.current.identifier)
        
        let newDateFormat = dateFormatter.date(from: self)
        
        if newDateFormat != nil {
            dateFormatter.dateFormat = formatType.rawValue

            return dateFormatter.string(from: newDateFormat!)
        } else {
            return dateFormatter.string(from: Date())
        }
        
    }
}
