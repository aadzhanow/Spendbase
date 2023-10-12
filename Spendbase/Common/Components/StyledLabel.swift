//
//  StyledLabel.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

final class StyledLabel: UILabel {
    
    enum TextStyle {
        case headlineLarge, headlineMedium, labelLarge, labelMedium, labelSmall, titleMedium
        
        var font: UIFont {
            switch self {
            case .headlineLarge:
                return UIFont.headlineLarge
            case .headlineMedium:
                return UIFont.headlineMedium
            case .labelLarge:
                return UIFont.labelLarge
            case .labelMedium:
                return UIFont.labelMedium
            case .labelSmall:
                return UIFont.labelSmall
            case .titleMedium:
                return UIFont.titleMedium
            }
        }
        
        var color: UIColor {
            switch self {
            case .headlineLarge:
                return UIColor(named: BrandColors.layerOne) ?? .black
            case .headlineMedium:
                return UIColor(named: BrandColors.layerTwo) ?? .black
            case .labelLarge:
                return UIColor(named: BrandColors.layerOne) ?? .black
            case .labelMedium:
                return UIColor(named: BrandColors.layerThree) ?? .black
            case .labelSmall:
                return UIColor(named: BrandColors.layerThree) ?? .black
            case .titleMedium:
                return UIColor(named: BrandColors.layerOne) ?? .black
            }
        }
        
        private var height: CGFloat {
            switch self {
            case .headlineLarge:
                return 40
            case .headlineMedium:
                return 34
            case .labelLarge, .labelMedium, .titleMedium:
                return 20
            case .labelSmall:
                return 16
            }
        }
    }
    
    init(textStyle: TextStyle) {
        super.init(frame: .zero)
        font = textStyle.font
        textAlignment = .left
        textColor = textStyle.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
