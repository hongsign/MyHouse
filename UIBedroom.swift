//
//  UIBedroom.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-07.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIBedroom: UIRoom {
    
    private let sizeofheadheight: CGFloat = 100
    private let sizeoftailheight: CGFloat = 80
    private let sizeoflegheight: CGFloat = 15
    private let sizeofboardwidth: CGFloat = 15
    private let sizeofmatheigth: CGFloat = 35
    private let sizeofpillowheight: CGFloat = 15
    private let sizeofpillowwidth: CGFloat = 20
    
    override var sizeofheight: CGFloat {
        return 60
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .bedroom
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .bedroom
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        let boardwidth = sizeofboardwidth * drawrect.size.height / 100
        let matheight = sizeofmatheigth * drawrect.size.height / 100
        let pillowheight = sizeofpillowheight * drawrect.size.height / 100
        let pillowwidth = sizeofpillowwidth * drawrect.size.width / 100
        let legheight = sizeoflegheight * drawrect.size.height / 100
        let headheight = sizeofheadheight * drawrect.size.height / 100
        let tailheight = sizeoftailheight * drawrect.size.height / 100
        
        layers.removeAll()
        
        let path = UIBezierPath()
        let head = CAShapeLayer()
        head.fillColor = bordercolor.cgColor
        head.strokeColor = bordercolor.cgColor
        head.lineWidth = boardwidth
        
        path.move(to: CGPoint(x: drawrect.origin.x + boardwidth / 2, y: drawrect.origin.y + drawrect.size.height))
        path.addLine(to: CGPoint(x: drawrect.origin.x + boardwidth / 2, y: drawrect.origin.y + drawrect.size.height - headheight))
        head.path = path.cgPath
        layers.append(head)
        
        let tail = CAShapeLayer()
        tail.fillColor = bordercolor.cgColor
        tail.strokeColor = bordercolor.cgColor
        tail.lineWidth = boardwidth
        
        path.move(to: CGPoint(x: drawrect.origin.x + drawrect.size.width - boardwidth / 2, y: drawrect.origin.y + drawrect.size.height))
        path.addLine(to: CGPoint(x: drawrect.origin.x + drawrect.size.width - boardwidth / 2, y: drawrect.origin.y + drawrect.size.height - tailheight))
        tail.path = path.cgPath
        layers.append(tail)
        
        let board = CAShapeLayer()
        board.fillColor = bordercolor.cgColor
        board.strokeColor = bordercolor.cgColor
        board.lineWidth = boardwidth
        
        path.move(to: CGPoint(x: drawrect.origin.x + boardwidth, y: drawrect.origin.y + drawrect.size.height - legheight - boardwidth / 2))
        path.addLine(to: CGPoint(x: drawrect.origin.x + drawrect.size.width - boardwidth, y: drawrect.origin.y + drawrect.size.height - legheight - boardwidth / 2))
        board.path = path.cgPath
        layers.append(board)
        
        let mat = CAShapeLayer()
        mat.fillColor = fillcolor.cgColor
        mat.strokeColor = bordercolor.cgColor
        mat.lineWidth = borderwidth
        mat.path = UIBezierPath(roundedRect: CGRect(x: drawrect.origin.x + boardwidth, y: drawrect.origin.y + drawrect.size.height - legheight - boardwidth - matheight, width: drawrect.size.width - 2 * boardwidth, height: matheight), cornerRadius: boardwidth / 2).cgPath
        layers.append(mat)
        
        let pillow = CAShapeLayer()
        pillow.fillColor = fillcolor.cgColor
        pillow.strokeColor = bordercolor.cgColor
        pillow.lineWidth = borderwidth
        pillow.path = UIBezierPath(roundedRect: CGRect(x: drawrect.origin.x + boardwidth, y: drawrect.origin.y + drawrect.size.height - legheight - boardwidth - matheight - pillowheight, width: pillowwidth, height: pillowheight), cornerRadius: boardwidth).cgPath
        layers.append(pillow)
        
    }

    
}
