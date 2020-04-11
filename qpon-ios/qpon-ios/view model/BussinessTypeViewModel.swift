//
//  BusinessTypeViewModel.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 11.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation
import UIKit

enum BusinessCategory {
    case restaurant
    case bar
    case cafe
    case club
}

struct BusinessType {
    var name: String
    var image: UIImage
    var category: BusinessCategory
}

class BusinessViewModel {
    
    static var businessTypes = [
        BusinessType(name: "Ресторанти", image: UIImage(named: "restaurant type")!, category: .restaurant),
        BusinessType(name: "Барове", image: UIImage(named: "bar type")!, category: .bar),
        BusinessType(name: "Кафенета", image: UIImage(named: "cafe type")!, category: .cafe),
        BusinessType(name: "Дискотеки", image: UIImage(named: "club type")!, category: .club)
    ]
}



