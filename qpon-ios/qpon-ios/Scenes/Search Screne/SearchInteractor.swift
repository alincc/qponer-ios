//
//  SearchInteractor.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation


protocol SearchInteractorInput {
    var businesses: [BusnessOwnerResponse] { get set }
    func fetchLatestBusinesses()
    func filterBusinessByType(_ type: BusinessType)
}

protocol SearchInteractorOutput {
    func latestBusinesses(_ latest: [BusnessOwnerResponse])
    func businessesForType(_ type: BusinessType, businesses: [BusnessOwnerResponse])
}

class SearchInteractor: SearchInteractorInput {
    
    var output: SearchInteractorOutput?
    
    var businesses: [BusnessOwnerResponse] = [BusnessOwnerResponse(id: 75858587, businessName: "Космос", businessDescription: "Модерна българска кухня", avatarUrl: "", type: BusinessTypeDto.RESTAURANT)]
    
    func fetchLatestBusinesses() {
        self.output?.latestBusinesses([])
    }
    
    func filterBusinessByType(_ type: BusinessType) {
        //TODO: Work
        self.output?.businessesForType(type, businesses: [])
      }

}
