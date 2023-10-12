//
//  ContainerView.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

final class ContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStyle() {
        backgroundColor = UIColor(named: BrandColors.backgroundTwo)
        layer.cornerRadius = 16
        clipsToBounds = true
    }
}
