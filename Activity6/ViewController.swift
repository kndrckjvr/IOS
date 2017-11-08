//
//  ViewController.swift
//  Activity6
//
//  Created by KENDRICK ANDREW COSCA on 08/11/2017.
//  Copyright © 2017 KENDRICK ANDREW COSCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ball = BallView()

    override func viewDidLoad() {
        super.viewDidLoad()
        ball.frame = CGRect(x: view.bounds.midX - 50, y: 0, width: 100, height: 100)
        ball.backgroundColor = UIColor.clear
        ball.isOpaque = false
        self.view.addSubview(ball)
    }

    @IBAction func TapHandler(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: self.view)
        
        //let r:UInt32 = arc4random_uniform(UInt32(colors.count))
        
        //self.view.backgroundColor = colors[Int(r)]
        
        UIView.animate(withDuration: 1.0) {
            () -> Void in
            self.ball.center = point
        }
        
        
        print(point)
    }
    
    
    var ignorePan = false
    var panCenterOffset = CGPoint.zero

    @IBAction func PanHandler(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            let point = sender.location(in: ball)
            if(ball.containsPoints(point)){
                ignorePan = false
                panCenterOffset.x = ball.bounds.midX - point.x
                panCenterOffset.y = ball.bounds.midY - point.y
            } else {
                ignorePan = true
            }
            print("Panning at point \(point)")
        case .changed:
            if !ignorePan {
                let panLocation = sender.location(in: self.view)
                ball.center = CGPoint(x: panLocation.x + panCenterOffset.x, y: panLocation.y + panCenterOffset.y)
                
            }
            print("Panning Changed \(sender.location(in: self.view))")
        case .ended:
            ignorePan = false
            break
        default:
            break;
            
        }
    }
    @IBAction func PinchHandler(_ sender: UIPinchGestureRecognizer) {
        
        switch sender.state {
        case .began:
            print("Pinch Began")
        case .changed:
            ball.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
            print("Pinch Changed")
        case .ended:
            let newRect = ball.bounds.applying(ball.transform)
            ball.bounds = newRect
            ball.setNeedsDisplay()
            
            print("Pinch Ended")
        default:
            break
            
        }
    }
}

