//
//  DarkSkyErrors.swift
//  WeatherAppWH
//
//  Created by Navdeep  Singh on 5/29/17.
//  Copyright © 2017 Navdeep. All rights reserved.
//

import Foundation

enum DarkSkyError : Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
}
