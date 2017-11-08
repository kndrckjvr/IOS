//
//  ViewController.swift
//  MyCoreData
//
//  Created by Roman De Angel on 04/11/2017.
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

    @IBAction func btnAdd(_ sender: UIButton) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context)
        
        let id:Int32 = Int32(txtID.text!)!
        let name:String = txtName.text!
        let price:Double = Double(txtPrice.text!)!
        
        item.setValue(id, forKey: "id")
        item.setValue(name, forKey: "name")
        item.setValue(price, forKey: "price")
        
        do{
            try context.save()
            print("saved")
        } catch{
            print("Some error")
        }
        
        
    }
    
    @IBAction func btnList(_ sender: UIButton) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext

        do{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
            let result = try context.fetch(request)
            
            for item in result as! [NSManagedObject] {
                let id = item.value(forKey: "id") as! Int32
                let name = item.value(forKey: "name") as! String
                let price = item.value(forKey: "price") as! Double
                
                //print(item.value(forKey: "id") as! Int32)
                print("\(id) \(name) \(price)")
                
            }
            
        } catch {
            print("Error")
        }
        
        
    }

}

