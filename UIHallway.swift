//
//  UIHallway.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-13.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHallway: UIRoom {
    
    private let sizeofexitwidth: CGFloat = 15
    private let sizeofexitheight: CGFloat = 25
    private let sizeofpolewidth: CGFloat = 7
    private let numberofpoles: Int = 3
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .hallway
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .hallway
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
        
        let exitwidth = w * sizeofexitwidth / 100
        let exitheight = h * sizeofexitheight / 100
        let polewidth = w * sizeofpolewidth / 100
        let poleintern = ((w - exitwidth) / 2 - CGFloat(numberofpoles) * polewidth) / (CGFloat(numberofpoles) + 1)
        
        let path = UIBezierPath()
        let ceiling = CAShapeLayer()
        ceiling.fillColor = fillcolor.cgColor
        ceiling.strokeColor = fillcolor.cgColor
        ceiling.lineJoin = kCALineJoinRound
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x + (w - exitwidth) / 2, y: y + (h - exitheight) / 2))
        path.addLine(to: CGPoint(x: x + (w - exitwidth) / 2 + exitwidth, y: y + (h - exitheight) / 2))
        path.addLine(to: CGPoint(x: x + w, y: y))
        ceiling.path = path.cgPath
        layers.append(ceiling)

        
        let floor = CAShapeLayer()
        floor.fillColor = fillcolor.cgColor
        floor.strokeColor = fillcolor.cgColor
        floor.lineJoin = kCALineJoinRound
        path.move(to: CGPoint(x: x, y: y + h))
        path.addLine(to: CGPoint(x: x + (w - exitwidth) / 2, y: y + (h - exitheight) / 2 + exitheight))
        path.addLine(to: CGPoint(x: x + (w - exitwidth) / 2 + exitwidth, y: y + (h - exitheight) / 2 + exitheight))
        path.addLine(to: CGPoint(x: x + w, y: y + h))
        floor.path = path.cgPath
        layers.append(floor)
        
        let polepath = UIBezierPath()
        for i in 0..<numberofpoles {
            let n = CGFloat(i)
            let pole = CAShapeLayer()
            pole.fillColor = fillcolor.cgColor
            pole.strokeColor = fillcolor.cgColor
            pole.lineWidth = polewidth
            polepath.move(to: CGPoint(x: x + (n + 1) * poleintern + n * polewidth, y: y + 2))
            polepath.addLine(to: CGPoint(x: x + (n + 1) * poleintern + n * polewidth, y: y + h - 2))
            pole.path = polepath.cgPath
            layers.append(pole)
        }
        
        for i in 0..<numberofpoles {
            let n = CGFloat(i)
            let pole = CAShapeLayer()
            pole.fillColor = fillcolor.cgColor
            pole.strokeColor = fillcolor.cgColor
            pole.lineWidth = polewidth
            polepath.move(to: CGPoint(x: x + w - (n + 1) * poleintern - n * polewidth, y: y + 2))
            polepath.addLine(to: CGPoint(x: x + w - (n + 1) * poleintern - n * polewidth, y: y + h - 2))
            pole.path = polepath.cgPath
            layers.append(pole)
        }
        
        let exit = CAShapeLayer()
        exit.fillColor = fillcolor.cgColor
        exit.strokeColor = bordercolor.cgColor
        exit.lineJoin = kCALineJoinRound
        exit.path = UIBezierPath(rect: CGRect(x: x + (w - exitwidth) / 2, y: y + (h - exitheight) / 2, width: exitwidth, height: exitheight)).cgPath
        layers.append(exit)

        
    }

    
}
