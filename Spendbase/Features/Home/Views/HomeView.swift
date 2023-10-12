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
    let availableBalanceView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
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
    let containerMyCardsTableView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
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
        tv.backgroundColor = .red
        return tv
    }()
    
    // Recent Transactions Table View
    let containerTransactionsTableView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
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
        addSubview(containerTransactionsTableView)
        containerTransactionsTableView.addSubview(recentTransactionsLabel)
        containerTransactionsTableView.addSubview(seeTransactionsButton)
        addSubview(recentTransactionsCollectionView)
        
        // MARK: - Layout & Constraints
        
        // Available Balance View
        availableBalanceView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(89)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.bottom.equalTo(self.currentBalanceLabel.snp.bottom).offset(16)
        }
        
        availableBalanceHorizontalStack.snp.makeConstraints { make in
            make.top.equalTo(self.availableBalanceView.snp.top).offset(20)
            make.leading.equalTo(self.availableBalanceView.snp.leading).offset(16)
            make.trailing.equalTo(self.availableBalanceView.snp.trailing).offset(-16)
        }
        
        accountCurrencyImageView.snp.makeConstraints { make in
            make.width.equalTo(22)
            make.height.equalTo(16)
        }
        
        currentBalanceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.availableBalanceHorizontalStack.snp.bottom).offset(8)
            make.leading.equalTo(self.availableBalanceView.snp.leading).offset(16)
            make.trailing.equalTo(self.availableBalanceView.snp.trailing).offset(-16)
        }
        
        // My Cards View
        containerMyCardsTableView.snp.makeConstraints { make in
            make.top.equalTo(self.availableBalanceView.snp.bottom).offset(16)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(240)
        }
        
        myCardsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.containerMyCardsTableView.snp.top).offset(16)
            make.leading.equalTo(self.containerMyCardsTableView.snp.leading).offset(16)
        }
        
        seeAllCardsButton.snp.makeConstraints { make in
            make.top.equalTo(self.containerMyCardsTableView.snp.top).offset(16)
            make.trailing.equalTo(self.containerMyCardsTableView.snp.trailing).offset(-16)
            make.width.equalTo(46)
            make.height.equalTo(20)
        }
        
        myCardsTableView.snp.makeConstraints { make in
            make.top.equalTo(self.myCardsLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.containerMyCardsTableView.snp.leading).offset(0)
            make.trailing.equalTo(self.containerMyCardsTableView.snp.trailing).offset(0)
            make.bottom.equalTo(self.containerMyCardsTableView.snp.bottom).offset(-16)
        }
        
        // Recent Transactions View Constraints
        containerTransactionsTableView.snp.makeConstraints { make in
            make.top.equalTo(self.containerMyCardsTableView.snp.bottom).offset(16)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(240)
        }
        
        recentTransactionsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.containerTransactionsTableView.snp.top).offset(16)
            make.leading.equalTo(self.containerTransactionsTableView.snp.leading).offset(16)
        }
        
        seeTransactionsButton.snp.makeConstraints { make in
            make.top.equalTo(self.containerTransactionsTableView.snp.top).offset(16)
            make.trailing.equalTo(self.containerTransactionsTableView.snp.trailing).offset(-16)
            make.width.equalTo(46)
            make.height.equalTo(20)
        }
        
        recentTransactionsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.recentTransactionsLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.containerTransactionsTableView.snp.leading).offset(0)
            make.trailing.equalTo(self.containerTransactionsTableView.snp.trailing).offset(0)
            make.bottom.equalTo(self.containerTransactionsTableView.snp.bottom).offset(-16)
        }
        
    }
}
