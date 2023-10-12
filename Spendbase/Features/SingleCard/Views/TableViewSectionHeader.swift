//
//  TableViewSectionHeader.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit
import SnapKit

class TableViewSectionHeader: UIView {
    
    // MARK: - UI Properties
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.layerFour)
        return view
    }()
    
    let viewForHeaderDateLabel: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: BrandColors.backgroundTwo)
        return view
    }()
    
    let headerDateLabel: StyledLabel = {
        let label = StyledLabel(textStyle: .labelMedium)
        label.text = Placeholders.transactionDate
        label.backgroundColor = .clear
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        
        // MARK: - View hierarchy setup
        addSubview(containerView)
        containerView.addSubview(viewForHeaderDateLabel)
        viewForHeaderDateLabel.addSubview(headerDateLabel)
        viewForHeaderDateLabel.addSubview(dividerView)
        
        // MARK: - Layout & Constraints
        containerView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        viewForHeaderDateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.containerView.snp.top).offset(0)
            make.leading.equalTo(self.containerView.snp.leading).offset(0)
            make.trailing.equalTo(self.containerView.snp.trailing).offset(0)
            make.height.equalTo(28)
        }
        
        headerDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.viewForHeaderDateLabel.snp.top).offset(0)
            make.leading.equalTo(self.viewForHeaderDateLabel.snp.leading).offset(16)
        }
        
        dividerView.snp.makeConstraints { make in
            make.leading.equalTo(self.viewForHeaderDateLabel.snp.leading).offset(16)
            make.trailing.equalTo(self.viewForHeaderDateLabel.snp.trailing).offset(-16)
            make.bottom.equalTo(self.viewForHeaderDateLabel.snp.bottom).offset(0)
            make.height.equalTo(1)
        }
    }
}
