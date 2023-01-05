//
//  UISunroom.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-15.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UISunroom: UIRoom {
    
    private let sizeofroofheight: CGFloat = 30
    private let sizeofshadowarea: CGFloat = 30
    private let sizeofshadowheightpadding: CGFloat = 25
    private let sizeofshadowwidthpadding: CGFloat = 30
    private let sizeofshadowwidth: CGFloat = 3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .sunroom
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .sunroom
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        layers.removeAll()
        
        /*---------------------------------------
         draw in a square area in the middle of screen
         -----------------------------------------*/
        if drawrect.size.width > drawrect.size.height {
            drawrect.origin.x = drawrect.origin.x + (drawrect.size.width - drawrect.size.height) / 2
            drawrect.size.width = drawrect.size.height
        }
        else {
            drawrect.origin.y = drawrect.origin.y + (drawrect.size.height - drawrect.size.width) / 2
            drawrect.size.height = drawrect.size.width
        }
        
        let x = drawrect.origin.x
        let y = drawrect.origin.y
        let w = drawrect.size.width
        let h = drawrect.size.height
        
        let roofheight = h * sizeofroofheight / 100
        let shadowareaheight = h * sizeofshadowarea / 100
        let sectionwidth = w / 3
        let shadowheightpadding = shadowareaheight * sizeofshadowheightpadding / 100
        let shadowwidthpadding = sectionwidth * sizeofshadowwidthpadding / 100
        let shadowwidth = w * sizeofshadowwidth / 100
        
        let roof = CAShapeLayer()
        let roofpath = UIBezierPath()
        let line1 = UIBezierPath()
        line1.lineWidth = borderwidth
        line1.lineCapStyle = .round
        line1.move(to: CGPoint(x: x + w / 2, y: y))
        line1.addLine(to: CGPoint(x: x, y: y + roofheight))
        let line2 = UIBezierPath()
        line2.lineWidth = borderwidth
        line2.lineCapStyle = .round
        line2.move(to: CGPoint(x: x + w / 2, y: y))
        line2.addLine(to: CGPoint(x: x + sectionwidth, y: y + roofheight))
        let line3 = UIBezierPath()
        line3.lineWidth = borderwidth
        line3.lineCapStyle = .round
        line3.move(to: CGPoint(x: x + w / 2, y: y))
        line3.addLine(to: CGPoint(x: x + 2 * sectionwidth, y: y + roofheight))
        let line4 = UIBezierPath()
        line4.lineWidth = borderwidth
        line4.lineCapStyle = .round
        line4.move(to: CGPoint(x: x + w / 2, y: y))
        line4.addLine(to: CGPoint(x: x + 3 * sectionwidth, y: y + roofheight))
        roofpath.append(line1)
        roofpath.append(line2)
        roofpath.append(line3)
        roofpath.append(line4)
        roof.fillColor = UIColor.clear.cgColor
        roof.strokeColor = bordercolor.cgColor
        roof.path = roofpath.cgPath
        layers.append(roof)
        
        let body = CAShapeLayer()
        let bodypath = UIBezierPath()
        for i in 0..<3 {
            let n = CGFloat(i)
            let section = UIBezierPath(rect: CGRect(x: x + n * sectionwidth, y: y + roofheight, width: sectionwidth, height: h - roofheight))
            bodypath.append(section)
        }
        body.fillColor = UIColor.clear.cgColor
        body.strokeColor = bordercolor.cgColor
        body.lineWidth = borderwidth
        body.lineCap = kCALineCapRound
        body.path = bodypath.cgPath
        layers.append(body)
        
        let shadow = CAShapeLayer()
        let shadowpath = UIBezierPath()
        let shadow1 = UIBezierPath()
        shadow1.move(to: CGPoint(x: x + sectionwidth - shadowwidthpadding, y: y + h - shadowareaheight + shadowheightpadding))
        shadow1.addLine(to: CGPoint(x: x + shadowwidthpadding, y: y + h - shadowheightpadding))
        let shadow2 = UIBezierPath()
        shadow2.move(to: CGPoint(x: x + sectionwidth - shadowwidthpadding - shadowwidth, y: y + h - shadowareaheight + shadowheightpadding))
        shadow2.addLine(to: CGPoint(x: x + shadowwidthpadding - shadowwidth, y: y + h - shadowheightpadding))
        let shadow3 = UIBezierPath()
        shadow3.move(to: CGPoint(x: x + 2 * sectionwidth - shadowwidthpadding, y: y + roofheight + shadowheightpadding))
        shadow3.addLine(to: CGPoint(x: x + sectionwidth + shadowwidthpadding + shadowwidth, y: y + roofheight + shadowareaheight - shadowheightpadding))
        let shadow4 = UIBezierPath()
        shadow4.move(to: CGPoint(x: x + 2 * sectionwidth - shadowwidthpadding - shadowwidth, y: y + roofheight + shadowheightpadding))
        shadow4.addLine(to: CGPoint(x: x + sectionwidth + shadowwidthpadding, y: y + roofheight + shadowareaheight - shadowheightpadding))
        shadowpath.append(shadow1)
        shadowpath.append(shadow2)
        shadowpath.append(shadow3)
        shadowpath.append(shadow4)
        shadow.fillColor = UIColor.clear.cgColor
        shadow.strokeColor = fillcolor.cgColor
        shadow.lineWidth = borderwidth
        shadow.lineCap = kCALineCapRound
        shadow.path = shadowpath.cgPath
        layers.append(shadow)
        
    }

    
}
