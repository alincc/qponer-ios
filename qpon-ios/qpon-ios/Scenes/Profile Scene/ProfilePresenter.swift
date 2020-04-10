//
//  ProfilePresenter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol ProfilePresenterInput {
   
}

protocol ProfilePresenterOutput {
    
}

class ProfilePresenter {
    
    weak var view: ProfileViewControllerInput?
    var interactor: ProfileInteractorInput!
    var router: ProfileRouterInput!
}

extension ProfilePresenter: ProfilePresenterInput {
    
}

extension ProfilePresenter: ProfileInteractorOutput {
    
}

