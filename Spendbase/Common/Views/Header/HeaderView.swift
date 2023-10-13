//
//  HeaderView.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let titleLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .headlineLarge)
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        let image = UIImage(named: IconUI.iconPlus)
        button.setImage(image, for: .normal)
        return button
    }()
    
    let bankButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        let image = UIImage(named: IconUI.iconBank)
        button.setImage(image, for: .normal)
        return button
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.layerFour)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        
        addSubview(containerView)
        addSubview(titleLabel)
        addSubview(bankButton)
        addSubview(plusButton)
        addSubview(dividerView)
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(12)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(53)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(1)
            make.leading.equalTo(containerView.snp.leading).offset(0)
        }
        
        bankButton.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(0)
            make.trailing.equalTo(containerView.snp.trailing).offset(0)
            make.size.equalTo(44)
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(0)
            make.trailing.equalTo(bankButton.snp.leading).offset(0)
            make.size.equalTo(44)
        }
        
        dividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalTo(containerView.snp.leading).offset(0)
            make.trailing.equalTo(containerView.snp.trailing).offset(0)
            make.bottom.equalTo(containerView.snp.bottom).offset(0)
        }
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
}
