//
//  TabBarViewController.swift
//  Spendbase
//
//  Created by Alisher on 11.10.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTabs()
        self.setupTabBarAppearance()
    }
    
    // MARK: - Tab Setup
    private func setupTabs() {
        let home = createNav(with: "itemOne".localized, and: UIImage(named: TabBarIcons.iconHome), vc: HomeViewController())
        let transactions = createNav(with: "itemTwo".localized, and: UIImage(named: TabBarIcons.iconList), vc: TransactionsViewController())
        let myCards = createNav(with: "itemThree".localized, and: UIImage(named: TabBarIcons.iconCreditCard), vc: MyCardsViewController())
        let account = createNav(with: "itemFour".localized, and: UIImage(named: TabBarIcons.iconUserSquare), vc: AccountViewController())
        
        setViewControllers([home, transactions, myCards, account], animated: true)
    }
    
    // MARK: - NavBar Setup
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        let firstViewController = nav.viewControllers.first
        firstViewController?.navigationItem.title = title
        
        return nav
    }

    // MARK: - Appearance Setup
    private func setupTabBarAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            
            appearance.backgroundColor = UIColor(named: BrandColors.backgroundTwo)
            
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: BrandColors.systemFour)
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(named: BrandColors.systemFour) ?? UIColor.gray]
            
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: BrandColors.accentOne)
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named: BrandColors.accentOne) ?? UIColor.gray]

            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = appearance
        } else {
            self.tabBar.barTintColor = UIColor(named: BrandColors.backgroundTwo)
            self.tabBar.tintColor = UIColor(named: BrandColors.accentOne)
            self.tabBar.unselectedItemTintColor = UIColor(named: BrandColors.systemFour)
        }
    }
}
