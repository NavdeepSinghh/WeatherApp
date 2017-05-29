//
//  JSONDownloader.swift
//  WeatherAppWH
//
//  Created by Navdeep  Singh on 5/29/17.
//  Copyright © 2017 Navdeep. All rights reserved.
//

import Foundation

class JSONDownloader {
    
    let session : MockURLSession
    
    init(configuration : URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    // For testing purpose
    init(session : MockURLSession) {
        self.session = session
    }
    
    convenience init() {
        self.init(configuration : .default)
    }
    
    typealias JSON = [String: AnyObject]
    typealias JSONTaskCompletionHandler =  (JSON?, DarkSkyError?) -> Void
    
    func jsonTask(with request : URLRequest, completionHandler completion : @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if response.statusCode == 200 {
                if let data = data {
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                        completion(json, nil)
                    } catch{
                        completion(nil, .jsonConversionFailure)
                    }
                }else{
                    completion(nil, .invalidData)
                }
            }else {
                completion(nil, .responseUnsuccessful)
            }
        }
        return task
    }
}
