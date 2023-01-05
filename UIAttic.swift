//
//  UIAttic.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-08.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIAttic: UIRoom {
    
    private let sizeoflinewidth: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .attic
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .attic
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        layers.removeAll()
        
        let radius = 2 * drawrect.size.height > drawrect.size.width ? drawrect.size.width / 2 : drawrect.size.height
        let yoffset = 2 * drawrect.size.height > drawrect.size.width ? drawrect.size.height - drawrect.size.width / 2 : 0
        let linewidth = drawrect.size.height * sizeoflinewidth / 100
        
        let attic = CAShapeLayer()
        attic.fillColor = fillcolor.cgColor
        attic.strokeColor = bordercolor.cgColor
        attic.lineWidth = linewidth
        attic.path = UIBezierPath(arcCenter: CGPoint(x: drawrect.origin.x + drawrect.size.width / 2, y: drawrect.origin.y + drawrect.size.height), radius: radius, startAngle: CGFloat.pi, endAngle: 0, clockwise: true).cgPath
        layers.append(attic)
        
        let mid = CAShapeLayer()
        mid.fillColor = bordercolor.cgColor
        mid.strokeColor = bordercolor.cgColor
        mid.lineWidth = linewidth
        let path = UIBezierPath()
        path.move(to: CGPoint(x: drawrect.origin.x + drawrect.size.width / 2, y: drawrect.origin.y + yoffset))
        path.addLine(to: CGPoint(x: drawrect.origin.x + drawrect.size.width / 2, y: drawrect.origin.y + radius))
        mid.path = path.cgPath
        layers.append(mid)
    }

    
}
