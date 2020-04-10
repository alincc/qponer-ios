//
//  DashboardPresenter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol DashboardPresenterInput {
   
}

protocol DashboardPresenterOutput {
    
}

class DashboardPresenter {
    
    weak var view: DashboardViewControllerInput?
    var interactor: DashboardInteractorInput!
    var router: DashboardRouterInput!
}

extension DashboardPresenter: DashboardPresenterInput {
    
}

extension DashboardPresenter: DashboardInteractorOutput {
    
}
