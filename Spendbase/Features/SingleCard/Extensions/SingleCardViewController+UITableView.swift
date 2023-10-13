//
//  SingleCardViewController+UITableView.swift
//  Spendbase
//
//  Created by Alisher on 13.10.2023.
//

import UIKit


//MARK: - UITableViewDataSource, UITableViewDelegate
extension SingleCardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        mainView.activityTableView.delegate = self
        mainView.activityTableView.dataSource = self
        mainView.activityTableView.register(ActivityTableViewCell.self, forCellReuseIdentifier: Cells.activityCell)
        mainView.activityTableView.separatorStyle = .none
        
        if #available(iOS 15.0, *) {
            mainView.activityTableView.sectionHeaderTopPadding = 0
        } else {
            mainView.activityTableView.contentInset.top = 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TableViewSectionHeader()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.activityCell, for: indexPath) as? ActivityTableViewCell else {
            
            print("Error: Unable to dequeue and cast ActivityTableViewCell.")

            let fallbackCell = UITableViewCell()
            fallbackCell.textLabel?.text = K.errorLoading
            return fallbackCell
        }

        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

