//
//  UIDiningroom.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-12.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIDiningroom: UIRoom {
    
    private let sizeoflightheight: CGFloat = 30
    private let sizeoftableheight: CGFloat = 50
    private let sizeoflightwidth: CGFloat = 15
    private let sizeoflegthick: CGFloat = 5
    private let sizeoftablethick: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .diningroom
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .diningroom
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        layers.removeAll()
        
        /*---------------------------------------
         simplify (x,y,width,height), and draw in square
         -----------------------------------------*/
        var w = drawrect.size.width
        var h = drawrect.size.height
        var x = drawrect.origin.x
        var y = drawrect.origin.y
        x = w > h ? x + (drawrect.size.width - h) / 2 : x
        y = w > h ? y : y + (drawrect.size.height - w) / 2
        w = w > h ? h : w
        h = w
        
        let lightheight = h * sizeoflightheight / 100
        let lightwidth = w * sizeoflightwidth / 100
        let tableheight = h * sizeoftableheight / 100
        let legthick = w * sizeoflegthick / 100
        let tablethick = w * sizeoftablethick / 100
        
        layers.append(UIDrawHelper.instance.light.drawLight(type: .hang, rect: CGRect(x: x + (w - lightwidth) / 2, y: y, width: lightwidth, height: lightheight), fillcolor: bordercolor, strokecolor: bordercolor, borderwidth: borderwidth))
        layers.append(UIDrawHelper.instance.table.drawTable(type: .dining, rect: CGRect(x: x, y: y + h - tableheight, width: w, height: tableheight), fillcolor: bordercolor, strokecolor: bordercolor, backgroundcolor: .clear, legthick: legthick, topthick: tablethick))

    }
    

    
}
