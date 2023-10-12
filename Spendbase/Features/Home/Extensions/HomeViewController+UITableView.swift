//
//  HomeViewController+TableView.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit

//MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        mainView.myCardsTableView.delegate = self
        mainView.myCardsTableView.dataSource = self
        mainView.myCardsTableView.register(MyCardCell.self, forCellReuseIdentifier: "MyCardCellIdentifier")
        mainView.myCardsTableView.separatorStyle = .none
        mainView.myCardsTableView.isScrollEnabled = false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let singleCardVC = SingleCardViewController()

        self.navigationController?.pushViewController(singleCardVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
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
