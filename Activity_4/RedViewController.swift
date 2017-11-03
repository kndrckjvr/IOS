//
//  RedViewController.swift
//  Activity_4
//
//  Created by Katrin Villanes on 16/10/2017.
//  Copyright © 2017 FEU Tech. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    @IBOutlet weak var lblMsg: UILabel!
    @IBOutlet weak var txtMsg: UITextField!
    
    @IBAction func btnShow(_ sender: Any) {
        lblMsg.text = txtMsg.text
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
