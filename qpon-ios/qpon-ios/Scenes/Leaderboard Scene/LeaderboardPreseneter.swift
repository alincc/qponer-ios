//
//  LeaderboardPreseneter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol LeaderboardPresenterInput {
   
}

protocol LeaderboardPresenterOutput {
    
}

class LeaderboardPresenter {
    
    weak var view: LeaderboardViewControllerInput?
    var interactor: LeaderboardInteractorInput!
    var router: LeaderboardRouterInput!
}

extension LeaderboardPresenter: LeaderboardPresenterInput {
    
}

extension LeaderboardPresenter: LeaderboardInteractorOutput {
    
}
