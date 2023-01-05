//
//  UIPantry.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-12.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIPantry: UIRoom {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .pantry
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .pantry
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        layers.removeAll()
        
        layers.append(UIDrawHelper.instance.cup.drawCup(type: .coffee, rect: drawrect, fillcolor: fillcolor, strokecolor: bordercolor, backgroundcolor: .clear, borderwidth: borderwidth, hasplate: true, hasair: true))
        
        //layers.append(UIHelpersDrawCup.drawCup(type: .cocktail, rect: drawrect, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
    }
    
}
