//
//  BallView.swift
//  MyAnimation
//
//  Created by Roman De Angel on 08/11/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit
class BallView: UIView {
    
    var lineWidth: CGFloat = 3 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    var color: UIColor = UIColor.red {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let radius = min(bounds.size.width, bounds.size.height) / 2 - lineWidth / 2
        
        let ball = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX , y: bounds.midY),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(2 * M_PI),
            clockwise: true)
        
        ball.lineWidth = lineWidth
        UIColor.red.setStroke()
        UIColor.brown.setFill()
        ball.stroke()
        ball.fill()
        
        let stitch1 = UIBezierPath()
        stitch1.addArc(
            withCenter: CGPoint(x: bounds.midX - radius, y: bounds.midY - radius),
                       radius: radius,
                       startAngle: 0,
                       endAngle: CGFloat(M_PI / 2),
                       clockwise: true)
        UIColor.white.setStroke()
        stitch1.stroke()
        
        let stitch2 = UIBezierPath()
        stitch2.addArc(
            withCenter: CGPoint(x: bounds.midX + radius, y: bounds.midY + radius),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(M_PI * 1.5),
            clockwise: true)
        //UIColor.white.setStroke()
        stitch2.stroke()
        
    }
    
    
    func containsPoints(_ point: CGPoint) -> Bool {
        let radius = min(bounds.size.width, bounds.size.height) / 2 - lineWidth / 2
        let ball = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX , y: bounds.midY ),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(2 * M_PI),
            clockwise: true)
        return ball.contains(point)
    }
    
    
    
}
