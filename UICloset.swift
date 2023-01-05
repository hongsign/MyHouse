//
//  UICloset.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-15.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UICloset: UIPlace {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .closet
        category = .place
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .closet
        category = .place
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawLayers(rect: CGRect) {
        layers.removeAll()
        layers.append(UIDrawHelper.instance.furniture.drawFurniture(type: .cabinet, rect: rect, fillcolor: fillcolor, strokecolor: bordercolor, bgcolor: UIColor.clear, borderwidth: borderwidth))
    }

    
}
