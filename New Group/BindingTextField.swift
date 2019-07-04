//
//  BindingTextField.swift
//  GoodWeatherApp
//
//  Created by Piyush Vaish on 04/07/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField : UITextField{
    
    var textChangeClosure : (String) -> () = { _ in}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func bind(callback: @escaping (String)->()){
        self.textChangeClosure = callback
    }
    
    private func commonInit(){
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(textfield: UITextField){
        if let text = textfield.text{
            self.textChangeClosure(text)
        }
    }
    
}
