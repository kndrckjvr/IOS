//
//  SecondViewController.swift
//  W32DPOne
//
//  Created by Roman De Angel on 07/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblMsg: UILabel!
    var msg:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMsg.text = msg
        // Do any additional setup after loading the view.
    }

   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
