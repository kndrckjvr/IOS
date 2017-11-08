//
//  ViewController.swift
//  W31DPOne
//
//  Created by Roman De Angel on 07/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMsg: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc:SecondViewController = segue.destination as! SecondViewController
        
        vc.msg = txtMsg.text!
        
        
    }

}

