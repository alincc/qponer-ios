//
//  LeaderboardConfigurator.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

class LeaderboardConfigurator {
    
    // MARK: - Configuration
    
    class func configure(viewController: LeaderboardViewController) {
        
        let router = LeaderboardRouter()
        let presenter = LeaderboardPresenter()
        let interactor = LeaderboardInteractor()
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        router.viewController = viewController
        viewController.presenter = presenter
        
    }
}
