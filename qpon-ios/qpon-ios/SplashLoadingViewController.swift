//
//  ViewController.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 5.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

class SplashLoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: determine if user is logged in
        // navigate to login or home
//        self.navigateToLogin()
        self.navigateToHome()
    }
    
    func navigateToLogin() {
        let loginVC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func navigateToHome() {
        let tabBarVC = HomeTabBarViewController(with: .dashboard)
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
    }
}

