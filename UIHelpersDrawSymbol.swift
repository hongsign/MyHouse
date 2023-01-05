//
//  UIHelpersDrawSymbol.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-18.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawSymbol: UIHelpers {
    
    enum UISymbolType: String {
        case spiral
        case wifi
    }
    
    func drawSymbol(type: UISymbolType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, linewidth: CGFloat,
                    bgcolor: UIColor? = UIColor.clear,
                    startangle: CGFloat? = 0, endangle: CGFloat? = 0, numberofarc: Int? = 0, radiusincremental: CGFloat? = 0, isdashed: Bool? = false, dashpattern: [NSNumber]? = [1]) -> CAShapeLayer {
        switch type {
        case .wifi:
            return drawWifi(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, linewidth: linewidth)
        case .spiral:
            return drawSpiral(rect: rect, startangle: startangle!, endangle: endangle!, linewidth: linewidth, strokecolor: strokecolor, fillcolor: fillcolor, numberofarc: numberofarc!, radiusincremental: radiusincremental!, isdashed: isdashed!, dashpattern: dashpattern!)
        }
    }
    
    //DOES NOT WORK YET
    private func drawSpiral(rect: CGRect, startangle: CGFloat, endangle: CGFloat, linewidth: CGFloat, strokecolor: UIColor, fillcolor: UIColor, numberofarc: Int, radiusincremental: CGFloat, isdashed: Bool, dashpattern: [NSNumber]?=nil) -> CAShapeLayer {
        
        let π = CGFloat.pi
        
        var startAngle: CGFloat = startangle
        var endAngle: CGFloat = endangle
        
        var center = CGPoint(x: rect.origin.x + rect.size.width / 2, y: rect.origin.y + rect.size.height / 3)
        
        //initial radius
        var radius: CGFloat = rect.size.width / 90
        
        //1st arc
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        //rest of arcs
        for _ in 1..<numberofarc {
            startAngle = endAngle
            switch startAngle {
            case 0, 2*π:
                center = CGPoint(x: center.x - radius/2, y: center.y)
                endAngle = π/2
            case π:
                center = CGPoint(x: center.x + radius/2, y: center.y)
                endAngle = 3*π/2
            case π/2:
                center = CGPoint(x: center.x, y: center.y - radius / 2)
                endAngle = π
            case 3*π/2:
                center = CGPoint(x: center.x, y: center.y + radius / 2)
                endAngle = 2*π
            default:
                center = CGPoint(x:rect.size.width / 3, y: rect.size.height / 3)
            }
            
            radius = radiusincremental * radius
            path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        }
        
        let spiral = CAShapeLayer()
        spiral.position = center
        spiral.path = path.cgPath
        spiral.lineWidth = linewidth
        spiral.strokeColor = strokecolor.cgColor
        spiral.fillColor = fillcolor.cgColor
        
        if isdashed {
            let dash = dashpattern ?? [5,5]
            spiral.lineDashPattern = dash
        }
        
        return spiral
        
        
    }
    
    private func drawWifi(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, linewidth: CGFloat) -> CAShapeLayer {
        let wifi = CAShapeLayer()
        
        let sectionheight = rect.size.height / 8
        let startangle = 5 * CGFloat.pi / 4
        let endangle = 7 * CGFloat.pi / 4
        let wavcenter = CGPoint(x: rect.origin.x + rect.size.width / 2, y: rect.origin.y + rect.size.height - sectionheight)
        
        let circle = CAShapeLayer()
        circle.fillColor = fillcolor.cgColor
        circle.strokeColor = strokecolor.cgColor
        circle.lineWidth = linewidth
        circle.path = UIBezierPath(ovalIn: CGRect(x: rect.origin.x + rect.size.width / 2 - sectionheight, y: rect.origin.y + rect.size.height - 2 * sectionheight, width: 2 * sectionheight, height: 2 * sectionheight)).cgPath
        wifi.addSublayer(circle)
        
        for i in 0..<3 {
            let radius = (3 + CGFloat(i) * 2) * sectionheight
            let wav = CAShapeLayer()
            wav.fillColor = UIColor.clear.cgColor //fillcolor.cgColor
            wav.strokeColor = strokecolor.cgColor
            wav.lineWidth = sectionheight
            wav.path = UIBezierPath(arcCenter: wavcenter, radius: radius, startAngle: startangle, endAngle: endangle, clockwise: true).cgPath
            wifi.addSublayer(wav)
        }
        
        return wifi
    }

    
}
