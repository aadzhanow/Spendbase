//
//  TransactionsViewController.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    //MARK: - View Initialization
    private var headerView = HeaderView()
    private var mainView = TransactionsView()
    
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupHeader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //MARK: - Private Functions
    private func setupUI() {
        mainView.frame = self.view.bounds
        self.view.addSubview(mainView)
    }
    
    private func setupHeader() {
        headerView = mainView.addHeaderView()
        headerView.setTitle("transactionsTitle".localized)
    }
}
