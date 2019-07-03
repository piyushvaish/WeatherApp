//
//  WebService.swift
//  GoodWeatherApp
//
//  Created by Piyush Vaish on 02/07/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation

class WebService{
    
    func load(url:URL,completion: @escaping ((Weather?)->Void)){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let result = try? JSONDecoder().decode(Weather.self, from: data)
                if let result = result {
                    completion(result)
                }
                else{
                    completion(nil)
                }
            }
        }.resume()
    }
}
