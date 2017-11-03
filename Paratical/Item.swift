//
//  Item.swift
//  Paratical
//
//  Created by KENDRICK ANDREW COSCA on 03/11/2017.
//  Copyright © 2017 KENDRICK ANDREW COSCA. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var desc: String
    var imgSrc: String
    
    init(name: String, desc: String, imgSrc: String) {
        self.name = name
        self.desc = desc
        self.imgSrc = imgSrc
    }
}
