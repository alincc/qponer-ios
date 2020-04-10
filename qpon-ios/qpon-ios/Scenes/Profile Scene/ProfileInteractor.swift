//
//  ProfileInteractor.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol ProfileInteractorInput {
    func registeredCards() -> [Int]
}

protocol ProfileInteractorOutput {
    
}

class ProfileInteractor: ProfileInteractorInput {
    
    var output: ProfileInteractorOutput?

    func registeredCards() -> [Int] {
        return [1,2,3]
    }
}
