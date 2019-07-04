//
//  SettingsViewModel.swift
//  GoodWeatherApp
//
//  Created by Piyush Vaish on 03/07/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation

enum Unit : String, CaseIterable {
    case celcius = "metric"
    case fahrenheit = "imperial"
}
// For display on screen purposes
extension Unit {
    var displayName : String{
        get{
            switch self{
                case .celcius : return "Celcius"
                case .fahrenheit : return "Fahrenheit"
            }
            
        }
    }
    
    var isSelected : Bool{
        get {
            return true
        }
    }
}
struct SettingsViewModel {
    let units = Unit.allCases
    var numberOfRows : Int {
        return Unit.allCases.count
    }
    
}
