//
//  RegistartionConfigurator.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 7.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

class RegistrationConfigurator {
    
    // MARK: - Configuration
    
    class func configure(viewController: RegistrationViewController) {
        
        let router = RegistrationRouter()
        let presenter = RegistrationPresenter()
        let interactor = RegistrationInteractor()
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        router.viewController = viewController
        viewController.presenter = presenter
        
    }
}
