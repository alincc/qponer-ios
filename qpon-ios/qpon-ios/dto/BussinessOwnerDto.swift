//
//  BussinessOwnerDto.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 7.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

struct BissnessOwnerResponse: Codable {
    var id: Int64
    var bussinessName: String
    var bussinessDescription: String
    var avatarUrl: String?
    var type: BussinessTypeDto
}

enum BussinessTypeDto: String, Codable {
    case RESTAURANT
    case BAR
    case DISCO
}

class RankedContributorResponse: Decodable {
    var name: String
    var amount: Decimal //?
}
