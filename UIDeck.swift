//
//  UIDeck.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-01-26.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIDeck: UIPlace {
    
    //all precentage
    private let sizeoftopbar: CGFloat = 15
    private let sizeofbottombar: CGFloat = 25
    private let sizeofpole: CGFloat = 8
    private let padding: CGFloat = 10
    
    //percentage of bar height
    private let cornerradius: CGFloat = 15
    
    private let numberofpoles: Int = 4
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .deck
        category = .place
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .deck
        category = .place
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawLayers(rect: CGRect) {
        layers.removeAll()
        
        let topbar = CAShapeLayer()
        topbar.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: rect.size.height * sizeoftopbar / 100), cornerRadius: rect.size.height * sizeoftopbar / 100 * cornerradius / 100).cgPath
        topbar.fillColor = fillcolor.cgColor
        topbar.strokeColor = bordercolor.cgColor
        topbar.lineWidth = borderwidth
        //layer.addSublayer(topbar)
        layers.append(topbar)
        
        let bottombar = CAShapeLayer()
        bottombar.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x, y: rect.origin.y + rect.size.height * (100 - sizeofbottombar) / 100, width: rect.size.width, height: rect.size.height * sizeofbottombar / 100), cornerRadius: rect.size.height * sizeofbottombar / 100 * cornerradius / 100).cgPath
        bottombar.fillColor = fillcolor.cgColor
        bottombar.strokeColor = bordercolor.cgColor
        topbar.lineWidth = borderwidth
        //layer.addSublayer(bottombar)
        layers.append(bottombar)
        
        let polepadding: CGFloat = rect.size.width * padding / 100
        let polewidth: CGFloat = rect.size.height * sizeofpole / 100
        let poleinterval: CGFloat = (rect.size.width - 2 * polepadding - CGFloat(numberofpoles) * polewidth) / CGFloat(numberofpoles-1)
        
        for i in 0..<numberofpoles {
            let pole = CAShapeLayer()
            pole.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x + rect.size.width * padding / 100 + CGFloat(i) * poleinterval, y: rect.origin.y + rect.size.height * sizeoftopbar / 100, width: rect.size.height * sizeofpole / 100, height: rect.size.height - rect.size.height * (sizeoftopbar + sizeofbottombar) / 100), cornerRadius: rect.size.height * sizeofpole / 100 * cornerradius / 100).cgPath
            pole.fillColor = fillcolor.cgColor
            pole.strokeColor = bordercolor.cgColor
            topbar.lineWidth = borderwidth
            //layer.addSublayer(pole)
            layers.append(pole)
        }

    }
    
}
