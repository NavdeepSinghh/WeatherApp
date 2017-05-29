//
//  APIClient.swift
//  WeatherAppWH
//
//  Created by Navdeep  Singh on 5/29/17.
//  Copyright © 2017 Navdeep. All rights reserved.
//

import Foundation

class APIClient {
    
    fileprivate let apiKey = "ad80056d07b06631617d455f0795b7bc"
    
    lazy var baseURL : URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
    }()
    
    // For testing purpose make it var
    let downloader = JSONDownloader()
    typealias WeatherCompletionhandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getWeather(at location: Location, completionHandler completion: @escaping WeatherCompletionhandler){
        
        guard let url = URL(string: location.description, relativeTo: baseURL) else {
            completion(nil, .invalidURL)
            return
        }
        let request = URLRequest(url: url)
        let task = downloader.jsonTask(with: request) { (json, error) in
            
            DispatchQueue.main.async {
                
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                guard let currentWeatherJson = json["currently"] as? [String : AnyObject],
                    let currentWeather = CurrentWeather(json: currentWeatherJson) else {
                        completion(nil, .jsonParsingFailure)
                        return
                }
                completion(currentWeather, nil)
            }
        }                        
        task.resume()
    }
}
