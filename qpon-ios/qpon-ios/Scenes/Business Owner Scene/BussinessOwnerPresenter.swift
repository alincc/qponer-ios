//
//  BussinessOwnerPresenter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol BusinessOwnerPresenterInput {
   
}

protocol BusinessOwnerPresenterOutput {
    
}

class BusinessOwnerPresenter {
    
    weak var view: BusinessOwnerViewControllerInput?
    var interactor: BusinessOwnerInteractorInput!
    var router: BusinessOwnerRouterInput!
}

extension BusinessOwnerPresenter: BusinessOwnerPresenterInput {
    
}

extension BusinessOwnerPresenter: BusinessOwnerInteractorOutput {
    
}

