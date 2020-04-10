//
//  LoginConfigurator.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 6.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

class LoginConfigurator {
 
    // MARK: - Configuration
    
    class func configure(viewController: LoginViewController) {
        
        let router = LoginRouter()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        router.viewController = viewController
        viewController.presenter = presenter
    }
}
