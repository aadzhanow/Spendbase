//
//  TransactionsViewController.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class TransactionsViewController: UIViewController {

    //MARK: - View Initialization
    var headerView: HeaderView?
    
    var mainView: TransactionsView {
        return view as! TransactionsView
    }
    
    override func loadView() {
        view = TransactionsView()
    }
        
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = view.addHeaderView()
        headerView?.setTitle(K.transactionsTitle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
