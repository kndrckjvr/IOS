//
//  ViewController.swift
//  SampleAppTwo
//
//  Created by Roman De Angel on 28/10/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let itemOne:[String] = ["apple","orange","mango","banana"]
    let itemTwo:[String] = ["coke","sprite","mirinda","ponkana","rc","mountain dew"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return itemOne.count
        } else {
            return itemTwo.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return itemOne[row]
        } else {
            return itemTwo[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            print(itemOne[row])
        } else {
            print(itemTwo[row])
        }
    }

}

