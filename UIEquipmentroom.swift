//
//  UIEquipmentroom.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-10.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIEquipmentroom: UIRoom {
    
    private let sizeofattennaheight: CGFloat = 30
    private let sizeofwidthofheight: CGFloat = 70
    private let sizeoficonofheight: CGFloat = 60
    private let sizeoflinewidth: CGFloat = 3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .equipmentroom
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .equipmentroom
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        layers.removeAll()
        
        /*---------------------------------------
         simplify (x,y,width,height)
         -----------------------------------------*/
        let w = drawrect.size.width
        let h = drawrect.size.height
        let x = drawrect.origin.x
        let y = drawrect.origin.y
        
        var width = h * sizeofwidthofheight / 100
        width = width > w ? w : width
        let attennaheight = h * sizeofattennaheight / 100
        let linewidth = h * sizeoflinewidth / 100
        var iconlength = (h - attennaheight) * sizeoficonofheight / 100
        iconlength = iconlength > w ? w : iconlength
        
        let frame = CAShapeLayer()
        frame.fillColor = backgroundColor?.cgColor
        frame.strokeColor = bordercolor.cgColor
        frame.lineWidth = linewidth
        frame.path = UIBezierPath(roundedRect: CGRect(x: x + (w - width) / 2, y: y + attennaheight, width: width, height: h - attennaheight), cornerRadius: linewidth).cgPath
        layers.append(frame)
        
        let path = UIBezierPath()
        let attenna = CAShapeLayer()
        attenna.fillColor = bordercolor.cgColor
        attenna.strokeColor = bordercolor.cgColor
        attenna.lineWidth = linewidth * 2
        path.move(to: CGPoint(x: x + (w - width) / 2 + width / 3, y: y))
        path.addLine(to: CGPoint(x: x + (w - width) / 2 + width / 3, y: y + attennaheight))
        attenna.path = path.cgPath
        layers.append(attenna)
        
        layers.append(UIDrawHelper.instance.symbol.drawSymbol(type: .wifi, rect: CGRect(x: x + w / 2 - iconlength / 2, y: y + attennaheight + (h - attennaheight - iconlength) / 2, width: iconlength, height: iconlength), fillcolor: fillcolor, strokecolor: fillcolor, linewidth: 0))
        
        
    }
    
    
    
}
