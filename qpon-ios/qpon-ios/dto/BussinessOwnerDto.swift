//
//  BusinessOwnerDto.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 7.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

struct BusnessOwnerResponse: Codable {
    var id: Int64
    var businessName: String
    var businessDescription: String
    var avatarUrl: String?
    var type: BusinessTypeDto
}

enum BusinessTypeDto: String, Codable {
    case RESTAURANT
    case BAR
    case CAFE //?
    case DISCO
}

class RankedContributorResponse: Decodable {
    var name: String
    var amount: Decimal //?
}
