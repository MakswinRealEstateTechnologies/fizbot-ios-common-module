//
//  File.swift
//  
//
//  Created by Alkın Çakıralar on 27.09.2022.
//

import SwiftUI

struct FontNames {
    static let semiBold = "URWGeometric-SemiBold"
    static let regular = "URWGeometric-Regular"
}

extension Font {
    
    static var F24SB: Font {
        Font.custom(FontNames.semiBold, size: 24)
    }
    
    static var F20SB: Font {
        Font.custom(FontNames.semiBold, size: 20)
    }
    
    static var F17SB: Font {
        Font.custom(FontNames.semiBold, size: 17)
    }
    
    static var F17R: Font {
        Font.custom(FontNames.regular, size: 17)
    }
    
    static var F15SB: Font {
        Font.custom(FontNames.semiBold, size: 15)
    }
    
    static var F15R: Font {
        Font.custom(FontNames.regular, size: 15)
    }
    
    static var F13SB: Font {
        Font.custom(FontNames.semiBold, size: 13)
    }
    
    static var F13R: Font {
        Font.custom(FontNames.regular, size: 13)
    }
    
    static var F11SB: Font {
        Font.custom(FontNames.semiBold, size: 11)
    }
    
    static var F11R: Font {
        Font.custom(FontNames.regular, size: 11)
    }
    
}
