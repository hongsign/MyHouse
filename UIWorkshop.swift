//
//  UIWorkshop.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-13.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIWorkshop: UIRoom {
    
    private let sizeoftoolpadding: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .workshop
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .workshop
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
        
        let x = drawrect.origin.x
        let y = drawrect.origin.y
        let w = drawrect.size.width
        let h = drawrect.size.height
        let padding: CGFloat = w * sizeoftoolpadding / 100
        let width = (w - 3 * padding) / 2
        
        let wrenchrect = CGRect(x: x + padding, y: y, width: width, height: h)
        let driverrect = CGRect(x: x + width + 2 * padding, y: y, width: width, height: h)
        
        layers.append(UIDrawHelper.instance.tools.drawTool(type: .wrench, rect: wrenchrect, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        layers.append(UIDrawHelper.instance.tools.drawTool(type: .screwdriver, rect: driverrect, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        
    }
    
}
