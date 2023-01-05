//
//  UIGarage.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-03.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIGarage: UIPlace {
    private let sizeofwallpadding: CGFloat = 10
    private let sizeofwallwidth: CGFloat = 12
    private let sizeofroofheight: CGFloat = 30
    private let sizeofroofwidth: CGFloat = 3
    
    private let sizeofinnerpadding: CGFloat = 2
    
    private var wallpadding: CGFloat = 0
    private var wallwidth: CGFloat = 0
    private var roofheight: CGFloat = 0
    private var roofwidth: CGFloat = 0
    private var doorwidth: CGFloat = 0
    private var innerpadding: CGFloat = 0
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .garage
        category = .place
    
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .garage
        category = .place
    }
    
    private func setupSize(rect: CGRect) {
        wallpadding = rect.size.width * sizeofwallpadding / 100
        wallwidth = rect.size.width * sizeofwallwidth / 100
        roofheight = rect.size.height * sizeofroofheight / 100
        roofwidth = rect.size.width * sizeofroofwidth / 100
        doorwidth = rect.size.width - 2 * wallpadding - 2 * wallwidth
        innerpadding = rect.size.width * sizeofinnerpadding / 100
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getDoorRect() -> CGRect {
        return CGRect(x: frame.origin.x + wallpadding + wallwidth + innerpadding, y: frame.origin.y + roofheight, width: doorwidth - 2 * innerpadding, height: frame.size.height - roofheight)
    }
    
    func getCarRect() -> CGRect {
        return CGRect(x: frame.origin.x + wallpadding + wallwidth + innerpadding, y: frame.origin.y + roofheight + (frame.size.height - roofheight) / 2, width: doorwidth - 2 * innerpadding, height: (frame.size.height - roofheight) / 2)
    }
    
    override func drawLayers(rect: CGRect) {
        
        setupSize(rect: rect)
        
        layers.removeAll()
        
        let roofpath = UIBezierPath()
        let roof = CAShapeLayer()
        roof.fillColor = backgroundColor?.cgColor
        roof.strokeColor = bordercolor.cgColor
        roof.lineWidth = roofwidth
        roof.lineJoin = kCALineJoinRound
        
        roofpath.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y + roofheight))
        roofpath.addLine(to: CGPoint(x: rect.origin.x + rect.size.width / 2, y: rect.origin.y))
        roofpath.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + roofheight))
        roof.path = roofpath.cgPath
        //layer.addSublayer(roof)
        
        let wallpath = UIBezierPath()
        let wall = CAShapeLayer()
        wall.fillColor = bordercolor.cgColor
        wall.strokeColor = bordercolor.cgColor
        wall.lineWidth = borderwidth
        wall.lineJoin = kCALineJoinRound
        
        let wallpoints = getPointsOfWall(rect: rect, padding: wallpadding, width: wallwidth, roofheight: roofheight, roofwidth: roofwidth)
        wallpath.move(to: wallpoints[0])
        for i in 1..<wallpoints.count {
            wallpath.addLine(to: wallpoints[i])
        }
        wallpath.close()
        wall.path = wallpath.cgPath
        //layer.addSublayer(wall)
        layers.append(roof)
        layers.append(wall)

    }
    
    private func getPointsOfWall(rect: CGRect, padding: CGFloat, width: CGFloat, roofheight: CGFloat, roofwidth: CGFloat) -> [CGPoint] {
        
        
        var points = [CGPoint]()
        
        points.append(CGPoint(x: rect.origin.x + padding, y: rect.origin.y + roofheight))
        points.append(CGPoint(x: rect.origin.x + padding, y: rect.origin.y + rect.size.height))
        points.append(CGPoint(x: rect.origin.x + padding + width, y: rect.origin.y + rect.size.height))
        points.append(CGPoint(x: rect.origin.x + padding + width, y: rect.origin.y + roofheight))
        points.append(CGPoint(x: rect.origin.x + padding + width + doorwidth, y: rect.origin.y + roofheight))
        points.append(CGPoint(x: rect.origin.x + padding + width + doorwidth, y: rect.origin.y + rect.size.height))
        points.append(CGPoint(x: rect.origin.x + rect.size.width - padding, y: rect.origin.y + rect.size.height))
        points.append(CGPoint(x: rect.origin.x + rect.size.width - padding, y: rect.origin.y + roofheight))
        points.append(CGPoint(x: rect.origin.x + padding + width + doorwidth / 2, y: rect.origin.y + 2 * roofwidth))
        
        return points
    }
}
