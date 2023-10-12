//
//  MyCardsViewController.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class MyCardsViewController: UIViewController {

    //MARK: - View Initialization
    var headerView: HeaderView?
    
    var mainView: MyCardsView {
        return view as! MyCardsView
    }
    
    override func loadView() {
        view = MyCardsView()
    }
        
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = view.addHeaderView()
        headerView?.setTitle(K.myCardsTitle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
