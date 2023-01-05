//
//  UIHouseWindow.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-01.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHouseWindow: UIHouseViewBase {
    private let sizeofframe: CGFloat = 10
    private let sizeofbar: CGFloat = 5
    private let cornerradius: CGFloat = 5
    
    var _innercolor: UIColor = .white
    var innercolor: UIColor {
        get { return _innercolor }
        set(newvalue) {
            _innercolor = newvalue
            reDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .window
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .window
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        layers.removeAll()
        
        let framewidth = rect.size.width * sizeofframe / 100
        let barwidth = rect.size.width * sizeofbar / 100
        
        let outsideframe = CAShapeLayer()
        outsideframe.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: rect.size.height), cornerRadius: rect.size.height * cornerradius / 100).cgPath
        outsideframe.fillColor = fillcolor.cgColor
        outsideframe.strokeColor = bordercolor.cgColor
        outsideframe.lineWidth = borderwidth
        //layer.addSublayer(outsideframe)
        
        let insideframe = CAShapeLayer()
        
        insideframe.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x + framewidth, y: rect.origin.y + framewidth, width: rect.size.width - 2 * framewidth, height: rect.size.height - 2 * framewidth), cornerRadius: rect.size.height * cornerradius / 100).cgPath
        insideframe.fillColor = innercolor.cgColor //fillcolor.cgColor
        insideframe.strokeColor = bordercolor.cgColor
        insideframe.lineWidth = borderwidth
        //layer.addSublayer(insideframe)
        
        let vbar = CAShapeLayer()
        vbar.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x + framewidth, y: rect.origin.y + rect.size.height / 2 - barwidth / 2, width: rect.size.width - 2 * framewidth, height: barwidth), cornerRadius: barwidth * cornerradius / 100).cgPath
        vbar.fillColor = fillcolor.cgColor
        vbar.strokeColor = bordercolor.cgColor
        vbar.lineWidth = borderwidth
        //layer.addSublayer(vbar)
        
        let hbar = CAShapeLayer()
        hbar.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x + rect.size.width / 2 - barwidth / 2, y: rect.origin.y + framewidth, width: barwidth, height: rect.size.height - 2 * framewidth), cornerRadius: barwidth * cornerradius / 100).cgPath
        hbar.fillColor = fillcolor.cgColor
        hbar.strokeColor = bordercolor.cgColor
        hbar.lineWidth = borderwidth
        //layer.addSublayer(hbar)
        
        layers.append(outsideframe)
        layers.append(insideframe)
        layers.append(vbar)
        layers.append(hbar)

    }
    
}
