//
//  HomeViewController.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - View Initialization
    var mainView: HomeView {
        return view as! HomeView
    }
    
    override func loadView() {
        view = HomeView()
    }
    
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
