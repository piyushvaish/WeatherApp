//
//  WeatherListViewModel.swift
//  GoodWeatherApp
//
//  Created by Piyush Vaish on 02/07/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherListViewModel = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(weatherViewModel:WeatherViewModel){
        weatherListViewModel.append(weatherViewModel)
    }
    
    var numberOfRows : Int{
        return weatherListViewModel.count
    }
    
    func modelAt(index:Int)->WeatherViewModel{
        return weatherListViewModel[index]
    }
    
}

struct WeatherViewModel {
    
    var weather : Weather
    var cityName : String{
        return weather.name
    }
    var cityTemperature : Double{
        return weather.main.temp
    }
}




