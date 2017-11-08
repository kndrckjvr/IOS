//
//  ViewController.swift
//  ColorApp
//
//  Created by Roman De Angel on 25/10/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var myView: UIView!
    
    var rgb: (r:Float, g:Float, b:Float) = (0.0,0.0,0.0) {
        didSet{
            redSlider.value = rgb.r
            greenSlider.value = rgb.g
            blueSlider.value = rgb.b
            myView.backgroundColor = UIColor(red: CGFloat(rgb.r), green: CGFloat(rgb.g), blue: CGFloat(rgb.b), alpha: 1.0)
            
        }
    
    }
    
    
    @IBAction func btnPickColor(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Pick Color", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let redAction = UIAlertAction(title: "RED", style: UIAlertActionStyle.default){
            (action: UIAlertAction) -> Void in
            
            self.rgb = (1.0,0.0,0.0)
            
            
            //self.myView.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            //self.redSlider.value = 1.0
        }
        
        actionSheet.addAction(redAction)
        
        present(actionSheet, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func btnReset(_ sender: Any) {
        
        let alert = UIAlertController(title: "Reser", message: "Reset Color?", preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "GO", style: UIAlertActionStyle.default){
            (action: UIAlertAction) -> Void in
            self.myView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
            self.redSlider.value = 0.5
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        
        alert.addAction(action)
        alert.addAction(actionCancel)
        
        present(alert, animated: true, completion: nil)
        
        
        /*
        alert.addAction(UIAlertAction(title: "GO", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction) -> Void in
            self.myView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
            self.redSlider.value = 0.5
        })*/
    }
    @IBAction func doAction(_ sender: UISlider) {
        myView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    }

}

