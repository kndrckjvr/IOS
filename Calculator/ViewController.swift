//
//  ViewController.swift
//  Calculator
//
//  Created by KENDRICK ANDREW COSCA on 03/10/2017.
//  Copyright © 2017 KENDRICK ANDREW COSCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTf: UITextField!
    @IBOutlet weak var secondTf: UITextField!
    @IBOutlet weak var resLabel: UILabel!
    @IBAction func addBtn(_ sender: Any) {
    
        let n1 = Float(firstTf.text!)
        let n2 = Float(secondTf.text!)
        if(n1 == nil || n2 == nil) {
            resLabel.text = "Error: Numbers Only!"
            return
        }
        resLabel.text = "Answer: \(n1! + n2!)";
    }
    @IBAction func subBtn(_ sender: Any) {
        let n1 = Float(firstTf.text!)
        let n2 = Float(secondTf.text!)
        if(n1 == nil || n2 == nil) {
            resLabel.text = "Error: Numbers Only!"
            return
        }
        resLabel.text = "Answer: \(n1! - n2!)";
        
    }
    @IBAction func divBtn(_ sender: Any) {
        let n1 = Float(firstTf.text!)
        let n2 = Float(secondTf.text!)
        if(n1 == nil || n2 == nil) {
            resLabel.text = "Error: Numbers Only!"
            return
        }
        resLabel.text = "Answer: \(n1! / n2!)";
        if(n2 == 0) {
            resLabel.text = "Error: Undefined"
        }
    }
    @IBAction func mulBtn(_ sender: Any) {
        let n1 = Float(firstTf.text!)
        let n2 = Float(secondTf.text!)
        
        if(n1 == nil || n2 == nil) {
            resLabel.text = "Error: Numbers Only!"
            return
        }
        resLabel.text = "Answer: \(n1! * n2!)";
        
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

