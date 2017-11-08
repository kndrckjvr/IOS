//
//  ViewController.swift
//  W31DPThree
//
//  Created by Roman De Angel on 07/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblMsg: UILabel!

    @IBOutlet weak var txtMsg: UITextField!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let msg = defaults.value(forKey: "msg") as! String? {
            lblMsg.text = msg
        }
        
    }

    
    @IBAction func btnMsg(_ sender: UIButton) {
        let msg = txtMsg.text!
        lblMsg.text = msg
        defaults.set(msg, forKey: "msg")
        
    }

}

