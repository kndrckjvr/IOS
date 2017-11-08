//
//  ViewController.swift
//  SampleApp
//
//  Created by Roman De Angel on 28/10/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var txtItem: UITextField!

    @IBOutlet weak var tblItem: UITableView!
    
    var items:[String] = ["apple","orange","banana"]
    
    @IBAction func btnAddItem(_ sender: Any) {
        let item = txtItem.text!
        items.append(item)
        tblItem.reloadData()
        txtItem.text = ""
        txtItem.resignFirstResponder()
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        // Configure the cell...
        cell.detailTextLabel?.text = "Price"
        
        return cell
    }
    
    //delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if selectedItem.accessoryType == UITableViewCellAccessoryType.none {
        
            selectedItem.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            selectedItem.accessoryType = UITableViewCellAccessoryType.none
        }
        //print(indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let selectedItem:UITableViewCell = tableView.cellForRow(at: indexPath)!
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            selectedItem.accessoryType = UITableViewCellAccessoryType.none
            
        }
        
        
    }

}

