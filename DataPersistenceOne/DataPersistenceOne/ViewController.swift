//
//  ViewController.swift
//  DataPersistenceOne
//
//  Created by Roman De Angel on 04/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //OUTLETS

    let defaults = UserDefaults.standard
    
    
    @IBOutlet weak var txtValue: UITextField!
    
    @IBOutlet weak var lblValue: UILabel!
    
    
    @IBAction func btnValue(_ sender: UIButton) {
        let value = txtValue.text!
        lblValue.text = value
        defaults.set(value, forKey: "abc")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value = defaults.value(forKey: "abc") as! String? {
            lblValue.text = value
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    
    
    
    
    
    
    
    
    @IBAction func btnShowList(_ sender: UIButton) {
        if let path = Bundle.main.path(forResource: "NewPList", ofType: "plist") {
            //for dictionary
            //if let items = NSDictionary(contentsOfFile: path) as? [String: Any] {
                //some statement
            //}
            
            if let items = NSArray(contentsOfFile: path) as? [Any] {
                for item in items {
                    print(item)
                }
                
                let name = items.first as! [String: String]
                let fname = name["first_name"]
                let lname = name["last_name"]
                print("First name: \(fname!) Last name: \(lname!)")
                
                let baons = items[1] as! [NSNumber]
                var sum = 0
                
                for baon in baons {
                    sum += Int(baon)
                    //sum = 0
                }
                print("Total baon \(sum)")            }
            
        }
        
        
    }
    

}

