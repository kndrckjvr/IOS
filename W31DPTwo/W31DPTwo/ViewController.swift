//
//  ViewController.swift
//  W31DPTwo
//
//  Created by Roman De Angel on 07/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var items:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "Item", ofType: "plist") {
            
            //dictionary
            /*
            if let values = NSDictionary(contentsOfFile: path) as? [String: Any] {
                
            }*/
            //Array
            if let values = NSArray(contentsOfFile: path) as? [String] {
                for item in values {
                    print(item)
                    items.append(item)
                }
            }
            
            
        
        }
        
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }

}

