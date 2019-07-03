//
//  WeatherListTableViewController.swift
//  GoodWeatherApp
//
//  Created by Piyush Vaish on 01/07/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController:UITableViewController,SendWeatherInfoDelegate{

    //API Key = b6907d289e10d714a6e88b30761fae22
    var weatherListViewModel = WeatherListViewModel()
    var addWeatherCityViewController : AddWeatherCityViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weatherListViewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherCell else {
            return UITableViewCell()
        }
        let vm = weatherListViewModel.modelAt(index: indexPath.row)
        cell.configure(vm: vm)
        return cell
    }
    func sendWeatherInfoBack(weather: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(weatherViewModel: weather)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCitySegue"{
            if let addWeatherCityViewController = segue.destination.children.first as? AddWeatherCityViewController{
                addWeatherCityViewController.delegate = self
            }
        }
        
    }

}
