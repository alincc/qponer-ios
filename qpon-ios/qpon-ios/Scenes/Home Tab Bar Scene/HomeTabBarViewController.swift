//
//  HomeTabBarViewController.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    enum HomeTab: Int {
        case dashboard = 0
        case search = 1
        case profile = 2
    }
    
    // MARK: - View lifecycle methods

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(with selectedViewController: HomeTab) {
        super.init(nibName: "HomeTabBarViewController", bundle: nil)
        self.setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(with selectedViewController: HomeTab = .dashboard) {

        let dashboardVC = DashboardViewController(nibName: "DashboardViewController", bundle: nil)
        let dashTabItem = UITabBarItem(title: "Начало", image: UIImage(named: "home"), tag: HomeTab.dashboard.rawValue)
        let dashboardNavVC = UINavigationController(rootViewController: dashboardVC)
        dashboardNavVC.navigationBar.tintColor = UIColor.darkBlueColor()
        dashboardNavVC.tabBarItem = dashTabItem

        let searchVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
        let searchTabItem = UITabBarItem(title: "Търси", image: UIImage(named: "search"), tag: HomeTab.search.rawValue)
        let searchNavVC = UINavigationController(rootViewController: searchVC)
        searchNavVC.navigationBar.tintColor = UIColor.darkBlueColor()
        searchNavVC.tabBarItem = searchTabItem
       
        let profileVC = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        let profileTabItem = UITabBarItem(title: "Профил", image: UIImage(named: "profile"), tag: HomeTab.profile.rawValue)
        let profileNavVC = UINavigationController(rootViewController: profileVC)
        profileNavVC.navigationBar.tintColor = UIColor.darkBlueColor()
        profileNavVC.tabBarItem = profileTabItem
        
        self.tabBar.tintColor = UIColor.primaryColor()
        
        self.viewControllers = [dashboardNavVC, searchNavVC, profileNavVC]
        self.selectedViewController = dashboardNavVC
       
        if selectedViewController == .search {
            self.selectedViewController = searchNavVC
        }
        if selectedViewController == .profile {
            self.selectedViewController = profileNavVC
        }
    }
}
