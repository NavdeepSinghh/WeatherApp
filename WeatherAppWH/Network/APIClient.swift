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
    
    let downloader = JSONDownloader()
    typealias WeatherCompletionhandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getWeather(at location: Location, completionHandler completion: @escaping WeatherCompletionhandler){
        
    }
}
