//
//  HomeView.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - UI Properties
    let myLabel = UILabel()
    
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
        backgroundColor = .red

        
        // MARK: - View hierarchy setup
        addSubview(myLabel)
        
        // MARK: - Layout & Constraints
        myLabel.frame = CGRect(x: 20, y: 20, width: 200, height: 40)
        
    }
}
