//
//  HomeViewController.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class HomeViewController: UIViewController {
        
    //MARK: - View Initialization
    var headerView = HeaderView()
    var homeView = HomeView()
        
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupHeader()
        setupTableView()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //MARK: - Public Functions
    func navigateToSingleCardVC() {
        let singleCardVC = SingleCardViewController()
        self.navigationController?.pushViewController(singleCardVC, animated: true)
    }
    
    //MARK: - Private Functions
    private func setupUI() {
        homeView = HomeView(frame: self.view.bounds)
        self.view.addSubview(homeView)
    }
    
    private func setupHeader() {
        headerView = view.addHeaderView()
        headerView.setTitle("moneyTitle".localized)
    }
}
