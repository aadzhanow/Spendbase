//
//  UnderlinedButton.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit
import SnapKit

final class UnderlinedButton: UIButton {

    private let underline: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.layerOne)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setTitleColor(UIColor(named: BrandColors.layerOne), for: .normal)
        titleLabel?.font = UIFont(name: Fonts.interMedium, size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .medium)
        setupUnderline()
    }
    
    private func setupUnderline() {
        addSubview(underline)
        
        underline.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.height.equalTo(1)
            if let titleLabel = titleLabel {
                make.leading.equalTo(titleLabel)
                make.trailing.equalTo(titleLabel)
            }
        }
    }
}
