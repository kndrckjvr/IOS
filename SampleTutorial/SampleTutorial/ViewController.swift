//
//  ViewController.swift
//  SampleTutorial
//
//  Created by Roman De Angel on 08/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var items = [Item]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        
        items = try! context.fetch(request) as! [Item]
        
        collectionView.reloadData()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "abc", for: indexPath) as! ItemCollectionViewCell
        
        //cell.itemImageView.image = UIImage(named: "apple.png")
        
        //cell.lblItem.text = "Apple"
        
        let item = items[indexPath.row]
        
        cell.itemImageView.image = UIImage(data: item.image! as Data)
        cell.lblItem.text = item.name
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            let indexPaths = collectionView.indexPathsForSelectedItems!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let selectedItem = items[indexPath.row]
            let destVC:AddItemViewController = segue.destination as! AddItemViewController
            
            destVC.existingItem = selectedItem
            destVC.image = selectedItem.image
            destVC.name = selectedItem.name!
            
        }
    }


}

