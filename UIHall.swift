//
//  UIHall.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-12.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHall: UIRoom {
    
    private let sizeofrootheight: CGFloat = 30
    private let sizeofframe: CGFloat = 50
    private let sizeofpolewidth: CGFloat = 6
    
    var _numberofpoles: Int = 4
    var numberofpoles: Int {
        get { return _numberofpoles }
        set(newvalue) {
            if newvalue != _numberofpoles {
                _numberofpoles = newvalue
                reDisplay()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .hall
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .hall
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        layers.removeAll()
        
        /*---------------------------------------
         simplify (x,y,width,height), and draw in square
         -----------------------------------------*/
        var w = drawrect.size.width
        var h = drawrect.size.height
        var x = drawrect.origin.x
        var y = drawrect.origin.y
        x = w > h ? x + (drawrect.size.width - h) / 2 : x
        y = w > h ? y : y + (drawrect.size.height - w) / 2
        w = w > h ? h : w
        h = w
        
        let roofheight = h * sizeofrootheight / 100
        let frameheight = h * sizeofframe / 100
        let polewidth = h * sizeofpolewidth / 100
        let polepadding = (w - CGFloat(numberofpoles) * polewidth) / (CGFloat(numberofpoles) + 1)
        
        let path = UIBezierPath()
        let roof = CAShapeLayer()
        roof.fillColor = fillcolor.cgColor
        roof.strokeColor = bordercolor.cgColor
        roof.lineWidth = borderwidth
        roof.lineJoin = kCALineJoinRound
        roof.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x + w / 2, y: y))
        path.addLine(to: CGPoint(x: x, y: y + roofheight))
        path.addLine(to: CGPoint(x: x + w, y: y + roofheight))
        path.close()
        roof.path = path.cgPath
        layers.append(roof)
        
        for i in 0..<numberofpoles {
            let n = CGFloat(i)
            let pole = CAShapeLayer()
            pole.fillColor = fillcolor.cgColor
            pole.strokeColor = bordercolor.cgColor
            pole.lineWidth = polewidth
            pole.lineCap = kCALineCapRound
            path.move(to: CGPoint(x: x + (n + 1) * polepadding + n * polewidth, y: y + roofheight + polewidth))
            path.addLine(to: CGPoint(x: x + (n + 1) * polepadding + n * polewidth, y: y + roofheight + polewidth + frameheight))
            pole.path = path.cgPath
            layers.append(pole)
        }
        
        let base = CAShapeLayer()
        base.fillColor = fillcolor.cgColor
        base.strokeColor = bordercolor.cgColor
        base.lineWidth = polewidth
        base.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x, y: y + h - polewidth))
        path.addLine(to: CGPoint(x: x + w, y: y + h - polewidth))
        base.path = path.cgPath
        layers.append(base)
    }

    
}
