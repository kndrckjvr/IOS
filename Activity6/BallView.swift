//
//  BallView.swift
//  Activity6
//
//  Created by KENDRICK ANDREW COSCA on 08/11/2017.
//  Copyright © 2017 KENDRICK ANDREW COSCA. All rights reserved.
//

import UIKit

class BallView: UIView {
    var lineStroke: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        let radius = min(bounds.size.width, bounds.size.height)/2 - lineStroke / 2
        
        let ball = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: CGFloat(radius),
            startAngle: 0,
            endAngle: CGFloat(2 * Double.pi),
            clockwise: true)
        ball.lineWidth = lineStroke
        UIColor.yellow.setStroke()
        UIColor.black.setFill()
        ball.stroke()
        ball.fill()
        
        let stitch1 = UIBezierPath()
        stitch1.addArc(
            withCenter: CGPoint(x: bounds.midX - radius, y: bounds.midY - radius),
            radius: radius,
            startAngle: 45,
            endAngle: 135,
            clockwise: true)
        UIColor.red.setStroke()
        stitch1.stroke()
        
        let stitch2 = UIBezierPath()
        stitch2.addArc(
            withCenter: CGPoint(x: bounds.midX + radius, y: bounds.midY + radius),
            radius: radius,
            startAngle: 225,
            endAngle: 315,
            clockwise: true)
        UIColor.blue.setStroke()
        stitch2.stroke()
        
    }

    func containsPoints(_ point: CGPoint) -> Bool {
        let radius = min(bounds.size.width, bounds.size.height) / 2 - lineStroke / 2
        let ball = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX , y: bounds.midY ),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(2 * M_PI),
            clockwise: true)
        return ball.contains(point)
    }
    
}
