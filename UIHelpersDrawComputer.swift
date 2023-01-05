//
//  UIHelpersDrawComputer.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-13.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawComputer: UIHelpers {
    
    enum UIComputerType: String {
        case laptop
        case desktop
        case tablet
    }
    
    func drawComputer(type: UIComputerType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        //draw in a square
        if w > h {
            x = x + (w - h) / 2
            w = h
        }
        else {
            y = y + (h - w) / 2
            h = w
        }
        
        switch type {
        case .laptop:
            return drawLaptop(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        case .desktop:
            return drawDesktop(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        case .tablet:
            return drawTablet(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        }
        
    }
    
    private func drawLaptop(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofscreenheightofwidth: CGFloat = 75
        let sizeofkeyboardheight: CGFloat = 20
        let sizeofpadding: CGFloat = 2
        
        let padding = w * sizeofpadding / 100
        let keyboardheight = h * sizeofkeyboardheight / 100
        let screenwidth = w - 2 * padding
        let screenheight = screenwidth * sizeofscreenheightofwidth / 100
        
        let laptop = CAShapeLayer()
        
        let screen = CAShapeLayer()
        screen.fillColor = fillcolor.cgColor
        screen.strokeColor = strokecolor.cgColor
        screen.lineWidth = borderwidth
        screen.lineJoin = kCALineJoinRound
        screen.path = UIBezierPath(rect: CGRect(x: x + padding, y: y + padding, width: screenwidth, height: screenheight)).cgPath
        laptop.addSublayer(screen)
        
        let path = UIBezierPath()
        let keyboard = CAShapeLayer()
        keyboard.fillColor = strokecolor.cgColor
        keyboard.strokeColor = strokecolor.cgColor
        keyboard.lineWidth = keyboardheight
        keyboard.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x, y: y + padding + screenheight))
        path.addLine(to: CGPoint(x: x + w, y: y + padding + screenheight))
        keyboard.path = path.cgPath
        laptop.addSublayer(keyboard)
        
        return laptop
        
    }
    
    private func drawDesktop(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofstandheight: CGFloat = 20
        let sizeofstandwidth: CGFloat = 20
        let sizeofpadding: CGFloat = 2
        let sizeofscreenheight: CGFloat = 75
        
        let padding = w * sizeofpadding / 100
        let standwidth = w * sizeofstandwidth / 100
        let standheight = h * sizeofstandheight / 100
        let screenwidth = w - 2 * padding
        let screenheight = h * sizeofscreenheight / 100
        
        let desktop = CAShapeLayer()
        
        let screen = CAShapeLayer()
        screen.fillColor = fillcolor.cgColor
        screen.strokeColor = strokecolor.cgColor
        screen.lineJoin = kCALineJoinRound
        screen.lineWidth = borderwidth
        screen.path = UIBezierPath(rect: CGRect(x: x + padding, y: y + padding, width: screenwidth, height: screenheight)).cgPath
        desktop.addSublayer(screen)
        
        let path = UIBezierPath()
        
        let leg1 = CAShapeLayer()
        leg1.fillColor = strokecolor.cgColor
        leg1.strokeColor = strokecolor.cgColor
        leg1.lineWidth = borderwidth
        leg1.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x + (w - standwidth) / 2, y: y + h - standheight))
        path.addLine(to: CGPoint(x: x + (w - standwidth) / 2, y: y + h))
        leg1.path = path.cgPath
        desktop.addSublayer(leg1)
        
        let leg2 = CAShapeLayer()
        leg2.fillColor = strokecolor.cgColor
        leg2.strokeColor = strokecolor.cgColor
        leg2.lineWidth = borderwidth
        leg2.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x + (w - standwidth) / 2 + standwidth, y: y + h - standheight))
        path.addLine(to: CGPoint(x: x + (w - standwidth) / 2 + standwidth, y: y + h))
        leg2.path = path.cgPath
        desktop.addSublayer(leg2)
        
        return desktop
        
    }
    
    private func drawTablet(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        
        let sizeofwidthofheight: CGFloat = 70
        let sizeofpadding: CGFloat = 2
        
        let padding = w * sizeofpadding / 100
        let screenheight = h - 2 * padding - 2 * borderwidth
        let screenwidth = screenheight * sizeofwidthofheight / 100
        let xx = x + (h - screenwidth) / 2
        
        let bottomborderwidth = 2 * borderwidth
        let buttonradius = borderwidth / 2
        let buttonx = xx + screenwidth / 2 - buttonradius
        let buttony = y + h - padding - bottomborderwidth - 2 * borderwidth - padding + buttonradius
        
        let tablet = CAShapeLayer()
        
        let frame = CAShapeLayer()
        frame.fillColor = fillcolor.cgColor
        frame.strokeColor = strokecolor.cgColor
        frame.lineWidth = borderwidth
        frame.lineJoin = kCALineJoinRound
        frame.path = UIBezierPath(rect: CGRect(x: xx, y: y + padding, width: screenwidth, height: screenheight)).cgPath
        tablet.addSublayer(frame)
        
        let path = UIBezierPath()
        let bottombar = CAShapeLayer()
        bottombar.fillColor = strokecolor.cgColor
        bottombar.strokeColor = strokecolor.cgColor
        bottombar.lineWidth = bottomborderwidth
        bottombar.lineCap = kCALineCapSquare
        path.move(to: CGPoint(x: xx + padding + borderwidth, y: y + h - padding - bottomborderwidth - borderwidth - padding))
        path.addLine(to: CGPoint(x: xx + screenwidth - padding - borderwidth, y: y + h - bottomborderwidth - borderwidth - padding))
        bottombar.path = path.cgPath
        tablet.addSublayer(bottombar)
        
        let inverse: UIColor = strokecolor
        
        let button = CAShapeLayer()
        button.fillColor = inverse.inverse().cgColor
        button.strokeColor = inverse.inverse().cgColor
        button.lineWidth = 1
        button.path = UIBezierPath(ovalIn: CGRect(x: buttonx, y: buttony, width: 2 * buttonradius, height: 2 * buttonradius)).cgPath
        tablet.addSublayer(button)
        
        return tablet
        
    }
    
}
