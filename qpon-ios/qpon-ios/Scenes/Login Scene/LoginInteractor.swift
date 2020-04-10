//
//  LoginInteractor.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 6.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol LoginInteractorInput {
    func login(username: String, password: String)
}

protocol LoginInteractorOutput {
    func loginSuccessful()
    func loginUnsuccessful()
}

class LoginInteractor: LoginInteractorInput {
    
    var output: LoginInteractorOutput?
    
    func login(username: String, password: String) {
        let login = LoginRequest(username: username, password: password)
        NetworkManager.shared.loginRequest(login: login) { (response, error) in
//            if error != nil {
//                // handle error
//            } else {
                self.output?.loginSuccessful()
//            }
        }
    }
}
