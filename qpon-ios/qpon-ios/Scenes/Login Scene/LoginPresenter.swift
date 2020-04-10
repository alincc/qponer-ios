//
//  LoginPresenter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 6.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol LoginPresenterInput {
    func didRequestLogin(name: String, password: String)
    func didRequestRegistertartion()
}

protocol LoginPresenterOutput {
    
}

class LoginPresenter {
    
    weak var view: LoginViewControllerInput?
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
}

extension LoginPresenter: LoginPresenterInput{
    func didRequestLogin(name: String, password: String) {
        self.interactor.login(username: name, password: password)
    }
    
    func didRequestRegistertartion() {
        self.router.navigateToRegistration()
    }
}

extension LoginPresenter: LoginInteractorOutput {
    
    func loginSuccessful() {
        self.router.navigateToHome()
    }
    
    func loginUnsuccessful() {
        self.router.showError()
    }
}
