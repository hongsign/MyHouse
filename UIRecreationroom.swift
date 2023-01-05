//
//  UIRecreationroom.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-13.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIRecreationroom: UIRoom {
    
    private let sizeofthing: CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .recreationroom
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .recreationroom
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
        
        let rectsize = w * sizeofthing / 100
        
        layers.append(UIDrawHelper.instance.game.drawGame(type: .chess, rect: CGRect(x: x + (w - rectsize) / 2, y: y + h / 4 - rectsize / 2, width: rectsize, height: rectsize), fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        layers.append(UIDrawHelper.instance.game.drawGame(type: .billiard, rect: CGRect(x: x + w / 4 - rectsize / 2, y: y + 3 *  h / 4 - rectsize / 2, width: rectsize, height: rectsize), fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth, number: 8))
        layers.append(UIDrawHelper.instance.game.drawGame(type: .dice, rect: CGRect(x: x + 3 * w / 4 - rectsize / 2, y: y + 3 *  h / 4 - rectsize / 2, width: rectsize, height: rectsize), fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth, number: 2))
        
    }
    
}
