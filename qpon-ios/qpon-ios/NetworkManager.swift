//
//  NetworkManager.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 7.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

enum NetworkServicePath: String {
    case login = "api/auth/login"
}

class NetworkManager: SessionManager {
    
    static let shared: NetworkManager = NetworkManager()

    var baseURL: String!
    
    private init() {
    
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        super.init(configuration: configuration)
        self.baseURL = config.baseUrl
    }
    
    @discardableResult
    func makeRequest(path: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding = JSONEncoding.default, shouldFailOnAuthError: Bool = false, completion: @escaping (_ task: URLSessionTask?, _ error: Error?) -> Void) -> URLSessionTask? {
        
        let url = (self.baseURL + path) as URLConvertible
        
        let dataRequest = self.request(url, method: method, parameters: parameters, encoding: encoding)
        
        dataRequest.response { (response) in
            if let statusCode = response.response?.statusCode {
                switch statusCode {
                    
                case 401: //etc
                    return
                default:
                    break
                }
            }
            completion(dataRequest.task, response.error)
        }
        
        return nil
    }
    
    @discardableResult
    func makeRequest(path: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding = JSONEncoding.default, shouldFailOnAuthError: Bool = false, completion: @escaping (_ task: URLSessionTask?, _ json: [String: AnyObject]?, _ error: Error?) -> Void) -> URLSessionTask? {
                
        let url = (self.baseURL + path) as URLConvertible
        
        let dataRequest = self.request(url, method: method, parameters: parameters, encoding: encoding)
                
        dataRequest.responseJSON { (response) in
            
            if let statusCode = response.response?.statusCode {
                switch statusCode {
                    
                case 401: //etc
                    // TODO:
                    return
                default:
                    break
                }
            }
            switch response.result {
            case .success(let value):
                if let json = value as? [String: AnyObject] {
                    //TODO: custom errors?
                    completion(dataRequest.task, json, nil)
                }
            case .failure(let error):
                completion(dataRequest.task, nil, error)
            }
        }
        return dataRequest.task
    }
    
    @discardableResult
       func post<M: Encodable, T: Decodable>(path: String, object: M?, encoding: ParameterEncoding = JSONEncoding.default, completion: @escaping (_ task: URLSessionTask?, _ object: T?, _ error: Error?, _ success: Bool) -> Void) -> URLSessionTask? {
           
           let coder = JSONCoder()
           let parameters = coder.encodeObject(object)
           
           let task = self.makeRequest(path: path, method: .post, parameters: parameters, encoding: encoding) { (task, json, error) in
               if error != nil {
                   completion(task, nil, error, false)
               }
               if json != nil {
                   let _: T? = coder.decodeObject(dict: json!, completion: { (object, decodingError) in
                       if object != nil {
                           completion(task, object, nil, true)
                       } else {
                           completion(task, nil, decodingError, false)
                       }
                   })
               }
           }
           return task
       }
    
    func loginRequest(login: LoginRequest, completion: @escaping (_ loginResponse: LoginResponse?,_ error: Error?) -> Void) {
        post(path: NetworkServicePath.login.rawValue, object: login) { (task, response: LoginResponse?, error, success) in
            completion(response, error)
        }
    }
    
//    // MARK: - Search
//    
//    func urlString(searchText: String) -> URL {
//       let encodedText = searchText.addingPercentEncoding(withAllowedCharacters:
//                                                          CharacterSet.urlQueryAllowed)!
//       
//       let urlString = String(format: baseURL + "/search?name=%@", encodedText) // ??
//       let url = URL(string: urlString)
//       return url!
//    }
//    
//    /// Parse JSON data
//    func parse(data: Data) -> BissnessOwnerResponse {
//      do {
//          let decoder = JSONDecoder()
//          let result = try decoder.decode(BissnessOwnerResponse.self, from:data)
//          return result
//      } catch {
//          print("Error: \(error)")
//          return []
//      }
//    }
//    
//    func search(search term: String) -> Observable<BissnessOwnerResponse> {
//        let url = urlString(searchText: term)
//        let request = URLRequest(url: url)
//        let session = URLSession.shared
//
//        return session.rx.data(request: request).map { self.parse(data: $0) }
//    }
}
