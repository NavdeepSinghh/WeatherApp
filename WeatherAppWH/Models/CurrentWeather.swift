//
//  CurrentWeather.swift
//  WeatherAppWH
//
//  Created by Navdeep  Singh on 5/29/17.
//  Copyright © 2017 Navdeep. All rights reserved.
//

import Foundation

struct CurrentWeather{
    let temperature : Double
    let humidity : Double
    let precipitationProb : Double
    let summary : String
    let icon : String
}

extension CurrentWeather {
    
    struct Key {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipitationProb = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    
    init?(json : [String: AnyObject]) {
        guard let tempValue = json[Key.temperature] as? Double,
        let humidityValue = json[Key.humidity] as? Double,
        let precipitationProbValue = json[Key.precipitationProb] as? Double,
        let summaryString = json[Key.summary] as? String,
            let iconString = json[Key.icon] as? String else {
                return nil
        }
        self.temperature = tempValue
        self.humidity = humidityValue
        self.precipitationProb = precipitationProbValue
        self.summary = summaryString
        self.icon = iconString
    }
}
