//
//  UIFont+CustomFonts.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

extension UIFont {

    static var headlineLarge: UIFont {
        return UIFont(name: Fonts.interExtraBold, size: 32) ?? UIFont.systemFont(ofSize: 32, weight: .heavy)
    }
    
    static var headlineMedium: UIFont {
        return UIFont(name: Fonts.interExtraBold, size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .heavy)
    }
    
    static var labelLarge: UIFont {
        return UIFont(name: Fonts.interMedium, size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    static var labelMedium: UIFont {
        return UIFont(name: Fonts.interMedium, size: 14) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    static var labelSmall: UIFont {
        return UIFont(name: Fonts.interMedium, size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    static var titleMedium: UIFont {
        return UIFont(name: Fonts.interSemiBold, size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
}
