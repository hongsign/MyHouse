//
//  UIPorch.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-20.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIPorch: UIPlace {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .porch
        category = .place
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .porch
        category = .place
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawLayers(rect: CGRect) {
        
        layers.removeAll()
        
        let sizeofmirrorwidth: CGFloat = 40
        let sizeofmirrorheight: CGFloat = 70
        let sizeoflightwidth: CGFloat = 25
        let sizeoftoppadding: CGFloat = 8
        
        let mirrorwidth = rect.size.width * sizeofmirrorwidth / 100
        let mirrorheight = rect.size.height * sizeofmirrorheight / 100
        let lightwidth = rect.size.width * sizeoflightwidth / 100
        let toppadding = rect.size.height * sizeoftoppadding / 100
        
        let x = rect.origin.x
        let y = rect.origin.y
        let w = rect.size.width
        //let h = rect.size.height
        
        let mirror = CGRect(x: x + (w - mirrorwidth) / 2, y: y, width: mirrorwidth, height: mirrorheight)
        let leftlight = CGRect(x: x, y: y + toppadding, width: lightwidth, height: lightwidth)
        let rightlight = CGRect(x: x + w - lightwidth, y: y + toppadding, width: lightwidth, height: lightwidth)
        
        layers.append(UIDrawHelper.instance.furniture.drawFurniture(type: .mirror, rect: mirror, fillcolor: fillcolor, strokecolor: bordercolor, bgcolor: UIColor.clear, borderwidth: borderwidth))
        layers.append(UIDrawHelper.instance.light.drawLight(type: .wall, rect: leftlight, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth, direction: .left))
        layers.append(UIDrawHelper.instance.light.drawLight(type: .wall, rect: rightlight, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth, direction: .right))
    }

    
}
