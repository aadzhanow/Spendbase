//
//  UIView+HeaderView.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

extension UIView {
    @discardableResult
    func addHeaderView() -> HeaderView {
        let headerView = HeaderView()
        addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.safeAreaLayoutGuide).offset(0)
            make.height.equalTo(53)
        }

        return headerView
    }
}
