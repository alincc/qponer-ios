//
//  AuthDto.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 7.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

class LoginRequest: Encodable {
    
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
    }
}

class LoginResponse: Codable {
    var jwt: String
    var customerId: Int64
    var username: String
    var type: UserType
    
    enum CodingKeys: String, CodingKey {
        case jwt
        case customerId
        case username
        case type
    }
}

enum UserType: String, Codable {
    case BUSSINESS_OWNER
    case CONTRIBUTOR
}
