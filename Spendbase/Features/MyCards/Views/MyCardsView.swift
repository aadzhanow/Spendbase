//
//  MyCardsView.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class MyCardsView: UIView {
    
    // MARK: - UI Properties
    

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        backgroundColor = UIColor(named: BrandColors.backgroundOne)

    }
}
