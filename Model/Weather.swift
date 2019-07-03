//
//  Weather.swift
//  GoodWeatherApp
//
//  Created by Piyush Vaish on 02/07/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation

struct Weather : Decodable{
    
    var name : String
    var main : Temperature
    
}

struct Temperature : Decodable{
    
    var temp: Double
    var pressure : Double
    var humidity : Double
    var temp_min : Double
    var temp_max : Double
    
}
