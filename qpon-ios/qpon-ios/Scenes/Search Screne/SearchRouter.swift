//
//  SearchRouter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol SearchRouterInput {
    func navigateToBusinessOwnerVC(with businessOwner: BusnessOwnerResponse)
}

class SearchRouter: SearchRouterInput {
    
    weak var viewController: SearchViewController?
    
    func navigateToBusinessOwnerVC(with businessOwner: BusnessOwnerResponse) {
        let businessOwnerVC = BusinessOwnerViewController(nibName: "BusinessOwnerViewController", bundle: nil)
        self.viewController?.navigationController?.pushViewController(businessOwnerVC, animated: true)
    }
}
