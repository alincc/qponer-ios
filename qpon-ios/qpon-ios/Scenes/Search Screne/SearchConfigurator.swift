//
//  SearchConfigurator.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation


class SearchConfigurator {
    
    // MARK: - Configuration
    
    class func configure(viewController: SearchViewController) {
        
        let router = SearchRouter()
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        router.viewController = viewController
        viewController.presenter = presenter
        
    }
}
