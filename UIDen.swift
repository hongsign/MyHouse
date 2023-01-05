//
//  UIDen.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-09.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIDen: UIRoom {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .den
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .den
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        layers.removeAll()
        
        layers.append(UIDrawHelper.instance.table.drawTable(type: .easy, rect: drawrect, fillcolor: fillcolor, strokecolor: bordercolor, backgroundcolor: .clear))
        
    }

    
}
