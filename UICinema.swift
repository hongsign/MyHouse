//
//  UICinema.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-08.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UICinema: UIRoom {
    
    private let sizeofplay: CGFloat = 50
    private let sizeofbarpadding: CGFloat = 3
    private let sizeofbarheight: CGFloat = 12
    
    private var barheight: CGFloat = 0
    private var barpadding: CGFloat = 0
    private var rectlength: CGFloat = 0
    private var numberofrect: Int = 0
    
    override var appearduration: Double {
        return 0.1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .cinema
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .cinema
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        /*--------------------------------------------------
         will draw a square symbol in middle of screen
        ----------------------------------------------------*/
        if drawrect.size.width > drawrect.size.height {
            drawrect.origin.x = drawrect.origin.x + (drawrect.size.width - drawrect.size.height) / 2
            drawrect.size.width = drawrect.size.height
        }
        else {
            drawrect.origin.y = drawrect.origin.y + (drawrect.size.height - drawrect.size.width) / 2
            drawrect.size.height = drawrect.size.width
        }
        
        barheight = drawrect.size.height * sizeofbarheight / 100
        barpadding = barheight * sizeofbarpadding / 100
        rectlength = barheight //- 2 * barpadding
        
        numberofrect = Int(drawrect.size.width / rectlength / 2)
        
        layers.removeAll()
        
        drawUpbar()
        drawBottombar()
        drawPlay()
        
    }
    
    private func drawUpbar() {
        /*
        let upbar = CAShapeLayer()
        upbar.fillColor = bordercolor.cgColor
        upbar.strokeColor = bordercolor.cgColor
        upbar.lineWidth = borderwidth
        upbar.path = UIBezierPath(rect: CGRect(x: drawrect.origin.x, y: drawrect.origin.y, width: drawrect.size.width, height: barheight)).cgPath
        layers.append(upbar)
        */
 
        var r: CGRect = .zero
        for i in 0..<numberofrect {
            let n = CGFloat(i)
            r.origin.x = drawrect.origin.x + 2 * n * rectlength
            r.origin.y = drawrect.origin.y
            r.size.width = rectlength
            r.size.height = rectlength
            let barrect = CAShapeLayer()
            barrect.fillColor = bordercolor.cgColor
            barrect.strokeColor = bordercolor.cgColor
            barrect.lineWidth = borderwidth
            barrect.path = UIBezierPath(rect: r).cgPath
            layers.append(barrect)
        }

    }
    
    private func drawBottombar() {
        /*
        let bar = CAShapeLayer()
        bar.fillColor = bordercolor.cgColor
        bar.strokeColor = bordercolor.cgColor
        bar.lineWidth = borderwidth
        bar.path = UIBezierPath(rect: CGRect(x: drawrect.origin.x, y: drawrect.origin.y + drawrect.size.height - barheight, width: drawrect.size.width, height: barheight)).cgPath
        layers.append(bar)
        */
        
        var r: CGRect = .zero
        for i in 0..<numberofrect {
            let n = CGFloat(i)
            r.origin.x = drawrect.origin.x + 2 * n * rectlength
            r.origin.y = drawrect.origin.y + drawrect.size.height - barheight
            r.size.width = rectlength
            r.size.height = rectlength
            let barrect = CAShapeLayer()
            barrect.fillColor = bordercolor.cgColor
            barrect.strokeColor = bordercolor.cgColor
            barrect.lineWidth = borderwidth
            barrect.path = UIBezierPath(rect: r).cgPath
            layers.append(barrect)
        }

    }
    
    private func drawPlay() {
        
        let playsize = drawrect.size.width > drawrect.size.height ? drawrect.size.height * sizeofplay / 100 : drawrect.size.width * sizeofplay / 100
        
        let p1 = CGPoint(x: drawrect.origin.x + (drawrect.size.width - playsize) / 2, y: drawrect.origin.y + (drawrect.size.height - playsize) / 2)
        let p2 = CGPoint(x: drawrect.origin.x + (drawrect.size.width - playsize) / 2, y: drawrect.origin.y + drawrect.size.height - (drawrect.size.height - playsize) / 2)
        let p3 = CGPoint(x: drawrect.origin.x + drawrect.size.width - (drawrect.size.width - playsize) / 2, y: drawrect.origin.y + drawrect.size.height / 2)
        
        
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.close()
        
        let play = CAShapeLayer()
        play.fillColor = bordercolor.cgColor
        play.strokeColor = bordercolor.cgColor
        play.lineWidth = borderwidth
        play.path = path.cgPath
        layers.append(play)
        
    }

    
}
