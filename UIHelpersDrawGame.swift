//
//  UIHelpersDrawGame.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-13.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawGame: UIHelpers {
    
    enum UIGameType: String {
        case chess
        case dice
        case billiard
    }
    
    func drawGame(type: UIGameType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat, number: Int? = 0) -> CAShapeLayer {
        
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
        case .chess:
            return drawChess(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        case .dice:
            return drawDice(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth, dicenumber: number!)
        case .billiard:
            return drawBilliard(x: x, y: y, w: w, h: h, billiardnumber: number!)
        }

    }
    
    private func drawChess(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeoftopheight: CGFloat = 45
        //let sizeofbottomheight: CGFloat = 55
        let sizeofwidthofheight: CGFloat = 55
        
        let width = h * sizeofwidthofheight / 100
        let topheight = h * sizeoftopheight / 100
        //let bottomheight = h * sizeofbottomheight / 100
        
        let chess = CAShapeLayer()
        
        let path = UIBezierPath()
        let bottom = CAShapeLayer()
        bottom.fillColor = fillcolor.cgColor
        bottom.strokeColor = strokecolor.cgColor
        bottom.lineWidth = borderwidth
        bottom.lineJoin = kCALineJoinRound
        path.move(to: CGPoint(x: x + (w - width) / 2, y: y + h))
        path.addLine(to: CGPoint(x: x + w / 2, y: y + topheight))
        path.addLine(to: CGPoint(x: x + (w - width) / 2 + width, y: y + h))
        path.close()
        bottom.path = path.cgPath
        chess.addSublayer(bottom)
        
        let top = CAShapeLayer()
        top.fillColor = fillcolor.cgColor
        top.strokeColor = strokecolor.cgColor
        top.lineWidth = borderwidth
        top.path = UIBezierPath(ovalIn: CGRect(x: x + (w - topheight) / 2, y : y + topheight / 2, width: topheight, height: topheight)).cgPath
        chess.addSublayer(top)
        
        return chess
    }
    
    private func drawDice(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat, dicenumber: Int) -> CAShapeLayer {
        let dice = CAShapeLayer()
        var number: Int = 0
        switch dicenumber {
        case 1:
            number = dicenumber
        default:
            number = 1
        }
        
        let frame = CAShapeLayer()
        frame.fillColor = fillcolor.cgColor
        frame.strokeColor = strokecolor.cgColor
        frame.lineWidth = borderwidth
        frame.lineJoin = kCALineJoinRound
        frame.path = UIBezierPath(rect: CGRect(x: x + borderwidth, y: y + borderwidth, width: w - 2 * borderwidth, height: h - 2 * borderwidth)).cgPath
        dice.addSublayer(frame)
        
        let dot = CAShapeLayer()
        dot.fillColor = strokecolor.cgColor
        dot.strokeColor = strokecolor.cgColor
        if number == 1 {
            dot.path = UIBezierPath(ovalIn: CGRect(x: x + w / 4, y: y + h / 4, width: w / 2, height: w / 2)).cgPath
        }
        dice.addSublayer(dot)
        
        return dice
    }
    
    private func drawBilliard(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, billiardnumber: Int) -> CAShapeLayer {
        
        let sizeofinnercircle: CGFloat = 50
        let sizeofinneroffsetx: CGFloat = 20
        let sizeofinneroffsety: CGFloat = 15
        let sizeoftextsizeofinnerrectwidth: CGFloat = 15
        
        let innerradius = (w * sizeofinnercircle / 100) / 2
        let inneroffsetx = w * sizeofinneroffsetx / 100
        let inneroffsety = h * sizeofinneroffsety / 100
        
        let innerrectlength = 2 * (innerradius * sin(CGFloat.pi / 4))
        let innercenter = CGPoint(x: x + (w - innerradius * 2) / 2 + inneroffsetx + innerradius, y: y + (h - innerradius * 2) / 2 + inneroffsety + innerradius)
        
        //if billiardnumber > 9 {
        //    let innerrect = CGRect(x: innercenter.x - innerrectlength / 2, y: innercenter.y - innerrectlength / 2, width: innerrectlength, height: innerrectlength)
        //}
        //else {
            let innerrect = CGRect(x: innercenter.x - innerrectlength / 3, y: innercenter.y - innerrectlength / 3, width: innerrectlength, height: innerrectlength)
        //}
        let textsize = innerrect.size.width * sizeoftextsizeofinnerrectwidth / 100
        
        let fillcolor1: UIColor = .white
        var fillcolor: UIColor = .clear
        var number: Int = billiardnumber
        let textcolor: UIColor = .black
        
        switch billiardnumber {
        case 1:
            fillcolor = .yellow

        case 2:
            fillcolor = .blue
        case 3:
            fillcolor = .red
        case 4:
            fillcolor = .purple
        case 5:
            fillcolor = .orange
        case 6:
            fillcolor = .green
        case 7:
            fillcolor = .brown
        case 8:
            fillcolor = .black
        default:
            number = 8
            fillcolor = .black
        }
        
        let billiard = CAShapeLayer()
        
        let out = CAShapeLayer()
        out.fillColor = fillcolor.cgColor
        out.strokeColor = fillcolor.cgColor
        out.path = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: w, height: h)).cgPath
        billiard.addSublayer(out)
        let inner = CAShapeLayer()
        inner.fillColor = fillcolor1.cgColor
        inner.strokeColor = fillcolor1.cgColor
        inner.path = UIBezierPath(ovalIn: CGRect(x: x + (w - innerradius * 2) / 2 + inneroffsetx, y: y + (h - innerradius * 2) / 2 + inneroffsety, width: innerradius * 2, height: innerradius * 2)).cgPath
        billiard.addSublayer(inner)
        
        let numberlayer = CAShapeLayer()
        numberlayer.fillColor = UIColor.clear.cgColor
        numberlayer.strokeColor = textcolor.cgColor
        numberlayer.lineWidth = textsize
        numberlayer.lineCap = kCALineCapRound
        numberlayer.lineJoin = kCALineJoinRound
        numberlayer.path = UIHelpersDrawNumber.drawNumber(rect: innerrect, number: number, linewidth: textsize).cgPath
        billiard.addSublayer(numberlayer)
        
        return billiard
        
    }
    
}
