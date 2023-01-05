//
//  UIHelpersDrawSofa.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-14.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawSofa: UIHelpers {
    
    enum UISofaType: String {
        case single
        case double
    }
    
    func drawSofa(type: UISofaType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        switch type {
        case .single:
            return drawSingleSofa(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        case .double:
            return drawDoubleSofa(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        }
        
    }
    
    
    private func drawSingleSofa(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofsidewidth: CGFloat = 22
        let sizeofsidecurve: CGFloat = 8
        let sizeoftopheight: CGFloat = 30
        let sizeoflegheight: CGFloat = 10
        let sizeoflegwidth: CGFloat = 7
        let sizeoflegoffset: CGFloat = 17
        
        let x = rect.origin.x
        let y = rect.origin.y
        let w = rect.size.width
        let h = rect.size.height
        
        let sidewidth = w * sizeofsidewidth / 100
        let sidecurve = h * sizeofsidecurve / 100
        let topheight = h * sizeoftopheight / 100
        let legheight = h * sizeoflegheight / 100
        let legwidth = w * sizeoflegwidth / 100
        let legoffset = w * sizeoflegoffset / 100
        
        let sofa = CAShapeLayer()
        
        let path = UIBezierPath()
        let top = CAShapeLayer()
        top.fillColor = strokecolor.inverse().cgColor
        top.strokeColor = strokecolor.cgColor
        top.lineWidth = borderwidth
        top.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x + 2 * sidewidth / 3, y: y + topheight + sidecurve))
        path.addQuadCurve(to: CGPoint(x: x + w - 2 * sidewidth / 3, y: y + topheight + sidecurve), controlPoint: CGPoint(x: x + w / 2, y: y))
        top.path = path.cgPath
        sofa.addSublayer(top)
        
        let legpath = UIBezierPath()
        let leg1 = CAShapeLayer()
        leg1.strokeColor = strokecolor.cgColor
        leg1.lineWidth = legwidth
        leg1.lineCap = kCALineCapRound
        legpath.move(to: CGPoint(x: x + legoffset, y: y + h - legwidth / 2))
        legpath.addLine(to: CGPoint(x: x + legoffset, y: y + h - legheight))
        leg1.path = legpath.cgPath
        sofa.addSublayer(leg1)
        
        let leg2 = CAShapeLayer()
        leg2.strokeColor = strokecolor.cgColor
        leg2.lineWidth = legwidth
        leg2.lineCap = kCALineCapRound
        legpath.move(to: CGPoint(x: x + w - legoffset, y: y + h - legwidth / 2))
        legpath.addLine(to: CGPoint(x: x + w - legoffset, y: y + h - legheight))
        leg2.path = legpath.cgPath
        sofa.addSublayer(leg2)
        
        let matpath = UIBezierPath()
        let mat = CAShapeLayer()
        mat.fillColor = fillcolor.cgColor
        mat.strokeColor = strokecolor.cgColor
        mat.lineWidth = borderwidth
        mat.lineJoin = kCALineJoinRound
        matpath.move(to: CGPoint(x: x, y: y + h - legheight))
        matpath.addLine(to: CGPoint(x: x, y: y + topheight + sidecurve))
        matpath.addQuadCurve(to: CGPoint(x: x + sidewidth, y: y + topheight + sidecurve), controlPoint: CGPoint(x: x + sidewidth / 2, y: y + topheight))
        matpath.addLine(to: CGPoint(x: x + sidewidth, y: y + h - legheight - sidewidth))
        matpath.addLine(to: CGPoint(x: x + w - sidewidth, y: y + h - legheight - sidewidth))
        matpath.addLine(to: CGPoint(x: x + w - sidewidth, y: y + topheight + sidecurve))
        matpath.addQuadCurve(to: CGPoint(x: x + w, y: y + topheight + sidecurve), controlPoint: CGPoint(x: x + w - sidewidth / 2, y: y + topheight))
        matpath.addLine(to: CGPoint(x: x + w, y: y + h - legheight))
        matpath.close()
        mat.path = matpath.cgPath
        sofa.addSublayer(mat)
        
        return sofa
    }
    
    private func drawDoubleSofa(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofheightofwidth: CGFloat = 80
        let sizeofframewidth: CGFloat = 12
        let sizeofframeheight: CGFloat = 70
        let sizeofboardoffset: CGFloat = 35
        let sizeofpadding: CGFloat = 2
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        let height = w * sizeofheightofwidth / 100
        if height > h {
            w = h * 100 / sizeofheightofwidth
            x = x + (rect.size.width - w) / 2
        }
        else {
            y = y + (h - height)
            h = height
        }
        
        let framewidth = w * sizeofframewidth / 100
        let frameheight = h * sizeofframeheight / 100
        let boardoffset = frameheight * sizeofboardoffset / 100
        let padding = w * sizeofpadding / 100
        let padwidth = (w - 2 * framewidth - 3 * padding) / 2
        
        let sofa = CAShapeLayer()
        
        let path = UIBezierPath()
        let leg1 = CAShapeLayer()
        leg1.strokeColor = strokecolor.cgColor
        leg1.lineWidth = framewidth
        leg1.lineCap = kCALineCapSquare
        path.move(to: CGPoint(x: x, y: y + h - 2 * padding))
        path.addLine(to: CGPoint(x: x, y: y + h - frameheight))
        leg1.path = path.cgPath
        sofa.addSublayer(leg1)
        
        let leg2 = CAShapeLayer()
        leg2.strokeColor = strokecolor.cgColor
        leg2.lineWidth = framewidth
        leg2.lineCap = kCALineCapSquare
        path.move(to: CGPoint(x: x + w, y: y + h - 2 * padding))
        path.addLine(to: CGPoint(x: x + w, y: y + h - frameheight))
        leg2.path = path.cgPath
        sofa.addSublayer(leg2)
        
        let board = CAShapeLayer()
        board.strokeColor = strokecolor.cgColor
        board.lineWidth = framewidth
        board.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x + framewidth, y: y + h - boardoffset))
        path.addLine(to: CGPoint(x: x + w - framewidth, y: y + h - boardoffset))
        board.path = path.cgPath
        sofa.addSublayer(board)
        
        let mat1 = CAShapeLayer()
        mat1.fillColor = fillcolor.cgColor
        mat1.strokeColor = strokecolor.cgColor
        mat1.lineWidth = borderwidth
        mat1.lineJoin = kCALineJoinBevel
        mat1.path = UIBezierPath(rect: CGRect(x: x + framewidth, y: y + h - boardoffset - padding - padwidth - framewidth, width: padwidth, height: padwidth)).cgPath
        sofa.addSublayer(mat1)
        
        let mat2 = CAShapeLayer()
        mat2.fillColor = fillcolor.cgColor
        mat2.strokeColor = strokecolor.cgColor
        mat2.lineWidth = borderwidth
        mat2.lineJoin = kCALineJoinBevel
        mat2.path = UIBezierPath(rect: CGRect(x: x + framewidth + padwidth + 3 * padding, y: y + h - boardoffset - padding - padwidth - framewidth, width: padwidth, height: padwidth)).cgPath
        sofa.addSublayer(mat2)

        
        return sofa
        
    }
    
}
