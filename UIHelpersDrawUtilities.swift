//
//  UIHelpersDrawUtilities.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-14.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawUtilities: UIHelpers {
    
    enum UIUtilityType: String {
        case watertank
        case furnace
        case washer
    }
    
    func drawUtility(type: UIUtilityType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let x = rect.origin.x
        let y = rect.origin.y
        let w = rect.size.width
        let h = rect.size.height
        
        switch type {
        case .watertank:
            return drawWatertank(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        case .furnace:
            return CAShapeLayer()
        case .washer:
            return CAShapeLayer()
        }
        
    }
    
    private func drawWatertank(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeoftopheight: CGFloat = 25
        let sizeofwidthofheight: CGFloat = 40
        let sizeoftopbordercurve: CGFloat = 8
        let sizeofbottombordercurve: CGFloat = 12
        let sizeofpanel: CGFloat = 28
        let sizeofpaneloffset: CGFloat = 35
        let sizeoftubewidth: CGFloat = 10
        
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
        
        let topheight = height * sizeoftopheight / 100
        let tankheight = height * (100 - sizeoftopheight) / 100
        let topcurve = tankheight * sizeoftopbordercurve / 100
        let bottomcurve = tankheight * sizeofbottombordercurve / 100
        let panelradius = (width * sizeofpanel / 100) / 2
        let panelcenter = CGPoint(x: xx + width / 2, y: yy + topheight + tankheight * sizeofpaneloffset / 100)
        let tubewidth = width * sizeoftubewidth / 100
        
        let watertank = CAShapeLayer()
        
        let path = UIBezierPath()
        let tube1 = CAShapeLayer()
        tube1.fillColor = strokecolor.inverse().cgColor
        tube1.strokeColor = strokecolor.cgColor
        tube1.lineCap = kCALineCapRound
        tube1.lineWidth = tubewidth
        path.move(to: CGPoint(x: xx + width / 8, y: yy))
        path.addLine(to: CGPoint(x: xx + width / 3, y: yy + topheight / 2))
        path.addLine(to: CGPoint(x: xx + width / 3, y: yy + topheight))
        tube1.path = path.cgPath
        watertank.addSublayer(tube1)
        
        let tube2 = CAShapeLayer()
        tube2.fillColor = strokecolor.inverse().cgColor
        tube2.strokeColor = strokecolor.cgColor
        tube2.lineCap = kCALineCapRound
        tube2.lineWidth = tubewidth
        path.move(to: CGPoint(x: xx + 7 * width / 8, y: yy + topheight / 2))
        path.addLine(to: CGPoint(x: xx + 2 * width / 3, y: yy + topheight / 2))
        path.addLine(to: CGPoint(x: xx + 2 * width / 3, y: yy + topheight))
        tube2.path = path.cgPath
        watertank.addSublayer(tube2)
        
        let tankpath = UIBezierPath()
        let tank = CAShapeLayer()
        tank.fillColor = fillcolor.cgColor
        tank.strokeColor = strokecolor.cgColor
        tank.lineWidth = borderwidth
        tank.lineJoin = kCALineJoinRound
        tankpath.move(to: CGPoint(x: xx, y: yy + height - bottomcurve))
        tankpath.addQuadCurve(to: CGPoint(x: xx + width, y: yy + height - bottomcurve), controlPoint: CGPoint(x: xx + width / 2, y: yy + height))
        tankpath.addLine(to: CGPoint(x: xx + width, y: yy + topheight + topcurve))
        tankpath.addQuadCurve(to: CGPoint(x: xx, y: yy + topheight + topcurve), controlPoint: CGPoint(x: xx + width / 2, y: yy + topheight))
        tankpath.addLine(to: CGPoint(x: xx, y: yy + height - bottomcurve))
        tankpath.close()
        tank.path = tankpath.cgPath
        watertank.addSublayer(tank)
        
        let panel = CAShapeLayer()
        panel.fillColor = strokecolor.inverse().cgColor
        panel.strokeColor = strokecolor.cgColor
        panel.path = UIBezierPath(ovalIn: CGRect(x: panelcenter.x - panelradius, y: panelcenter.y - panelradius, width: 2 * panelradius, height: 2 * panelradius)).cgPath
        watertank.addSublayer(panel)
        
        let pinpath = UIBezierPath()
        let pin = CAShapeLayer()
        pin.fillColor = strokecolor.cgColor
        pin.strokeColor = strokecolor.cgColor
        pin.lineWidth = tubewidth / 2
        pin.lineCap = kCALineCapButt
        pinpath.move(to: panelcenter)
        pinpath.addLine(to: CGPoint(x: panelcenter.x - panelradius / 2, y: panelcenter.y - panelradius / 2))
        pin.path = pinpath.cgPath
        watertank.addSublayer(pin)
        
        return watertank
        
    }
    
}
