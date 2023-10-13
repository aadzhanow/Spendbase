//
//  SingleCardViewController+CollectionView.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit

//MARK: - UICollectionViewDataSource & UICollectionViewDelegate
extension SingleCardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func setupCollectionView() {
        mainView.buttonsCollectionView.delegate = self
        mainView.buttonsCollectionView.dataSource = self
        mainView.buttonsCollectionView.register(ButtonsCollectionViewCell.self, forCellWithReuseIdentifier: Cells.buttonsCell)
        mainView.buttonsCollectionView.isScrollEnabled = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let buttonModel = buttons[indexPath.row]
        buttonModel.action()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.buttonsCell, for: indexPath) as? ButtonsCollectionViewCell else {
            
            print("Error: Unable to dequeue and cast ButtonsCollectionViewCell.")

            let fallbackCell = UICollectionViewCell()
            return fallbackCell
        }

        let buttonModel = buttons[indexPath.row]
        cell.buttonIcon.image = buttonModel.icon?.withRenderingMode(.alwaysTemplate)
        cell.buttonTitleLabel.text = buttonModel.title

        return cell
    }

}

