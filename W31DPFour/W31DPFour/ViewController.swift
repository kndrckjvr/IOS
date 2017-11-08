//
//  ViewController.swift
//  W31DPFour
//
//  Created by Roman De Angel on 07/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnSave(_ sender: UIButton) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        let id = txtID.text!
        let name = txtName.text!
        let price = txtPrice.text!
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context)
        
        item.setValue(Int32(id), forKey: "id")
        item.setValue(name, forKey: "name")
        item.setValue(Double(price), forKey: "price")
        
        
        
        do{
            try context.save()
            print("Item Saved")
        } catch{
            print("Error")
        }
        
        txtID.text = ""
        txtName.text = ""
        txtPrice.text = ""
        
        
    }
    
    
    @IBAction func btnShow(_ sender: UIButton) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        do{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
            let results = try context.fetch(request)
            var i = 1
            for value in results as! [NSManagedObject]{
                //print(value.value(forKey: "id"))
                let id = value.value(forKey: "id")!
                let name = value.value(forKey: "name")!
                let price = value.value(forKey: "price")!
                
                print("Item \(i): \(id) \(name) \(price)")
                
                i += 1
                
            }
            
            
        } catch {
            print("Cannot Load Data: Error....")
        }
        
    }

}

