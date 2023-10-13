//
//  SingleCardViewController.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit

class SingleCardViewController: UIViewController {
    
    //MARK: - View Initialization
    var mainView: SingleCardView {
        return view as! SingleCardView
    }
    
    override func loadView() {
        view = SingleCardView()
    }
    
    //MARK: - Collection View Buttons
    lazy var buttons: [ButtonModel] = [
        ButtonModel(iconName: IconUI.iconEye, title: K.buttonTitleDetails, action: { [weak self] in
            self?.toggleSlidingView()
        }),
        ButtonModel(iconName: IconUI.iconLock, title: K.buttonTitleLock, action: { [weak self] in
            print("Lock card tapped")
        }),
        ButtonModel(iconName: IconUI.iconCreditCardClose, title: K.buttonTitleTerminate, action: { [weak self] in
            print("Card close tapped")
        })
    ]
        
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupTableView()
        
        mainView.backButton.addTarget(self, action: #selector(handleBackButtonTap), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //MARK: - Private Functions
    private func toggleSlidingView() {
        let newOffset = (mainView.slidingViewTopConstraint?.layoutConstraints.first?.constant ?? 0) == 222 ? 111 : 222
        mainView.slidingViewTopConstraint?.update(offset: newOffset)
        UIView.animate(withDuration: 0.3) {
            self.mainView.layoutIfNeeded()
        }
    }
    
    //MARK: - Button Actions
    @objc private func handleBackButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
}
