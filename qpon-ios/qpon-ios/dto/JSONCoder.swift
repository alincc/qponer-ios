//
//  JSONCoder.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 7.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation

class JSONCoder {
    
    func decodeObject<T: Decodable>(dict: Dictionary<String, AnyObject>, completion: ((_ object: T?, _ decodingError: Error?) -> Void)? = nil) -> T? {
        var decodedObject: T?
         
        do {
            let deserialized = try JSONSerialization.data(withJSONObject: dict as Any, options: .prettyPrinted)
            let decoder = JSONDecoder()
            do {
                decodedObject = try decoder.decode(T.self, from: deserialized)
            } catch let error {
                completion?(nil, error)
                return nil
            }
        } catch let error {
            completion?(nil, error)
            return nil
        }
        completion?(decodedObject, nil)
        return decodedObject
    }
    
    func encodeObject<T: Encodable>(_ object: T) -> Dictionary<String, Any>? {
        
        let encoder = JSONEncoder()
        var encodedData: Data?
        
        do {
            encodedData = try encoder.encode(object)
        } catch {
        }
        
        do {
            if encodedData != nil {
                let encodedDataDict = try JSONSerialization.jsonObject(with: encodedData!, options: .allowFragments)
                
                return encodedDataDict as? Dictionary<String, Any>
            }
            
        } catch {
            //TODO:
        }
        
        return nil
    }
}
