//
//  SecondViewController.swift
//  W31DPOne
//
//  Created by Roman De Angel on 07/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblMsg: UILabel!

    var msg = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMsg.text = msg
    }

}
