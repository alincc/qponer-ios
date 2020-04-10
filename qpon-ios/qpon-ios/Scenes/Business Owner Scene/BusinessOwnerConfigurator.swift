//
//  BusinessOwnerConfigurator.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

class BusinessOwnerConfigurator {
    
    // MARK: - Configuration
    
    class func configure(viewController: BusinessOwnerViewController) {
        
        let router = BusinessOwnerRouter()
        let presenter = BusinessOwnerPresenter()
        let interactor = BusinessOwnerInteractor()
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        router.viewController = viewController
        viewController.presenter = presenter
        
    }
}
