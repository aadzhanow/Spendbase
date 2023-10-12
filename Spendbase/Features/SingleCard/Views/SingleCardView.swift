//
//  SingleCardView.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit
import SnapKit

class SingleCardView: UIView {
    
    var slidingViewTopConstraint: Constraint?
    
    // MARK: - UI Properties
    
    // Header Properties
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: IconUI.iconArrowLeft), for: .normal)
        return button
    }()
    
    let transactionIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Logos.imageGoogleLogo)
        return imageView
    }()
    
    let bgTransactionIcon: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.backgroundTwo)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    let titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    let cardNameLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelLarge)
        label.text = Placeholders.companyName
        return label
    }()
    
    let cardNumberLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelSmall)
        label.text = Placeholders.cardNumberWIthDots
        return label
    }()
    
    // Card View Properties
    let containerCardImitationView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let cardImitationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.layerOne)
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        return view
    }()
    
    let shadowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: CustomImages.imageShadow)
        return imageView
    }()
    
    // card info labels
    let cardIssuerLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Logos.spendbaseLogoWhite)
        return imageView
    }()
    
    let cardTypeLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Logos.mastercardLogo)
        return imageView
    }()
    
    let cardNumberOnCardLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelMedium)
        label.text = Placeholders.cardNumberWIthDots
        return label
    }()
    
    // sliding view properties
    let slidingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.backgroundOne)
        return view
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.layerFour)
        return view
    }()
    
    // buttons collection view
    let containerViewCollectionView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    let buttonsFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let totalSpacing = layout.minimumInteritemSpacing * 2
        let cellWidth = (256 - totalSpacing) / 3
        layout.itemSize = CGSize(width: cellWidth, height: 70)
        return layout
    }()

    lazy var buttonsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: buttonsFlowLayout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    // activity table view
    let containerViewTableView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    let activityLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .titleMedium)
        label.text = K.activityTitle
        return label
    }()
    
    let activityTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        return tv
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
        
        addSubview(headerView)
        headerView.addSubview(backButton)
        
        titleStackView.addArrangedSubview(bgTransactionIcon)
        bgTransactionIcon.addSubview(transactionIcon)
        titleStackView.addArrangedSubview(cardNameLabel)
        titleStackView.addArrangedSubview(cardNumberLabel)
        
        headerView.addSubview(titleStackView)
        
        addSubview(containerCardImitationView)
        containerCardImitationView.addSubview(cardImitationView)
        containerCardImitationView.addSubview(shadowImage)
        cardImitationView.addSubview(cardIssuerLogoImage)
        cardImitationView.addSubview(cardTypeLogoImage)
        cardImitationView.addSubview(cardNumberOnCardLabel)
        
        addSubview(slidingView)
        slidingView.addSubview(dividerView)
        slidingView.addSubview(containerViewCollectionView)
        containerViewCollectionView.addSubview(buttonsCollectionView)
        
        slidingView.addSubview(containerViewTableView)
        containerViewTableView.addSubview(activityTableView)
        containerViewTableView.addSubview(activityLabel)
        
        // header constraints setup
        headerView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(0)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(44)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.headerView.snp.top)
            make.leading.equalTo(self.headerView.snp.leading)
            make.width.height.equalTo(44)
        }
        
        titleStackView.snp.makeConstraints { make in
            make.centerX.equalTo(self.headerView.snp.centerX)
            make.centerY.equalTo(self.headerView.snp.centerY)
        }
        
        bgTransactionIcon.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        transactionIcon.snp.makeConstraints { make in
            make.centerX.equalTo(self.bgTransactionIcon.snp.centerX)
            make.centerY.equalTo(self.bgTransactionIcon.snp.centerY)
            make.width.height.equalTo(20.7)
        }
        
        // card view setup
        containerCardImitationView.snp.makeConstraints { make in
            make.top.equalTo(self.headerView.snp.bottom).offset(24)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(180)
        }
        
        cardImitationView.snp.makeConstraints { make in
            make.top.equalTo(self.containerCardImitationView.snp.top).offset(0)
            make.centerX.equalTo(self.containerCardImitationView.snp.centerX)
            make.height.equalTo(164)
            make.width.equalTo(256)
        }
        
        shadowImage.snp.makeConstraints { make in
            make.centerX.equalTo(self.cardImitationView.snp.centerX)
            make.centerY.equalTo(self.cardImitationView.snp.centerY)
            make.height.equalTo(164)
            make.width.equalTo(330)
        }
        
        cardIssuerLogoImage.snp.makeConstraints { make in
            make.top.equalTo(self.cardImitationView.snp.top).offset(24)
            make.leading.equalTo(self.cardImitationView.snp.leading).offset(16)
            make.height.equalTo(16)
            make.width.equalTo(96)
        }
        
        cardTypeLogoImage.snp.makeConstraints { make in
            make.top.equalTo(self.cardImitationView.snp.top).offset(16)
            make.trailing.equalTo(self.cardImitationView.snp.trailing).offset(-16)
            make.height.equalTo(31.64)
            make.width.equalTo(51.17)
        }
        
        cardNumberOnCardLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.cardImitationView.snp.bottom).offset(-16)
            make.leading.equalTo(self.cardImitationView.snp.leading).offset(20)
        }
        
        // sliding view
        slidingView.snp.makeConstraints { make in
            slidingViewTopConstraint = make.top.equalTo(self.headerView.snp.bottom).offset(111).constraint
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(0)
            make.trailing.equalTo(self.safeAreaLayoutGuide).offset(0)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(0)
        }
        
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(self.slidingView.snp.top).offset(0)
            make.leading.equalTo(self.slidingView.snp.leading).offset(20)
            make.trailing.equalTo(self.slidingView.snp.trailing).offset(-20)
            make.height.equalTo(1)
        }
        
        // containerViewCollectionView
        containerViewCollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.slidingView.snp.top).offset(16)
            make.centerX.equalTo(self.slidingView.snp.centerX)
            make.width.equalTo(256)
            make.height.equalTo(72)
        }
        
        buttonsCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(self.containerViewCollectionView)
        }
        
        // table view
        containerViewTableView.snp.makeConstraints { make in
            make.top.equalTo(self.containerViewCollectionView.snp.bottom).offset(24)
            make.leading.equalTo(self.slidingView.snp.leading).offset(20)
            make.trailing.equalTo(self.slidingView.snp.trailing).offset(-20)
            make.bottom.equalTo(self.slidingView.snp.bottom).offset(-16)
        }
        
        activityLabel.snp.makeConstraints { make in
            make.top.equalTo(self.containerViewTableView.snp.top).offset(16)
            make.leading.equalTo(self.containerViewTableView.snp.leading).offset(16)
        }
        
        activityTableView.snp.makeConstraints { make in
            make.top.equalTo(self.activityLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.containerViewTableView.snp.leading).offset(0)
            make.trailing.equalTo(self.containerViewTableView.snp.trailing).offset(0)
            make.bottom.equalTo(self.containerViewTableView.snp.bottom).offset(-16)
        }

    }
}
