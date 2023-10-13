//
//  MyCardCell.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit
import SnapKit

class MyCardCell: UITableViewCell {
    
    // MARK: - UI Properties
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.backgroundTwo)
        return view
    }()
    
    let cardImage: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.layerOne)
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray6.cgColor
        return view
    }()
    
    let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.text = Placeholders.cardNumberShort
        label.textColor = UIColor(named: BrandColors.backgroundTwo)
        label.font = UIFont(name: Fonts.interSemiBold, size: 10)
        return label
    }()
    
    let serviceLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Logos.imageGoogleLogo)
        return imageView
    }()
    
    let bgServiceLogoImage: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.backgroundOne)
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    let cardNameLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelLarge)
        label.text = Placeholders.companyName
        return label
    }()
    
    let chevronRightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: IconUI.iconNext)
        return imageView
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        
        // MARK: - View hierarchy setup
        addSubview(containerView)
        containerView.addSubview(cardImage)
        containerView.addSubview(bgServiceLogoImage)
        containerView.addSubview(serviceLogoImage)
        containerView.addSubview(cardNumberLabel)
        containerView.addSubview(cardNameLabel)
        containerView.addSubview(chevronRightIcon)
        
        // MARK: - Layout & Constraints
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bgServiceLogoImage.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(4)
            make.leading.equalTo(containerView.snp.leading).offset(8)
            make.size.equalTo(28)
        }
        
        serviceLogoImage.snp.makeConstraints { make in
            make.center.equalTo(bgServiceLogoImage)
            make.size.equalTo(16.79)
        }
        
        cardImage.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(16)
            make.leading.equalTo(containerView.snp.leading).offset(16)
            make.width.equalTo(48)
            make.height.equalTo(32)
        }
        
        cardNumberLabel.snp.makeConstraints { make in
            make.trailing.equalTo(cardImage.snp.trailing).offset(-7)
            make.bottom.equalTo(cardImage.snp.bottom).offset(-7)
        }
        
        cardNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(containerView.snp.centerY)
            make.leading.equalTo(cardImage.snp.trailing).offset(12)
        }
        
        chevronRightIcon.snp.makeConstraints { make in
            make.centerY.equalTo(containerView.snp.centerY)
            make.leading.equalTo(containerView.snp.trailing).offset(-46)
            make.size.equalTo(32)
        }
    }
}
