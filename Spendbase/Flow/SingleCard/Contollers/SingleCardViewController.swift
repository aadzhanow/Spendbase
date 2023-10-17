//
//  SingleCardViewController.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit

class SingleCardViewController: UIViewController {
    
    var singleCardView = SingleCardView()
    
    //MARK: - Collection View Buttons
    lazy var buttons: [ButtonModel] = [
        ButtonModel(iconName: IconUI.iconEye, title: "buttonTitleDetails".localized, action: { [weak self] in
            self?.toggleSlidingView()
        }),
        ButtonModel(iconName: IconUI.iconLock, title: "buttonTitleLock".localized, action: { [weak self] in
            print("Lock card tapped")
        }),
        ButtonModel(iconName: IconUI.iconCreditCardClose, title: "buttonTitleTerminate".localized, action: { [weak self] in
            print("Card close tapped")
        })
    ]
        
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
        setupTableView()
        singleCardView.backButton.addTarget(self, action: #selector(handleBackButtonTap), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
        
    //MARK: - Private Functions
    private func setupUI() {
        singleCardView = SingleCardView(frame: self.view.bounds)
        self.view.addSubview(singleCardView)
    }
    
    private func toggleSlidingView() {
        let newOffset = (singleCardView.slidingViewTopConstraint?.layoutConstraints.first?.constant ?? 0) == 222 ? 111 : 222
        singleCardView.slidingViewTopConstraint?.update(offset: newOffset)
        UIView.animate(withDuration: 0.3) {
            self.singleCardView.layoutIfNeeded()
        }
    }
    
    //MARK: - Button Actions
    @objc private func handleBackButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
}
