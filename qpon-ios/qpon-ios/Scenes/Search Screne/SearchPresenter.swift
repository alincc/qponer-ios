//
//  SearchPresenter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol SearchPresenterInput {
    func didSelectBusinessType(type: BusinessType)
    func didSelectBusiness(at index: Int)
}

protocol SearchPresenterOutput {
    
}

class SearchPresenter {
    
    weak var view: SearchViewControllerInput?
    var interactor: SearchInteractorInput!
    var router: SearchRouterInput!
    var businesses: [BusnessOwnerResponse] = []
}

extension SearchPresenter: SearchPresenterInput {
    
    func didSelectBusinessType(type: BusinessType) {
        
    }
    
    func didSelectBusiness(at index: Int) {
        let business = self.interactor.businesses[0] // TODO:
        self.router.navigateToBusinessOwnerVC(with: business)
    }
}

extension SearchPresenter: SearchInteractorOutput {
    func latestBusinesses(_ latest: [BusnessOwnerResponse]) {
        self.businesses = latest
    }
    
    func businessesForType(_ type: BusinessType, businesses: [BusnessOwnerResponse]) {
        self.businesses = businesses
    }
}
