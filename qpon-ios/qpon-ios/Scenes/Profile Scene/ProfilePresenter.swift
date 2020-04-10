//
//  ProfilePresenter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol ProfilePresenterInput {
    func registeredCards() -> [Int]
    func numberOfRegisteredCards() -> Int
}

protocol ProfilePresenterOutput {
    
}

class ProfilePresenter {
    
    weak var view: ProfileViewControllerInput?
    var interactor: ProfileInteractorInput!
    var router: ProfileRouterInput!
}

extension ProfilePresenter: ProfilePresenterInput {
    
    func numberOfRegisteredCards() -> Int {
        return self.interactor.registeredCards().count
    }
    
    func registeredCards() -> [Int] {
        return self.interactor.registeredCards()
    }
}

extension ProfilePresenter: ProfileInteractorOutput {
    
}

