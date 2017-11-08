//
//  ViewController.swift
//  DayOneAppOne
//
//  Created by Roman De Angel on 18/10/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMsg: UITextField!
    
    @IBOutlet weak var lblMsg: UILabel!
    
    @IBAction func btnMsg(_ sender: Any) {
        lblMsg.text = txtMsg.text
    }
    
    @IBAction func btnReset(_ sender: Any) {
        
        let alert = UIAlertController(title: "Reset", message: "Clear Value", preferredStyle: UIAlertControllerStyle.alert)
        
        let clearAction = UIAlertAction(title: "Reset", style: UIAlertActionStyle.default) { (result: UIAlertAction) -> Void in
            self.lblMsg.text = "Welcome to iOS"
            self.txtMsg.text = ""
        }
        
         let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
                                        
        alert.addAction(clearAction)
        alert.addAction(cancelAction)
        7
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}

