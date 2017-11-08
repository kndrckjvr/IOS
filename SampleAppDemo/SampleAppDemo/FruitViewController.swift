//
//  FruitViewController.swift
//  SampleAppDemo
//
//  Created by Roman De Angel on 08/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class FruitViewController: UIViewController, UIImagePickerControllerDelegate {

    @IBOutlet weak var imgFruit: UIImageView!
    
    @IBOutlet weak var lblFruit: UILabel!
    
    var imgPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

   
    @IBAction func btnGet(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Take Piture", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { (action) in
            
            self.imgPicker.sourceType = UIImagePickerControllerSourceType.camera
            self.present(self.imgPicker, animated: true, completion: nil)
        
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default, handler: { (action) in
            
            self.imgPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(self.imgPicker, animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        
        present(alert, animated: true, completion: nil)
        
        
        
    }

    @IBAction func btnSet(_ sender: UIButton) {
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
    }
    
    
}
