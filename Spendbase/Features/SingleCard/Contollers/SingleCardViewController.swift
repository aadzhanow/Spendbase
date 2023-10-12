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
        ButtonModel(icon: UIImage(named: IconUI.iconEye), title: K.buttonTitleDetails, action: {
            self.toggleSlidingView()
        }),
        ButtonModel(icon: UIImage(named: IconUI.iconLock), title: K.buttonTitleLock, action: {
            print("Lock card tapped")
        }),
        ButtonModel(icon: UIImage(named: IconUI.iconCreditCardClose), title: K.buttonTitleTerminate, action: {
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
