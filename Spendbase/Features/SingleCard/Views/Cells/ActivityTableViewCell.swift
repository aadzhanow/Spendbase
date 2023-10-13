//
//  ActivityTableViewCell.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    // MARK: - UI Properties
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.backgroundTwo)
        return view
    }()
    
    let bgTransactionIcon: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.backgroundOne)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    let transactionIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: IconUI.iconCreditCardRegular)
        return imageView
    }()
    
    let transactionIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 6
        return view
    }()
    
    let transactionLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    let transactionNameLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelLarge)
        label.text = Placeholders.transactionName
        return label
    }()
    
    let transactionIndicatorLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelMedium)
        label.textColor = UIColor(named: BrandColors.systemTwo)
        label.text = Placeholders.transactionDeclined
        return label
    }()
    
    let transactionAmoutLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelLarge)
        label.text = Placeholders.amount
        return label
    }()
    
    let receiptIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ReceiptsIcons.iconReceiptAdded)
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
        
        containerView.addSubview(bgTransactionIcon)
        bgTransactionIcon.addSubview(transactionIcon)
        containerView.addSubview(transactionIndicator)
        
        transactionLabelsStackView.addArrangedSubview(transactionNameLabel)
        transactionLabelsStackView.addArrangedSubview(transactionIndicatorLabel)
        containerView.addSubview(transactionLabelsStackView)
        
        containerView.addSubview(receiptIcon)
        containerView.addSubview(transactionAmoutLabel)
        
        // MARK: - Layout & Constraints
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bgTransactionIcon.snp.makeConstraints { make in
            make.leading.equalTo(self.containerView.snp.leading).offset(16)
            make.centerY.equalTo(self.containerView.snp.centerY)
            make.size.equalTo(40)
        }
        
        transactionIcon.snp.makeConstraints { make in
            make.center.equalTo(bgTransactionIcon)
            make.size.equalTo(24)
        }
        
        transactionIndicator.snp.makeConstraints { make in
            make.trailing.equalTo(self.bgTransactionIcon.snp.trailing).offset(0)
            make.bottom.equalTo(self.bgTransactionIcon.snp.bottom).offset(0)
            make.size.equalTo(12)
        }
        
        transactionLabelsStackView.snp.makeConstraints { make in
            make.leading.equalTo(self.bgTransactionIcon.snp.trailing).offset(12)
            make.centerY.equalTo(containerView)
        }
        
        receiptIcon.snp.makeConstraints { make in
            make.trailing.equalTo(self.containerView.snp.trailing).offset(-16)
            make.centerY.equalTo(containerView)
            make.size.equalTo(24)
        }
        
        transactionAmoutLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.receiptIcon.snp.leading).offset(-8)
            make.centerY.equalTo(containerView)
        }
    }
}

