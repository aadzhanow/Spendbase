//
//  HomeViewController.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class HomeViewController: UIViewController {

    let myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        myLabel.text = "Hello, World!"
        myLabel.frame = CGRect(x: 20, y: 20, width: 200, height: 40)
        view.addSubview(myLabel)

    }


}

