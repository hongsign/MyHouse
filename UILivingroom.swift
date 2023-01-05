//
//  UILivingroom.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-14.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UILivingroom: UIRoom {
    
    private let sizeofinterpadding: CGFloat = 10
    private let sizeoffloorlight: CGFloat = 16
    private let sizeofsofa: CGFloat = 74
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .livingroom
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .livingroom
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        layers.removeAll()
        
        /*---------------------------------------
         draw in a square area in the middle of screen
         -----------------------------------------*/
        if drawrect.size.width > drawrect.size.height {
            drawrect.origin.x = drawrect.origin.x + (drawrect.size.width - drawrect.size.height) / 2
            drawrect.size.width = drawrect.size.height
        }
        else {
            drawrect.origin.y = drawrect.origin.y + (drawrect.size.height - drawrect.size.width) / 2
            drawrect.size.height = drawrect.size.width
        }
        
        let sofawidth = drawrect.size.width * sizeofsofa / 100
        let lightwidth = drawrect.size.width * sizeoffloorlight / 100
        
        let sofarect = CGRect(x: drawrect.origin.x, y: drawrect.origin.y + drawrect.size.height - sofawidth, width: sofawidth, height: sofawidth)
        let lightrect = CGRect(x: drawrect.origin.x + drawrect.size.width - lightwidth, y: drawrect.origin.y, width: lightwidth, height: drawrect.size.height)
        
        layers.append(UIDrawHelper.instance.sofa.drawSofa(type: .double, rect: sofarect, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        layers.append(UIDrawHelper.instance.light.drawLight(type: .floor, rect: lightrect, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        
    }

    
}
