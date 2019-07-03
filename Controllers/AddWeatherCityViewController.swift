//
//  AddWeatherCityViewController.swift
//  GoodWeatherApp
//
//  Created by Piyush Vaish on 01/07/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation
import UIKit

protocol SendWeatherInfoDelegate: class {
    func sendWeatherInfoBack(weather: WeatherViewModel)
}

class AddWeatherCityViewController:UIViewController{
    
    @IBOutlet weak var txtFieldCity:UITextField!
    var weatherViewModel : WeatherViewModel?
    weak var delegate: SendWeatherInfoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    deinit {
        do {
            print("De Init called")
        }
    }
    
    @IBAction func btnCloseClicked(_ sender: UIBarButtonItem) {
        
        if let delegate = delegate,let weatherViewModel = self.weatherViewModel{
            delegate.sendWeatherInfoBack(weather:weatherViewModel)
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func btnSaveClicked(_ sender: UIButton) {
        
        if let city = txtFieldCity.text{//api.openweathermap.org/data/2.5/weather?q={city name}
            let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=9170faf98379956f2d7518f666dc99f2")!
            WebService().load(url: weatherUrl) {[weak self] (weather) in
                if let weather = weather{
                    self?.weatherViewModel = WeatherViewModel(weather: weather)
                    
                }
               
            }
        }
    }
}
