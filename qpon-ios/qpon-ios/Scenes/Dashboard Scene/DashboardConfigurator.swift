//
//  DashboardConfigurator.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

class DashboardConfigurator {
    
    // MARK: - Configuration
    
    class func configure(viewController: DashboardViewController) {
        
        let router = DashboardRouter()
        let presenter = DashboardPresenter()
        let interactor = DashboardInteractor()
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        router.viewController = viewController
        viewController.presenter = presenter
        
    }
}
