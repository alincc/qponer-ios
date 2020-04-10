//
//  LoginRouter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 6.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouterInput {
    func navigateToHome()
    func navigateToRegistration()
    func showError()
}

class LoginRouter: LoginRouterInput {
    
    weak var viewController: LoginViewController!
    
    func navigateToHome() {
        let tabBarVC = HomeTabBarViewController(with: .dashboard)
        tabBarVC.modalPresentationStyle = .fullScreen
        self.viewController.present(tabBarVC, animated: true, completion: nil)
    }
    
    func navigateToRegistration() {
        
    }
    
    func showError() {
        
    }
}
