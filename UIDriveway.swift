//
//  UIDriveway.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-01.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIDriveway: UIPlace {
    private let sizeofshift: CGFloat = 20
    private let sizeofline: CGFloat = 5
    private let sizeofdash: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .driveway
        category = .place
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .driveway
        category = .place
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        layers.removeAll()
        
        let shift = rect.size.width * sizeofshift / 100
        let linewidth = rect.size.height * sizeofline / 100
        let dashlength = NSNumber(value: Int(rect.size.width * sizeofdash / 100))
        
        var startpoint: CGPoint = .zero
        var endpoint: CGPoint = .zero
        
        let path = UIBezierPath()
        
        let topline = CAShapeLayer()
        topline.fillColor = bordercolor.cgColor
        topline.strokeColor = bordercolor.cgColor
        topline.lineWidth = linewidth
        startpoint.x = rect.origin.x + shift
        startpoint.y = rect.origin.y
        endpoint.x = rect.origin.x + rect.size.width
        endpoint.y = rect.origin.y + rect.size.height - shift
        path.move(to: startpoint)
        path.addLine(to: endpoint)
        topline.path = path.cgPath
        //layer.addSublayer(topline)
        
        let bottomline = CAShapeLayer()
        bottomline.fillColor = bordercolor.cgColor
        bottomline.strokeColor = bordercolor.cgColor
        bottomline.lineWidth = linewidth
        startpoint.x = rect.origin.x
        startpoint.y = rect.origin.y + shift
        endpoint.x = rect.origin.x + rect.size.width - shift
        endpoint.y = rect.origin.y + rect.size.height
        path.move(to: startpoint)
        path.addLine(to: endpoint)
        bottomline.path = path.cgPath
        //layer.addSublayer(bottomline)
        
        let dashline = CAShapeLayer()
        dashline.fillColor = bordercolor.cgColor
        dashline.strokeColor = bordercolor.cgColor
        dashline.lineWidth = linewidth
        dashline.lineJoin = kCALineJoinRound
        dashline.lineDashPattern = [dashlength, dashlength]
        startpoint.x = rect.origin.x + shift / 2
        startpoint.y = rect.origin.y + shift / 2
        endpoint.x = rect.origin.x + rect.size.width - shift / 2
        endpoint.y = rect.origin.y + rect.size.height - shift / 2
        path.move(to: startpoint)
        path.addLine(to: endpoint)
        dashline.path = path.cgPath
        //layer.addSublayer(dashline)
        
        layers.append(topline)
        layers.append(bottomline)
        layers.append(dashline)

    }
    
}
