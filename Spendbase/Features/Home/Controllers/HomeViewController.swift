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
        
        loadSampleData()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        mainView.myCardsTableView.delegate = self
        mainView.myCardsTableView.dataSource = self
        mainView.myCardsTableView.register(MyCardCell.self, forCellReuseIdentifier: "MyCardCellIdentifier")
        mainView.myCardsTableView.separatorStyle = .none
        mainView.myCardsTableView.isScrollEnabled = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCardCellIdentifier", for: indexPath) as! MyCardCell
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
