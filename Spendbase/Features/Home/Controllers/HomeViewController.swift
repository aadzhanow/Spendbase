//
//  HomeViewController.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var sampleCard1: Card!
    var sampleCard2: Card!
    var sampleCard3: Card!
        
    //MARK: - View Initialization
    var headerView: HeaderView?

    var mainView: HomeView {
        return view as! HomeView
    }
    
    override func loadView() {
        view = HomeView()
    }
        
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = view.addHeaderView()
        headerView?.setTitle(K.moneyTitle)
        
//        loadSampleData()
        setupTableView()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

