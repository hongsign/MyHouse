//
//  UIOffice.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-12.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIOffice: UIRoom {
    
    private let sizeoftableheight: CGFloat = 66
    private let sizeofcomputerheight: CGFloat = 34
    
    private let sizeofcomputerborderwidth: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .office
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .office
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
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
        
        let tableheight = drawrect.size.height * sizeoftableheight / 100
        var computerheight = drawrect.size.height * sizeofcomputerheight / 100
        computerheight = computerheight > drawrect.size.width ? drawrect.size.width : computerheight
        let computerborderwidth = computerheight * sizeofcomputerborderwidth / 100
        
        
        let tablerect = CGRect(x: drawrect.origin.x, y: drawrect.origin.y + drawrect.size.height - tableheight, width: drawrect.size.width, height: tableheight)
        let computerrect = CGRect(x: drawrect.origin.x + (drawrect.size.width - computerheight) / 2, y: drawrect.origin.y + drawrect.size.height - tableheight - computerheight, width: computerheight, height: computerheight)
        
        layers.removeAll()
        
        layers.append(UIDrawHelper.instance.table.drawTable(type: .office, rect: tablerect, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        layers.append(UIDrawHelper.instance.computer.drawComputer(type: .desktop, rect: computerrect, fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: computerborderwidth))
    }

    
}
