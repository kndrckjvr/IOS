//
//  SecondViewController.swift
//  SampleAppThree
//
//  Created by Roman De Angel on 28/10/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblMsg: UILabel!
    
    var myMsg:String = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        lblMsg.text = myMsg
        // Do any additional setup after loading the view.
    }

    
}
