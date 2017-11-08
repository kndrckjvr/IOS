//
//  MyObj.swift
//  SampleAnimation
//
//  Created by Roman De Angel on 25/10/2017.
//  Copyright © 2017 Roman De Angel. All rights reserved.
//

import UIKit
class MyObj: UIView {
    var lineWidth: CGFloat = 10 {
        didSet{
            setNeedsDisplay()
        }
    }
    var color: UIColor = UIColor.red{
        didSet{
            setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        let radius = min(bounds.size.width, bounds.size.height)/2 - lineWidth / 2
    
        let ball = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: CGFloat(radius),
            startAngle: 0,
            endAngle: CGFloat(2 * Double.pi),
            clockwise: true)
        
        ball.lineWidth = lineWidth
        color.setStroke()
        ball.stroke()
    }
}
