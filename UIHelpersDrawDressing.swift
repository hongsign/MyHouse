//
//  UIHelpersDrawDressing.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-15.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawDressing: UIHelpers {
    
    enum UIDressingType: String {
        case hanger
    }
    
    func drawDressing(type: UIDressingType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        switch type {
        case .hanger:
            return drawHanger(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        }
    }
    
    private func drawHanger(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofhangertop: CGFloat = 35
        let sizeofhangercircleofhangertop: CGFloat = 60
        let sizeofhangerbody: CGFloat = 35
        let sizeofhangingheight: CGFloat = 40
        let sizeofhangingwidth: CGFloat = 50
        let sizeofhangercorner: CGFloat = 7
        let sizeofhaningcorner: CGFloat = 5
        
        let x = rect.origin.x
        let y = rect.origin.y
        let w = rect.size.width
        let h = rect.size.height
        
        let hangertop = h * sizeofhangertop / 100
        let hangerbody = h * sizeofhangerbody / 100
        let hangingheight = h * sizeofhangingheight / 100
        let hangingwidth = w * sizeofhangingwidth / 100
        let hangercorner = w * sizeofhangercorner / 100
        let hangercircle = hangertop * sizeofhangercircleofhangertop / 100
        let hangingcorner = hangingwidth * sizeofhaningcorner / 100
        
        let hanger = CAShapeLayer()
        
        let hangerpath = UIBezierPath()
        let hangerciclepath = UIBezierPath()
        hangerciclepath.lineWidth = borderwidth
        hangerciclepath.lineCapStyle = .round
        hangerciclepath.addArc(withCenter: CGPoint(x: x + w / 2, y: y + hangercircle / 2), radius: hangercircle / 2, startAngle: CGFloat.pi / 2, endAngle: 11 * CGFloat.pi / 6, clockwise: true)
        let hangerbodypath = UIBezierPath()
        hangerbodypath.lineWidth = borderwidth
        hangerbodypath.lineJoinStyle = .round
        hangerbodypath.move(to: CGPoint(x: x + w / 2, y: y + hangercircle))
        hangerbodypath.addLine(to: CGPoint(x: x + w / 2, y: y + hangertop))
        hangerbodypath.addLine(to: CGPoint(x: x + hangercorner, y: y + hangertop + hangerbody - 2 * hangercorner))
        hangerbodypath.addQuadCurve(to: CGPoint(x: x + hangercorner, y: y + hangertop + hangerbody), controlPoint: CGPoint(x: x, y: y + hangertop + hangerbody - hangercorner))
        hangerbodypath.addLine(to: CGPoint(x: x + w - hangercorner, y: y + hangertop + hangerbody))
        hangerbodypath.addQuadCurve(to: CGPoint(x: x + w - hangercorner, y: y + hangertop + hangerbody - 2 * hangercorner), controlPoint: CGPoint(x: x + w, y: y + hangertop + hangerbody - hangercorner))
        hangerbodypath.addLine(to: CGPoint(x: x + w / 2, y: y + hangertop))
        hangerbodypath.close()
        
        hangerpath.append(hangerciclepath)
        hangerpath.append(hangerbodypath)
        
        let thehanger = CAShapeLayer()
        thehanger.fillColor = UIColor.clear.cgColor
        thehanger.strokeColor = strokecolor.cgColor
        thehanger.path = hangerpath.cgPath
        hanger.addSublayer(thehanger)
        
        let hanging = CAShapeLayer()
        hanging.fillColor = fillcolor.cgColor
        hanging.strokeColor = strokecolor.cgColor
        hanging.lineWidth = borderwidth
        hanging.path = UIBezierPath(roundedRect: CGRect(x: x + (w - hangingwidth) / 2, y: y + h - hangingheight, width: hangingwidth, height: hangingheight), cornerRadius: hangingcorner).cgPath
        hanger.addSublayer(hanging)
        
        return hanger
    }
    
}
