//
//  ItemsTableViewCell.swift
//  Paratical
//
//  Created by KENDRICK ANDREW COSCA on 03/11/2017.
//  Copyright © 2017 KENDRICK ANDREW COSCA. All rights reserved.
//

import UIKit

class ItemsTableViewCell: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items:[Item] = [
        Item(name: "Apple", desc: "Red Apple", imgSrc: "apple"),
        Item(name: "Lemon", desc: "Yellow Lemon", imgSrc: "lemon"),
        Item(name: "Strawberry", desc: "Red Strawberry", imgSrc: "straw"),
        Item(name: "Mango", desc: "Yellow Mango", imgSrc: "mango"),
        Item(name: "Grapes", desc: "Violet Grapes", imgSrc: "grape")
    ];
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].name
        cell.detailTextLabel?.text = items[indexPath.row].desc
        cell.imageView?.image = UIImage(named: items[indexPath.row].imgSrc)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = UIImage(named: items[0].imgSrc)
        lblTitle.text = items[0].name
        lblDetail.text = items[0].desc
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
