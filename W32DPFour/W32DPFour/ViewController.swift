//
//  ViewController.swift
//  W32DPFour
//
//  Created by Roman De Angel on 07/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtID: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnShow(_ sender: UIButton) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        do{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
            let rs = try context.fetch(request)
            var i = 1
            for itemRS in rs as! [NSManagedObject] {
                let id = itemRS.value(forKey: "id")!
                let name = itemRS.value(forKey: "name")!
                let price = itemRS.value(forKey: "price")!
                print("Item \(i): \(id) \(name) \(price)")
                i += 1
                
            
            }
            
        } catch {
            print("Error Loading")
        }
    
    }
    
    
    @IBAction func btnSave(_ sender: UIButton) {
        let id = txtID.text!
        let name = txtName.text!
        let price = txtPrice.text!
        
        txtID.text = ""
        txtName.text = ""
        txtPrice.text = ""
        
        //save to core data
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context)
        
        item.setValue(Int32(id), forKey: "id")
        item.setValue(name, forKey: "name")
        item.setValue(Double(price), forKey: "price")
        
        
        do{
            try context.save()
            print("Item Saved")
        } catch {
            print("Error")
        }
        
    }
    

}

