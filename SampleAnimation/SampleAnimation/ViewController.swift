//
//  ViewController.swift
//  SampleAnimation
//
//  Created by Roman De Angel on 25/10/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gravity = UIGravityBehavior()
    var itemBehavior = UIDynamicItemBehavior()
    var collision = UICollisionBehavior()
    var barrierIdentifier: Int = 0
    
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collision.translatesReferenceBoundsIntoBoundary = true
        itemBehavior.elasticity = 0.8
        animator.addBehavior(itemBehavior)
        animator.addBehavior(collision)
        animator.addBehavior(gravity)
        //let b = MyObj(frame:CGRect(x: self.view.bounds.size.width/2 - 75,y:self.view.bounds.size.height/2 - 75, width:150, height:150))
        //self.view.addSubview(b)
        //gravity.addItem(b)
        //collision.addItem(b)
        //itemBehavior.addItem(b)
        
    }

    @IBAction func tapHandler(_ sender: UITapGestureRecognizer) {
        let ball = MyObj(frame:CGRect(x: 0,y:0, width:30, height:30))
        ball.backgroundColor = UIColor.clear
        ball.color = UIColor.randomColor()//UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
        ball.center = sender.location(in: self.view)
        self.view.addSubview(ball)
        gravity.addItem(ball)
        collision.addItem(ball)
        itemBehavior.addItem(ball)
        
        print("You tap me \(sender.location(in: self.view))")
    }
}

private extension UIColor{
    static func randomColor() -> UIColor {
        let r = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let g = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let b = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}


