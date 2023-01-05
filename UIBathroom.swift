//
//  UIBathroom.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-07.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIBathroom: UIRoom {
    
    private let sizeoftubheight: CGFloat = 35
    private let sizeoflegheight: CGFloat = 15
    private let sizeofshowerheadwidth: CGFloat = 12
    private let sizeofshowerheadradius: CGFloat = 10
    private let sizeoftubpadding: CGFloat = 5
    private let sizeoflinewidth: CGFloat = 5
    private let sizeoflegoffset: CGFloat = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .bathroom
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .bathroom
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        layers.removeAll()
        
        let tubheight = drawrect.size.height * sizeoftubheight / 100
        let legheight = drawrect.size.height * sizeoflegheight / 100
        let legoffset = drawrect.size.width * sizeoflegoffset / 100
        let showerheadwidth = drawrect.size.width * sizeofshowerheadwidth / 100
        let showerheadradius = drawrect.size.height * sizeofshowerheadradius / 100
        let tubpadding = drawrect.size.width * sizeoftubpadding / 100
        let linewidth = drawrect.size.width * sizeoflinewidth / 100
        
        let x = drawrect.origin.x
        let y = drawrect.origin.y
        let width = drawrect.size.width
        let height = drawrect.size.height
        
        let tub = CAShapeLayer()
        tub.fillColor = fillcolor.cgColor
        tub.strokeColor = bordercolor.cgColor
        tub.lineWidth = linewidth
        tub.path = UIBezierPath(roundedRect: CGRect(x: x + tubpadding, y: y + height - legheight - tubheight, width: width - 2 * tubpadding, height: tubheight ), cornerRadius: linewidth).cgPath
        layers.append(tub)
        
        let path = UIBezierPath()
        let tubtop = CAShapeLayer()
        tubtop.fillColor = bordercolor.cgColor
        tubtop.strokeColor = bordercolor.cgColor
        tubtop.lineWidth = linewidth + tubpadding
        path.move(to: CGPoint(x: x, y: y + height - legheight - tubheight))
        path.addLine(to: CGPoint(x: x + width, y: y + height - legheight - tubheight))
        tubtop.path = path.cgPath
        layers.append(tubtop)
        
        let leftleg = CAShapeLayer()
        leftleg.fillColor = bordercolor.cgColor
        leftleg.strokeColor = bordercolor.cgColor
        leftleg.lineWidth = linewidth
        leftleg.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x + tubpadding + legoffset, y: y + height - legheight))
        path.addLine(to: CGPoint(x: x + tubpadding, y: y + height))
        leftleg.path = path.cgPath
        layers.append(leftleg)
        
        let rightleg = CAShapeLayer()
        rightleg.fillColor = bordercolor.cgColor
        rightleg.strokeColor = bordercolor.cgColor
        rightleg.lineWidth = linewidth
        rightleg.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x + width - tubpadding - legoffset, y: y + height - legheight))
        path.addLine(to: CGPoint(x: x + width - tubpadding, y: y + height))
        rightleg.path = path.cgPath
        layers.append(rightleg)
        
        let showstick = CAShapeLayer()
        showstick.fillColor = backgroundColor?.cgColor
        showstick.strokeColor = bordercolor.cgColor
        showstick.lineWidth = linewidth
        path.move(to: CGPoint(x: x + width - tubpadding, y: y + height - legheight - tubheight))
        path.addLine(to: CGPoint(x: x + width - tubpadding, y: y))
        path.addLine(to: CGPoint(x: x + width - tubpadding - 3 * showerheadwidth / 2, y: y))
        //path.addArc(withCenter: CGPoint(x: x + width - tubpadding - showerheadradius, y: y + showerheadradius), radius: showerheadradius, startAngle: 0, endAngle: CGFloat.pi, clockwise: false)
        showstick.path = path.cgPath
        layers.append(showstick)
        
        let showerhead = CAShapeLayer()
        showerhead.fillColor = bordercolor.cgColor
        showerhead.strokeColor = bordercolor.cgColor
        showerhead.lineWidth = linewidth
        showerhead.path = UIBezierPath(arcCenter: CGPoint(x: x + width - tubpadding - 2 * showerheadradius - showerheadwidth / 3, y: y + showerheadradius + showerheadwidth / 6), radius: showerheadwidth / 2, startAngle: 7 * CGFloat.pi / 6, endAngle: CGFloat.pi / 6, clockwise: true).cgPath
        layers.append(showerhead)
        
    }

}
