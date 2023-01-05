//
//  UIInsulation.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-08.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIInsulation: UIHouseViewBase {
    
    private let sizeofcornerradius: CGFloat = 5
    private let sizeofpadding: CGFloat = 2
    
    internal var dashinterval: NSNumber {
        get { return 7 }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .insulation
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .insulation
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        layers.removeAll()
        
        let cornerradius = rect.size.width * sizeofcornerradius / 100
        let padding = rect.size.width * sizeofpadding / 100
        
        let shape = CAShapeLayer()
        shape.fillColor = fillcolor.cgColor
        shape.strokeColor = bordercolor.cgColor
        shape.lineWidth = borderwidth
        shape.lineDashPattern = [dashinterval]
        shape.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x + padding, y: rect.origin.y + padding, width: rect.size.width - 2 * padding, height: rect.size.height - 2 * padding), cornerRadius: cornerradius).cgPath
        
        layers.append(shape)
        
    }
    
}
