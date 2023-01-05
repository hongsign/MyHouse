//
//  UIGutter.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-01-27.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIGutter: UIHouseViewBase {
    private let sizeofbar: CGFloat = 12.5
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .gutter
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .gutter
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        layers.removeAll()
        
        let shape = CAShapeLayer()
        shape.lineWidth = borderwidth
        shape.lineJoin = kCALineJoinMiter
        shape.strokeColor = bordercolor.cgColor
        shape.fillColor = fillcolor.cgColor
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y + rect.size.height))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width - rect.size.width * sizeofbar / 100, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width - rect.size.width * sizeofbar / 100, y: rect.origin.y + rect.size.height - rect.size.height * sizeofbar / 100))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width * sizeofbar / 100, y: rect.origin.y + rect.size.height - rect.size.height * sizeofbar / 100))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width * sizeofbar / 100, y: rect.origin.y))
        
        path.close()
        shape.path = path.cgPath
        
        //layer.addSublayer(shape)
        layers.append(shape)
    }

}
