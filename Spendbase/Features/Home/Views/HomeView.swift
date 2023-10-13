//
//  HomeView.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    // MARK: - UI Properties
    let availableBalanceView = ContainerView()
    let availableBalanceHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    let accountCurrencyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: CustomImages.imageUsFlag)
        return imageView
    }()
    
    let accountCurrencyLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelLarge)
        label.text = K.accountCurrency
        return label
    }()
    
    let currentBalanceLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .headlineMedium)
        label.text = K.currentBalance
        return label
    }()
    
    // My Cards Table View
    let containerMyCardsTableView = ContainerView()
    
    let myCardsLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .titleMedium)
        label.text = K.myCardsTitle
        return label
    }()
    
    let seeAllCardsButton: UnderlinedButton = {
        let button = UnderlinedButton(type: .custom)
        button.setTitle(K.seeAll, for: .normal)
        return button
    }()
    
    let myCardsTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        return tv
    }()
    
    // Recent Transactions Table View
    let containerTransactionsCollectionView = ContainerView()
    
    let recentTransactionsLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .titleMedium)
        label.text = K.recentTransactionsTitle
        return label
    }()
    
    let seeTransactionsButton: UnderlinedButton = {
        let button = UnderlinedButton(type: .custom)
        button.setTitle(K.seeAll, for: .normal)
        return button
    }()
    
    let recentTransactionsFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 63)
        return layout
    }()

    lazy var recentTransactionsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: recentTransactionsFlowLayout)
        cv.backgroundColor = UIColor(named: BrandColors.backgroundTwo)
        return cv
    }()
    
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
        
        // MARK: - View hierarchy setup
        
        // Available Balance View
        addSubview(availableBalanceView)
        availableBalanceView.addSubview(availableBalanceHorizontalStack)
        availableBalanceHorizontalStack.addArrangedSubview(accountCurrencyImageView)
        availableBalanceHorizontalStack.addArrangedSubview(accountCurrencyLabel)
        availableBalanceView.addSubview(currentBalanceLabel)
        
        // My Cards View
        addSubview(containerMyCardsTableView)
        containerMyCardsTableView.addSubview(myCardsLabel)
        containerMyCardsTableView.addSubview(seeAllCardsButton)
        addSubview(myCardsTableView)
        
        // My Recent Transactions View
        addSubview(containerTransactionsCollectionView)
        containerTransactionsCollectionView.addSubview(recentTransactionsLabel)
        containerTransactionsCollectionView.addSubview(seeTransactionsButton)
        addSubview(recentTransactionsCollectionView)
        
        // MARK: - Layout & Constraints
        
        // Available Balance View
        availableBalanceView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(89)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.bottom.equalTo(currentBalanceLabel.snp.bottom).offset(16)
        }
        
        availableBalanceHorizontalStack.snp.makeConstraints { make in
            make.top.equalTo(availableBalanceView.snp.top).offset(20)
            make.leading.trailing.equalTo(availableBalanceView).inset(16)
        }
        
        accountCurrencyImageView.snp.makeConstraints { make in
            make.width.equalTo(22)
            make.height.equalTo(16)
        }
        
        currentBalanceLabel.snp.makeConstraints { make in
            make.top.equalTo(availableBalanceHorizontalStack.snp.bottom).offset(8)
            make.leading.trailing.equalTo(availableBalanceView).inset(16)
        }
        
        // My Cards View
        containerMyCardsTableView.snp.makeConstraints { make in
            make.top.equalTo(availableBalanceView.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(240)
        }
        
        myCardsLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(containerMyCardsTableView).offset(16)
        }
        
        seeAllCardsButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(containerMyCardsTableView).inset(16)
            make.width.equalTo(46)
            make.height.equalTo(20)
        }
        
        myCardsTableView.snp.makeConstraints { make in
            make.top.equalTo(myCardsLabel.snp.bottom).offset(8)
            make.leading.equalTo(containerMyCardsTableView.snp.leading)
            make.trailing.equalTo(containerMyCardsTableView.snp.trailing)
            make.bottom.equalTo(containerMyCardsTableView.snp.bottom).offset(-16)
        }
        
        // Recent Transactions View Constraints
        containerTransactionsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(containerMyCardsTableView.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(240)
        }
        
        recentTransactionsLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(containerTransactionsCollectionView).offset(16)
        }
        
        seeTransactionsButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(containerTransactionsCollectionView).inset(16)
            make.width.equalTo(46)
            make.height.equalTo(20)
        }
        
        recentTransactionsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recentTransactionsLabel.snp.bottom).offset(8)
            make.leading.equalTo(containerTransactionsCollectionView.snp.leading)
            make.trailing.equalTo(containerTransactionsCollectionView.snp.trailing)
            make.bottom.equalTo(containerTransactionsCollectionView.snp.bottom).offset(-16)
        }
    }
}
