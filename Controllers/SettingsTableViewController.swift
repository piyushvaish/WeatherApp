//
//  File.swift
//  GoodWeatherApp
//
//  Created by Piyush Vaish on 03/07/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation
import UIKit

class SettingsTableViewController : UITableViewController {
    var settingsViewModel = SettingsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    @IBAction func btnCloseClicked(_ sender: UIBarButtonItem) {
       
    }
    @IBAction func btnDoneClicked(_ sender: UIBarButtonItem) {
         self.dismiss(animated: true, completion: nil)
    }
}

extension SettingsTableViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Default") else{
            return UITableViewCell()
        }
        let unit = settingsViewModel.units[indexPath.row]
        cell.textLabel?.text = unit.displayName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .checkmark
        }
        
        let unit = settingsViewModel.units[indexPath.row]
        UserDefaults.standard.set(unit.displayName, forKey: "")
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .none
        }
        
    }
}
