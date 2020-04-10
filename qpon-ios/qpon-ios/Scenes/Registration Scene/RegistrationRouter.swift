//
//  RegistrationRouter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 7.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol RegistrationRouterInput {
    func navigateToHome()
}

class RegistrationRouter: RegistrationRouterInput {
    
    weak var viewController: RegistrationViewController?
    
    func navigateToHome() {
        
    }
}
