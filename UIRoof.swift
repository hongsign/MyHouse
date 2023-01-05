//
//  UIRoof.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-03.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIRoof: UIHouseViewBase {
    
    private let sizeofroofwidth: CGFloat = 12
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        viewid = .roof
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .white
        viewid = .roof
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getInnerRect() -> CGRect {
        
        var r: CGRect = .zero
        
        let angle = atan(frame.size.height / (frame.size.width / 2))
        let hypotenuse = frame.size.height / sin(angle) / 2
        
        r.size.height = hypotenuse * sin(angle)
        r.size.width = (frame.size.width / 2 - hypotenuse * cos(angle)) * 2
        
        r.origin.x = frame.origin.x + (frame.size.width - r.size.width) / 2
        r.origin.y = frame.origin.y + (frame.size.height - r.size.height)
        
        return r
        
    }
    
    override func drawLayers(rect: CGRect) {
        
        layers.removeAll()
        
        let roofwidth = rect.size.height * sizeofroofwidth / 100
        
        let path = UIBezierPath()
        let roof = CAShapeLayer()
        roof.fillColor = backgroundColor?.cgColor
        roof.strokeColor = bordercolor.cgColor
        roof.lineWidth = roofwidth
        roof.lineJoin = kCALineJoinRound
        
        path.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y + rect.size.height))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width / 2, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height))
        roof.path = path.cgPath
        //layer.addSublayer(roof)
        layers.append(roof)
    }
    
}
