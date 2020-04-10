//
//  RegistrationPresenter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 7.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol RegistrationPresenterInput {
   
}

protocol RegistrationPresenterOutput {
    
}

class RegistrationPresenter {
    
    weak var view: RegistrationViewControllerInput?
    var interactor: RegistrationInteractorInput!
    var router: RegistrationRouterInput!
    
}

extension RegistrationPresenter: RegistrationPresenterInput {
    
}

extension RegistrationPresenter: RegistrationInteractorOutput {
    
}
