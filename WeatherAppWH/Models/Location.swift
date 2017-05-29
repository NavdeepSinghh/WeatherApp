//
//  Location.swift
//  WeatherAppWH
//
//  Created by Navdeep  Singh on 5/29/17.
//  Copyright © 2017 Navdeep. All rights reserved.
//

import Foundation

struct Location {
    let latitude : Double
    let longitude : Double
}

extension Location : CustomStringConvertible {
    var description : String{
        return "\(latitude),\(longitude)"
    }
}
