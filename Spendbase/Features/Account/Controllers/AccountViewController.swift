//
//  AccountViewController.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class AccountViewController: UIViewController {

    //MARK: - View Initialization
    var headerView: HeaderView?
    
    var mainView: AccountView {
        return view as! AccountView
    }
    
    override func loadView() {
        view = AccountView()
    }
        
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = view.addHeaderView()
        headerView?.setTitle(K.accountTitle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
