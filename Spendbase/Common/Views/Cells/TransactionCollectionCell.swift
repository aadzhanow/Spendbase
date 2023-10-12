//
//  TransactionCollectionCell.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit
import SnapKit

class TransactionCollectionCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.backgroundTwo)
        return view
    }()
        
    let transactionIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Logos.imageGoogleLogo)
        return imageView
    }()
    
    let bgTransactionIcon: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.backgroundOne)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    let labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    
    let transactionNameLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelLarge)
        label.text = Placeholders.companyName
        return label
    }()
    
    let cardNumberLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelSmall)
        label.text = Placeholders.cardNumberWIthDots
        return label
    }()
    
    let amountLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelLarge)
        label.text = Placeholders.amount
        return label
    }()
    
    let receiptAvalabilityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ReceiptsIcons.iconReceiptAdded)
        return imageView
    }()
    
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
        containerView.addSubview(bgTransactionIcon)
        containerView.addSubview(transactionIcon)
        
        labelStackView.addArrangedSubview(transactionNameLabel)
        labelStackView.addArrangedSubview(cardNumberLabel)
        
        containerView.addSubview(labelStackView)
        
        containerView.addSubview(receiptAvalabilityIcon)
        containerView.addSubview(amountLabel)
        
        // MARK: - Layout & Constraints
        containerView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        bgTransactionIcon.snp.makeConstraints { make in
            make.centerY.equalTo(self.containerView.snp.centerY)
            make.leading.equalTo(self.containerView.snp.leading).offset(16)
            make.width.height.equalTo(40)
        }
        
        transactionIcon.snp.makeConstraints { make in
            make.centerX.equalTo(self.bgTransactionIcon.snp.centerX)
            make.centerY.equalTo(self.bgTransactionIcon.snp.centerY)
            make.width.height.equalTo(20.7)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.leading.equalTo(bgTransactionIcon.snp.trailing).offset(12)
            make.centerY.equalTo(containerView)
        }
        
        receiptAvalabilityIcon.snp.makeConstraints { make in
            make.centerY.equalTo(self.containerView.snp.centerY)
            make.trailing.equalTo(self.containerView.snp.trailing).offset(-58)
            make.width.height.equalTo(24)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.containerView.snp.centerY)
            make.trailing.equalTo(self.receiptAvalabilityIcon.snp.leading).offset(-12)
        }
        
    }
}
