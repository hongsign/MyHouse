//
//  UIHelpersDrawLight.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-14.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawLight: UIHelpers {
    
    enum UIHouseLightType: String {
        case floor
        case table
        case hang
        case wall
    }
    
    enum UIWallLightDirection: String {
        case left
        case right
    }
    
    func drawLight(type: UIHouseLightType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor? = .clear, borderwidth: CGFloat, direction: UIWallLightDirection? = .left) -> CAShapeLayer {
        
        switch type {
        case .floor:
            return drawFloorLight(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        case .table:
            return CAShapeLayer()
        case .hang:
            return drawHangLight(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        case .wall:
            let dir = direction ?? .left
            let bgclr = bgcolor ?? .clear
            return drawWallLight(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, bgcolor: bgclr, borderwidth: borderwidth, direction: dir)
        }
        
    }
    
    private func drawFloorLight(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofwidthofheight: CGFloat = 25
        let sizeoflightheight: CGFloat = 25
        let sizeoftopwidth: CGFloat = 50
        let sizeofbottomwidth: CGFloat = 70
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        let width = h * sizeofwidthofheight / 100
        if width > w {
            h = w * 100 / sizeofwidthofheight
            y = y + (rect.size.height - h)
        }
        else {
            x = x + (w - width) / 2
            w = width
        }
        
        let lightheight = h * sizeoflightheight / 100
        let topwidth = w * sizeoftopwidth / 100
        let bottomwidth = w * sizeofbottomwidth / 100
        
        let bottompath = UIBezierPath()
        bottompath.lineWidth = borderwidth
        bottompath.lineCapStyle = .round
        bottompath.move(to: CGPoint(x: x + (w - bottomwidth) / 2, y: y + h))
        bottompath.addLine(to: CGPoint(x: x + (w - bottomwidth) / 2 + bottomwidth, y: y + h))
        let legpath = UIBezierPath()
        legpath.lineWidth = borderwidth
        legpath.lineCapStyle = .round
        legpath.move(to: CGPoint(x: x + w / 2, y: y + lightheight))
        legpath.addLine(to: CGPoint(x: x + w / 2, y: y + h))
        
        legpath.append(bottompath)
        
        let leg = CAShapeLayer()
        leg.fillColor = UIColor.clear.cgColor
        leg.strokeColor = strokecolor.cgColor
        leg.path = legpath.cgPath
        
        let toppath = UIBezierPath()
        let top = CAShapeLayer()
        top.fillColor = fillcolor.cgColor
        top.strokeColor = strokecolor.cgColor
        top.lineWidth = borderwidth
        top.lineJoin = kCALineJoinRound
        toppath.move(to: CGPoint(x: x + w / 2 - topwidth / 2, y: y))
        toppath.addLine(to: CGPoint(x: x + w / 2 + topwidth / 2, y: y))
        toppath.addLine(to: CGPoint(x: x + w, y: y + lightheight))
        toppath.addLine(to: CGPoint(x: x, y: y + lightheight))
        toppath.close()
        top.path = toppath.cgPath
        
        let light = CAShapeLayer()
        light.addSublayer(leg)
        light.addSublayer(top)
        return light
        
    }
    
    private func drawHangLight(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        let sizeofropeheight: CGFloat = 60
        let sizeoflightheight: CGFloat = 40
        var lightheight: CGFloat = h * sizeoflightheight / 100
        x = 2 * lightheight > w ? x : x + (w - 2 * lightheight) / 2
        y = 2 * lightheight > w ? y + (lightheight - w / 2) : y
        w = 2 * lightheight > w ? w : 2 * lightheight
        h = 2 * lightheight > w ? h - (lightheight - w / 2) : h
        lightheight = 2 * lightheight > w ? w / 2 : lightheight
        let ropeheight: CGFloat = h * sizeofropeheight / 100
        
        
        let light = CAShapeLayer()
        let path = UIBezierPath()
        let rope = CAShapeLayer()
        rope.fillColor = fillcolor.cgColor
        rope.strokeColor = strokecolor.cgColor
        rope.lineWidth = 3 * borderwidth
        rope.lineCap = kCALineCapButt
        path.move(to: CGPoint(x: x + w / 2, y: y))
        path.addLine(to: CGPoint(x: x + w / 2, y: y + ropeheight))
        rope.path = path.cgPath
        light.addSublayer(rope)
        
        let l = CAShapeLayer()
        l.fillColor = fillcolor.cgColor
        l.strokeColor = strokecolor.cgColor
        l.lineWidth = borderwidth
        l.path = UIBezierPath(arcCenter: CGPoint(x: x + w / 2, y: y + h), radius: lightheight, startAngle: CGFloat.pi, endAngle: 0, clockwise: true).cgPath
        light.addSublayer(l)
        
        return light
    }
    
    private func drawWallLight(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat, direction: UIWallLightDirection) -> CAShapeLayer {
        
        let sizeoflightwidth: CGFloat = 70
        let sizeoflightheight: CGFloat = 50
        let sizeofjoint: CGFloat = 25
        let sizeofcurve: CGFloat = 20
        let sizeoflinewidth: CGFloat = 5
        let sizeoflighttopofwidth: CGFloat = 50
        
        let r = makeSquare(rect: rect)
        
        let lightwidth = r.w * sizeoflightwidth / 100
        let lightheight = r.h * sizeoflightheight / 100
        let jointheight = r.h * sizeofjoint / 100
        let curveheight = r.h * sizeofcurve / 100
        let linewidth = r.w * sizeoflinewidth / 100
        let topwidth = lightwidth * sizeoflighttopofwidth / 100
        
        let light = CAShapeLayer()
        
        let top = CAShapeLayer()
        let toppath = UIBezierPath()
        var p1: CGPoint = .zero
        var p2: CGPoint = .zero
        var p3: CGPoint = .zero
        var p4: CGPoint = .zero
        switch direction {
        case .left:
            p1.x = r.x; p1.y = r.y + lightheight
            p2.x = r.x + lightwidth; p2.y = r.y + lightheight
            p3.x = r.x + (lightwidth - topwidth) / 2 + topwidth; p3.y = r.y
            p4.x = r.x + (lightwidth - topwidth) / 2; p4.y = r.y
        case .right:
            p1.x = r.x + r.w - lightwidth; p1.y = r.y + lightheight
            p2.x = r.x + r.w; p2.y = r.y + lightheight
            p3.x = r.x + r.w - (lightwidth - topwidth) / 2; p3.y = r.y
            p4.x = r.x + r.w - (lightwidth - topwidth) / 2 - topwidth; p4.y = r.y
        }
        toppath.move(to: p1); toppath.addLine(to: p2); toppath.addLine(to: p3); toppath.addLine(to: p4)
        toppath.close()
        top.fillColor = fillcolor.cgColor
        top.strokeColor = strokecolor.cgColor
        top.lineWidth = borderwidth
        top.lineJoin = kCALineJoinRound
        top.path = toppath.cgPath
        light.addSublayer(top)
        
        let bottom = CAShapeLayer()
        let path = UIBezierPath()
        let path1 = UIBezierPath()
        switch direction {
        case .left:
            p1.x = r.x + lightwidth / 2; p1.y = r.y + lightheight
            p2.x = r.x + lightwidth / 2; p2.y = r.y + r.h - jointheight / 2 - curveheight
            p3.x = r.x + r.w; p3.y = r.y + r.h - jointheight
            p4.x = r.x + lightwidth / 2 + lightwidth / 4; p4.y = r.y + r.h - jointheight / 2 - 3 * curveheight / 4
        case .right:
            p1.x = r.x + r.w - lightwidth / 2; p1.y = r.y + lightheight
            p2.x = r.x + r.w - lightwidth / 2; p2.y = r.y + r.h - jointheight / 2 - curveheight
            p3.x = r.x; p3.y = r.y + r.h - jointheight
            p4.x = r.x + r.w - lightwidth / 2 - lightwidth / 4; p4.y = r.y + r.h - jointheight / 2 - 3 * curveheight / 4
        }
        path1.move(to: p1); path1.addLine(to: p2); path1.addQuadCurve(to: p3, controlPoint: p4)
        let path2 = UIBezierPath()
        switch direction {
        case .left:
            p1.x = r.x + r.w; p1.y = r.y + r.h - jointheight
            p2.x = r.x + r.w; p2.y = r.y + r.h
        case .right:
            p1.x = r.x; p1.y = r.y + r.h - jointheight
            p2.x = r.x; p2.y = r.y + r.h
        }
        path2.move(to: p1); path2.addLine(to: p2)
        path.append(path1)
        path.append(path2)
        bottom.fillColor = bgcolor.cgColor
        bottom.strokeColor = strokecolor.cgColor
        bottom.lineWidth = linewidth
        bottom.lineJoin = kCALineJoinRound
        bottom.lineCap = kCALineCapRound
        bottom.path = path.cgPath
        
        light.addSublayer(bottom)
        
        return light
    }

}
