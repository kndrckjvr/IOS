//
//  ViewController.swift
//  W32DPTwo
//
//  Created by Roman De Angel on 07/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var itemList:[String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "Item", ofType: "plist")
        
        //Dictionary
        /*
        if let items = NSDictionary(contentsOfFile: <#T##String#>)as? [String: Any] {
            
        }*/
        
        if let items = NSArray(contentsOfFile: path!) as? [String] {
            for item in items {
                print(item)
                itemList.append(item)
            }
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return itemList[row]
    }

}

