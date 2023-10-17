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
        homeView.myCardsTableView.delegate = self
        homeView.myCardsTableView.dataSource = self
        homeView.myCardsTableView.register(MyCardCell.self, forCellReuseIdentifier: Cells.myCardCell)
        homeView.myCardsTableView.separatorStyle = .none
        homeView.myCardsTableView.isScrollEnabled = false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToSingleCardVC()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.myCardCell, for: indexPath) as? MyCardCell else {
            
            print("Error: Unable to dequeue and cast MyCardCell.")

            let fallbackCell = UITableViewCell()
            fallbackCell.textLabel?.text = "errorLoading".localized
            return fallbackCell
        }

        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
