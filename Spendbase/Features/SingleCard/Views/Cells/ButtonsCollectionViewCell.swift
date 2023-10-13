//
//  ButtonsCollectionViewCell.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit
import SnapKit

class ButtonsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 6
        return stack
    }()
    
    let buttonIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:IconUI.iconEye)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(named: BrandColors.layerOne)
        return imageView
    }()
    
    let buttonTitleLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelSmall)
        label.textColor = UIColor(named: BrandColors.layerOne)
        label.text = "Details"
        return label
    }()
    
//    let buttonTitleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Details"
//        return label
//    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        
        // MARK: - View hierarchy setup
        addSubview(containerView)
        
        buttonStackView.addArrangedSubview(buttonIcon)
        buttonStackView.addArrangedSubview(buttonTitleLabel)
        
        containerView.addSubview(buttonStackView)
        
        // MARK: - Layout & Constraints
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.center.equalTo(containerView)
        }
        
        buttonIcon.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
    }
}
