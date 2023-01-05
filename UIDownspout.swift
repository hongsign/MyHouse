//
//  UIDownspout.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-01.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIDownspout: UIHouseViewBase {
    private let sizeofspread: CGFloat = 12.5
    private let sizeoftube: CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .downspout
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .downspout
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        layers.removeAll()
        
        let shape = CAShapeLayer()
        shape.lineWidth = borderwidth;
        shape.lineJoin = kCALineJoinMiter
        shape.strokeColor = bordercolor.cgColor
        shape.fillColor = fillcolor.cgColor
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.origin.x + rect.size.width * sizeoftube / 100, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width * sizeoftube / 100, y: rect.origin.y + rect.size.height * (100 - sizeofspread) / 100))
        path.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y + rect.size.height))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width * sizeoftube / 100, y: rect.origin.y + rect.size.height))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height * (100 - sizeofspread) / 100))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y))
        
        path.close()
        shape.path = path.cgPath
        
        layers.append(shape)
    }
    
}
