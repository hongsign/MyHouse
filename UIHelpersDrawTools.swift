//
//  UIHelpersDrawTools.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-13.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawTools: UIHelpers {
    
    enum UIToolType: String {
        case wrench
        case screwdriver
    }
    
    func drawTool(type: UIToolType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let x = rect.origin.x
        let y = rect.origin.y
        let w = rect.size.width
        let h = rect.size.height
        
        switch type {
        case .wrench:
            return drawWrench(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        case .screwdriver:
            return drawScrewdriver(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        }
        
    }
    
    private func drawWrench(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        //let sizeofhandlelength: CGFloat = 70
        let sizeofheadlength: CGFloat = 30
        let sizeofwidthofheight: CGFloat = 40
        let sizeofhandlewidth: CGFloat = 35
        let sizeofmouthwidth: CGFloat = 18
        let sizeofmouthlength: CGFloat = sizeofheadlength / 100 * 66
        
        var width: CGFloat = h * sizeofwidthofheight / 100
        var height: CGFloat = h
        var xx: CGFloat = x
        var yy: CGFloat = y
        
        if width > w {
            width = w
            height = width * 100 / sizeofwidthofheight
            yy = y + (h - height) / 2
        }
        else {
            xx = x + (w - width) / 2
        }
        //print("x: " + String(describing: xx) + " y: " + String(describing: yy) + " width: " + String(describing: width) + " hieght: " + String(describing: height))
        //let handlelength = height * sizeofhandlelength / 100
        let headlength = height * sizeofheadlength / 100
        let handlewidth = width * sizeofhandlewidth / 100
        let mouthwidth = width * sizeofmouthwidth / 100
        let mouthlength = height * sizeofmouthlength / 100
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: xx + width / 2 + handlewidth / 2, y: yy + height))
        path.addLine(to: CGPoint(x: xx + width / 2 + handlewidth / 2, y: yy + headlength))
        path.addQuadCurve(to: CGPoint(x: xx + width / 2 + mouthwidth / 2, y: yy), controlPoint: CGPoint(x: xx + width, y: y + headlength / 2))
        path.addLine(to: CGPoint(x: xx + width / 2 + mouthwidth / 2, y: yy + mouthlength))
        path.addLine(to: CGPoint(x: xx + width / 2 - mouthwidth / 2, y: yy + mouthlength))
        path.addLine(to: CGPoint(x: xx + width / 2 - mouthwidth / 2, y: y))
        path.addQuadCurve(to: CGPoint(x: xx + width / 2 - handlewidth / 2, y: yy + headlength), controlPoint: CGPoint(x: x, y: y + headlength / 2))
        path.addLine(to: CGPoint(x: xx + width / 2 - handlewidth / 2, y: y + height))
        path.close()
        
        let wrench = CAShapeLayer()
        wrench.fillColor = fillcolor.cgColor
        wrench.strokeColor = strokecolor.cgColor
        wrench.lineWidth = borderwidth
        wrench.lineJoin = kCALineJoinRound
        wrench.path = path.cgPath
        
        return wrench
        
    }
    
    private func drawScrewdriver(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofhandlelength: CGFloat = 45
        let sizeofpolewidthofhandle: CGFloat = 15
        let sizeofheadwidthofhandle: CGFloat = 40
        let sizeofheadlength: CGFloat = (100 - sizeofhandlelength) / 100 * 20
        let sizeofwidthofheight: CGFloat = 17
        
        var width = h * sizeofwidthofheight / 100
        var height = h
        var xx = x
        var yy = y
        
        if width > w {
            width = w
            height = width * 100 / sizeofwidthofheight
            yy = y + (h - height) / 2
        }
        else {
            xx = x + (w - width) / 2
        }
        
        let handlelength = height * sizeofhandlelength / 100
        let polewidth = width * sizeofpolewidthofhandle / 100
        let headwidth = width * sizeofheadwidthofhandle / 100
        let headlength = height * sizeofheadlength / 100
        
        let screwdriver = CAShapeLayer()
        
        let handle = CAShapeLayer()
        handle.fillColor = fillcolor.cgColor
        handle.strokeColor = strokecolor.cgColor
        handle.lineWidth = borderwidth
        handle.path = UIBezierPath(ovalIn: CGRect(x: xx, y: yy + height - handlelength, width: width, height: handlelength)).cgPath
        screwdriver.addSublayer(handle)
        
        let polepath = UIBezierPath()
        let pole = CAShapeLayer()
        pole.fillColor = strokecolor.cgColor
        pole.strokeColor = strokecolor.cgColor
        pole.lineWidth = polewidth
        pole.lineCap = kCALineCapRound
        polepath.move(to: CGPoint(x: xx + width / 2, y: yy + height - handlelength))
        polepath.addLine(to: CGPoint(x: xx + width / 2, y: yy + headlength))
        pole.path = polepath.cgPath
        screwdriver.addSublayer(pole)
        
        let headpath = UIBezierPath()
        let head = CAShapeLayer()
        head.fillColor = strokecolor.cgColor
        head.strokeColor = strokecolor.cgColor
        head.lineJoin = kCALineJoinRound
        headpath.move(to: CGPoint(x: xx + width / 2 - headwidth / 2, y: yy + headlength))
        headpath.addLine(to: CGPoint(x: xx + width / 2 + headwidth / 2, y: yy + headlength))
        headpath.addLine(to: CGPoint(x: xx + width / 2, y: yy))
        head.path = headpath.cgPath
        screwdriver.addSublayer(head)
        
        return screwdriver
    }
    
}
