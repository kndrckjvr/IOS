//
//  ViewController.swift
//  SampleAppDemo
//
//  Created by Roman De Angel on 08/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "abc", for: indexPath) as! ItemCollectionViewCell
        
        cell.imgItem.image = UIImage(named: "banana.png")
        cell.lblItem.text = "Banana"
        
        return cell
        
    }
    

}

