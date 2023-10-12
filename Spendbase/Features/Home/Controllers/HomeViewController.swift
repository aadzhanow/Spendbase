//
//  HomeViewController.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class HomeViewController: UIViewController {
        
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
