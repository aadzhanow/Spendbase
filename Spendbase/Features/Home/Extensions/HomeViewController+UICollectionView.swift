//
//  HomeViewController+UICollectionView.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit

//MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func setupCollectionView() {
        mainView.recentTransactionsCollectionView.delegate = self
        mainView.recentTransactionsCollectionView.dataSource = self
        mainView.recentTransactionsCollectionView.register(TransactionCollectionCell.self, forCellWithReuseIdentifier: Cells.transactionCell)
        mainView.recentTransactionsCollectionView.isScrollEnabled = false
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.transactionCell, for: indexPath) as? TransactionCollectionCell else {
            
            print("Error: Unable to dequeue and cast TransactionCollectionCell.")

            let fallbackCell = UICollectionViewCell()
            
            return fallbackCell
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
