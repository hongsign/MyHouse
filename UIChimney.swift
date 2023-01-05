//
//  UIChimney.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-01.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIChimney: UIHouseViewBase {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .chimney
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .chimney
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        layers.removeAll()
        
        drawSmoke(rect: CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: rect.size.height))
        drawChimney(rect: CGRect(x: rect.size.width / 3, y: rect.size.height * 3 / 4, width: rect.size.width / 3, height: rect.size.height / 4))
    }
    
    
    private func drawSmoke(rect: CGRect) {
        
        let smoke = CAShapeLayer()
        smoke.lineWidth = borderwidth
        smoke.lineJoin = kCALineJoinMiter
        smoke.strokeColor = bordercolor.cgColor
        smoke.fillColor = UIColor.clear.cgColor //fillcolor.cgColor
        
        let center = CGPoint(x: rect.width/2, y: rect.height/2)
        let radius: CGFloat = min(rect.width, rect.height)
        let arcwidth: CGFloat = borderwidth
        let startangle: CGFloat = 3 * CGFloat.pi / 4
        let endangle: CGFloat = CGFloat.pi / 4
        
        smoke.path = UIBezierPath(arcCenter: center, radius: radius/2-arcwidth/2, startAngle: startangle, endAngle: endangle, clockwise: true).cgPath
        
        //layer.addSublayer(smoke)
        layers.append(smoke)
    }
    
    private func drawChimney(rect: CGRect) {
        
        let cornerradius: CGFloat = 5
        
        let top = CAShapeLayer()
        top.lineWidth = borderwidth
        top.lineJoin = kCALineJoinMiter
        top.strokeColor = bordercolor.cgColor
        top.fillColor = fillcolor.cgColor
        
        top.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x * 7 / 8, y: rect.origin.y, width: rect.size.width * 5 / 4, height: rect.size.height / 5), cornerRadius: cornerradius).cgPath
        
        //layer.addSublayer(top)
        layers.append(top)
        
        let bottom = CAShapeLayer()
        bottom.lineWidth = borderwidth
        bottom.lineJoin = kCALineJoinMiter
        bottom.strokeColor = bordercolor.cgColor
        bottom.fillColor = fillcolor.cgColor
        
        bottom.path = UIBezierPath(rect: CGRect(x: rect.origin.x, y: rect.origin.y + rect.size.height / 5, width: rect.size.width, height: rect.size.height * 4 / 5)).cgPath
        //layer.addSublayer(bottom)
        layers.append(bottom)

    }
}
