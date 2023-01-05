//
//  UIHelpersDrawNumber.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-13.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawNumber: UIHelpers {
    
    class func drawNumber(rect: CGRect, number: Int, linewidth: CGFloat) -> UIBezierPath {
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        let numberpath = UIBezierPath()
        
        switch number {
        case 0:
            return UIBezierPath(ovalIn: rect)
        case 1:
            numberpath.move(to: CGPoint(x: x + w / 2 - linewidth / 2, y: y + linewidth))
            numberpath.addLine(to: CGPoint(x: x + w / 2 - linewidth / 2, y: y + h - linewidth))
        case 2:
            numberpath.move(to: CGPoint(x: x, y: y + 3 * h / 8))
            numberpath.addCurve(to: CGPoint(x: x + w, y: y + 3 * h / 8), controlPoint1: CGPoint(x: x + w / 8, y: y + 2 * h / 8), controlPoint2: CGPoint(x: x + 7 * w / 8, y: y + 2 * h / 8))
            numberpath.addCurve(to: CGPoint(x: x, y: y + h - linewidth), controlPoint1: CGPoint(x: x + 3 * w / 4, y: y + 4 * h / 8), controlPoint2: CGPoint(x: x + 2 * w / 4, y: y + 5 * h / 8))
            numberpath.addLine(to: CGPoint(x: x + w, y: y + h - linewidth))
        case 3:
            var radius: CGFloat = 0
            if w > h / 4 {
                radius = h / 4
                x = x + (w - h / 4) / 2
                w = h / 4
            }
            else {
                radius = w
                y = y + (h / 4 - w) / 2
                h = 4 * w
            }
            numberpath.addArc(withCenter: CGPoint(x: x, y: y + h / 4), radius: radius, startAngle: 3 * CGFloat.pi / 2, endAngle: CGFloat.pi / 2, clockwise: true)
            numberpath.addArc(withCenter: CGPoint(x: x, y: y + 3 * h / 4), radius: radius, startAngle: 3 * CGFloat.pi / 4, endAngle: CGFloat.pi / 2, clockwise: true)
        case 4:
            numberpath.move(to: CGPoint(x: x + 3 * w / 5, y: y + h - linewidth))
            numberpath.addLine(to: CGPoint(x: x + 3 * w / 5, y: y + linewidth))
            numberpath.addLine(to: CGPoint(x: x + linewidth, y: y + 7 * h / 10))
            numberpath.addLine(to: CGPoint(x: x + w - linewidth, y: y + 7 * h / 10))
        case 5:
            let sizeofraidus: CGFloat = 28
            var radius = sizeofraidus * h / 100
            if w > radius {
                x = x + (w - radius) / 2
                w = radius
            }
            else {
                radius = w
                h = radius * 100 / sizeofraidus
            }
            numberpath.move(to: CGPoint(x: x + w - linewidth, y: y + linewidth))
            numberpath.addLine(to: CGPoint(x: x + linewidth, y: y + linewidth))
            numberpath.addLine(to: CGPoint(x: x + linewidth, y: y + (100 - 2 * sizeofraidus) * h / 100))
            numberpath.addArc(withCenter: CGPoint(x: x, y: y + h - radius), radius: radius, startAngle: 3 * CGFloat.pi / 2, endAngle: CGFloat.pi / 2, clockwise: true)
        case 6:
            numberpath.move(to: CGPoint(x: x + w - linewidth, y: y + linewidth))
            numberpath.addLine(to: CGPoint(x: x + linewidth, y: y + h - linewidth))
            numberpath.addArc(withCenter: CGPoint(x: x + w / 2 + linewidth, y: y + 3 * h / 4 - linewidth ), radius: w / 2 - 2 * linewidth, startAngle: CGFloat.pi * 2, endAngle: 0, clockwise: true)
        case 7:
            numberpath.move(to: CGPoint(x: x + linewidth, y: y + linewidth))
            numberpath.addLine(to: CGPoint(x: x + w - linewidth, y: y + linewidth))
            numberpath.addLine(to: CGPoint(x: x + linewidth, y: y + h - linewidth))
        case 8:
            let radius = w / 2 > h / 4 ? h / 4 : w / 2
            numberpath.move(to: CGPoint(x: x + w / 2, y: y))
            numberpath.addQuadCurve(to: CGPoint(x: x + w / 2, y: y + 2 * radius), controlPoint: CGPoint(x: x + w / 2 - radius, y: y + radius))
            numberpath.addQuadCurve(to: CGPoint(x: x + w / 2, y: y + 4 * radius), controlPoint: CGPoint(x: x + w / 2 - radius, y: y + 3 * radius))
            numberpath.addQuadCurve(to: CGPoint(x: x + w / 2, y: y + 2 * radius), controlPoint: CGPoint(x: x + w / 2 + radius, y: y + 3 * radius))
            numberpath.addQuadCurve(to: CGPoint(x: x + w / 2, y: y), controlPoint: CGPoint(x: x + w / 2 + radius, y: y + radius))
            
            //numberpath.addArc(withCenter: CGPoint(x: x + w / 2, y: y + h / 2 - radius), radius: radius, startAngle: 2 * CGFloat.pi, endAngle: 0, clockwise: true)
            //numberpath.addArc(withCenter: CGPoint(x: x + w / 2, y: y + h / 2 + radius), radius: radius, startAngle: 2 * CGFloat.pi, endAngle: 0, clockwise: true)
        case 9:
            let radius = w / 2 > h / 4 ? h / 4 : w / 2
            numberpath.move(to: CGPoint(x: x + w - linewidth, y : y + h / 2 - radius))
            numberpath.addLine(to: CGPoint(x: x + w / 2, y: y + h - linewidth))
            numberpath.addArc(withCenter: CGPoint(x: x + w / 2 - linewidth, y: y + h / 2 - radius), radius: radius, startAngle: 2 * CGFloat.pi, endAngle: 0, clockwise: true)
        default:
            break
            
        }
        return numberpath
    }
    
}
