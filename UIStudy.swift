//
//  UIStudy.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-12.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIStudy: UIRoom {
    
    var _numberoflayers: Int = 3
    var numberoflayers: Int {
        get { return _numberoflayers }
        set(newvalue) {
            if newvalue != _numberoflayers {
                _numberoflayers = newvalue
                reDisplay()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .study
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .study
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        layers.removeAll()
        layers.append(UIDrawHelper.instance.furniture.drawFurniture(type: .bookshelf, rect: drawrect, fillcolor: fillcolor, strokecolor: bordercolor, bgcolor: UIColor.clear, borderwidth: borderwidth, numberoflayers: numberoflayers))
        
    }
    
}
