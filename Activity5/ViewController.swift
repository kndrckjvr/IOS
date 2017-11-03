//
//  ViewController.swift
//  Activity5
//
//  Created by KENDRICK ANDREW COSCA on 27/10/2017.
//  Copyright © 2017 KENDRICK ANDREW COSCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let items1 = ["+", "-", "*", "/"]
    var num1, num2, op;
    
    @IBOutlet weak var lblRes: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return items.count
        } else if component == 1 {
            return items1.count
        } else {
            return items.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return items[row]
        } else if component == 1 {
            return items1[row]
        } else {
            return items[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            num1 = row
        } else if component == 1 {
            num2 = row
        } else {
            op = row
        }
        setResults(num1, num2, op)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

