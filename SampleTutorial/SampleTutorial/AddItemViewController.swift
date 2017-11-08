//
//  AddItemViewController.swift
//  SampleTutorial
//
//  Created by Roman De Angel on 08/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit
import CoreData

class AddItemViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imgItem: UIImageView!
    
    @IBOutlet weak var lblItem: UILabel!
    
    var imgPicker = UIImagePickerController()
    
    var name = ""
    var image:NSData!
    var existingItem:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker.delegate = self
        
        if existingItem != nil {
            imgItem.image = UIImage(data: image as Data)
            lblItem.text = name
        }
        
        
    }

    
    
    @IBAction func btnTakeImage(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Please set an Image", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        let takePhotoAction = UIAlertAction(title: "Take Photo with Camera", style: UIAlertActionStyle.default) { (action) in
            self.imgPicker.sourceType = UIImagePickerControllerSourceType.camera
            self.present(self.imgPicker, animated: true, completion: nil)
        }
        
        let takePhotoFromAlbumAction = UIAlertAction(title: "Take Photo from Album", style: UIAlertActionStyle.default) { (action) in
            self.imgPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(self.imgPicker, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(takePhotoAction)
        alert.addAction(takePhotoFromAlbumAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
        
        //alert.addAction(UIAlertAction)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("Doing some picked image")
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgItem.image = image
        }
        
        imgPicker.dismiss(animated: true, completion: nil)
        print("Image was picked")
    }
    
    
    @IBAction func btnAddLabel(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add Label", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        let saveAction = UIAlertAction(title: "Save Label", style: UIAlertActionStyle.default) { (action) in
            
            let txtField = alert.textFields?.first
            self.lblItem.text = txtField?.text
            self.name = self.lblItem.text!
            
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        alert.addTextField { (txtField: UITextField) in
            
        }
        
        present(alert, animated: true, completion: nil)
        
        
    }

    @IBAction func btnSaveItem(_ sender: UIButton) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
        
        let data = UIImagePNGRepresentation(imgItem.image!)
        
        if existingItem != nil {
            existingItem.setValue(name, forKey: "name")
            existingItem.setValue(data, forKey: "image")
            
        } else {
        
            let item = Item(entity: entity!, insertInto: context)
        
            item.name = name
            item.image = data! as NSData
        
        }
        do{
            try context.save()
        } catch {
            print("error")
        }
        
        self.navigationController?.popViewController(animated: true)
        
        print("Item Saved")
        
        
    }
    

}
