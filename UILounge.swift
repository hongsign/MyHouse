//
//  UILounge.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-14.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UILounge: UIRoom {
    
    private let sizeofcupwidth: CGFloat = 25
    private let sizeofcupheight: CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .lounge
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .lounge
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
        
        let cuprect = CGRect(x: drawrect.origin.x, y: drawrect.origin.y, width: drawrect.size.width * sizeofcupwidth / 100, height: drawrect.size.height * sizeofcupheight / 100)
        
        layers.append(UIDrawHelper.instance.sofa.drawSofa(type: .single, rect: drawrect, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        layers.append(UIDrawHelper.instance.cup.drawCup(type: .cocktail, rect: cuprect, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
    }
    
}
