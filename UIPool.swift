//
//  UIPool.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-18.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIPool: UIPlace {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .pool
        category = .place
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .pool
        category = .place
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawLayers(rect: CGRect) {
        layers.removeAll()
        layers.append(UIDrawHelper.instance.place.drawPlace(type: .pool, rect: rect, fillcolor: fillcolor, strokecolor: bordercolor, bgcolor: UIColor.clear, borderwidth: borderwidth))
    }

    
}
