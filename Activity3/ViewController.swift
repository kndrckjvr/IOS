//
//  ViewController.swift
//  Activity3
//
//  Created by KENDRICK ANDREW COSCA on 10/10/2017.
//  Copyright © 2017 KENDRICK ANDREW COSCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,   UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var reset: UIButton!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func submitBtn(_ sender: Any) {
        label.text = textField.text
    }
    @IBAction func responderBtn(_ sender: Any) {
        textField.resignFirstResponder()
    }
    @IBAction func resetBtn(_ sender: Any) {
        label.text = "Label"
        textField.text = ""
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

