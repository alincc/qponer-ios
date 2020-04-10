//
//  SearchPresenter.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 10.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

protocol SearchPresenterInput {
   
}

protocol SearchPresenterOutput {
    
}

class SearchPresenter {
    
    weak var view: SearchViewControllerInput?
    var interactor: SearchInteractorInput!
    var router: SearchRouterInput!
}

extension SearchPresenter: SearchPresenterInput {
    
}

extension SearchPresenter: SearchInteractorOutput {
    
}
