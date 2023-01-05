//
//  UIKitchen.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-09.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIKitchen: UIRoom {
    
    private let sizeofwidthofheight: CGFloat = 70
    private let sizeoftopheight: CGFloat = 60
    private let sizeofbottomheight: CGFloat = 40
    private let sizeofcabwidth: CGFloat = 50
    private let sizeoflinewidth: CGFloat = 5
    
    private let sizeofcookwareheight: CGFloat = 50
    private let sizeofcookwarewidth: CGFloat = 40
    private let sizeofcookwarepad: CGFloat = 30
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .kitchen
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .kitchen
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        /*---------------------------------------
         calculate ratio of height and width
         -----------------------------------------*/
        var w = drawrect.size.height * sizeofwidthofheight / 100
        w = w > drawrect.size.width ? drawrect.size.width : w
        let h = drawrect.size.height
        let x = drawrect.origin.x + (drawrect.size.width - w) / 2
        let y = drawrect.origin.y
        
        layers.removeAll()
        
        let linewidth = w * sizeoflinewidth / 100
        let topheight = h * sizeoftopheight / 100
        let bottomheight = h * sizeofbottomheight / 100 - linewidth
        let cabwidth = w * sizeofcabwidth / 100
        let cornerradius = cabwidth * 5 / 100
        
        let cookwareheight = topheight * sizeofcookwareheight / 100
        let cookwarewidth = cabwidth * sizeofcookwarewidth / 100
        let cookwarepadlength = cookwareheight * sizeofcookwarepad / 100
        let cookwareradius = cookwareheight - cookwarepadlength > cookwarewidth ? cookwarewidth / 2 : (cookwareheight - cookwarepadlength) / 2
        
        let ovenpadding = bottomheight * 10 / 100
        let ovendoorheight = bottomheight * 40 / 100
        let ovenbuttonradius = cabwidth * 5 / 100
        
        let path = UIBezierPath()
        
        let cookwarepad = CAShapeLayer()
        cookwarepad.fillColor = bordercolor.cgColor
        cookwarepad.strokeColor = bordercolor.cgColor
        cookwarepad.lineWidth = linewidth
        path.move(to: CGPoint(x: x + cabwidth / 2, y: y + (topheight - cookwareheight) / 2))
        path.addLine(to: CGPoint(x: x + cabwidth / 2, y: y + (topheight - cookwareheight) / 2 + cookwarepadlength))
        cookwarepad.path = path.cgPath
        layers.append(cookwarepad)
        
        let cookware = CAShapeLayer()
        cookware.fillColor = backgroundColor?.cgColor
        cookware.strokeColor = bordercolor.cgColor
        cookware.lineWidth = linewidth
        cookware.path = UIBezierPath(ovalIn: CGRect(x: x + (cabwidth - 2 * cookwareradius) / 2, y: y + (topheight - cookwareheight) / 2 + cookwarepadlength , width: 2 * cookwareradius, height: 2 * cookwareradius)).cgPath
        layers.append(cookware)
        
        let ovenframe = CAShapeLayer()
        ovenframe.fillColor = backgroundColor?.cgColor
        ovenframe.strokeColor = bordercolor.cgColor
        ovenframe.lineWidth = linewidth
        ovenframe.path = UIBezierPath(roundedRect: CGRect(x: x, y: y + topheight + linewidth, width: cabwidth, height: bottomheight), cornerRadius: cornerradius).cgPath
        layers.append(ovenframe)
        
        let initi: CGFloat = -5
        for i in 0..<3 {
            let n = CGFloat(i)
            let ovenbutton = CAShapeLayer()
            ovenbutton.fillColor = fillcolor.cgColor
            ovenbutton.strokeColor = bordercolor.cgColor
            ovenbutton.lineWidth = linewidth
            ovenbutton.path = UIBezierPath(ovalIn: CGRect(x: x + cabwidth / 2 + (4 * n + initi) * ovenbuttonradius, y: y + topheight + linewidth + ovenpadding, width: 2 * ovenbuttonradius, height: 2 * ovenbuttonradius)).cgPath
            layers.append(ovenbutton)
        }
        
        let ovendoor = CAShapeLayer()
        ovendoor.fillColor = fillcolor.cgColor
        ovendoor.strokeColor = bordercolor.cgColor
        ovendoor.lineWidth = linewidth
        ovendoor.path = UIBezierPath(roundedRect: CGRect(x: x + ovenpadding, y: y + topheight + linewidth + bottomheight - ovenpadding - ovendoorheight, width: cabwidth - 2 * ovenpadding, height: ovendoorheight), cornerRadius: cornerradius).cgPath
        layers.append(ovendoor)
        
        let toprefri = CAShapeLayer()
        toprefri.fillColor = backgroundColor?.cgColor
        toprefri.strokeColor = bordercolor.cgColor
        toprefri.lineWidth = linewidth
        toprefri.path = UIBezierPath(roundedRect: CGRect(x: x + cabwidth + linewidth, y: y, width: cabwidth, height: topheight), cornerRadius: cornerradius).cgPath
        layers.append(toprefri)
        
        let bottomrefri = CAShapeLayer()
        bottomrefri.fillColor = backgroundColor?.cgColor
        bottomrefri.strokeColor = bordercolor.cgColor
        bottomrefri.lineWidth = linewidth
        bottomrefri.path = UIBezierPath(roundedRect: CGRect(x: x + cabwidth + linewidth, y: y + topheight + linewidth, width: cabwidth, height: bottomheight), cornerRadius: cornerradius).cgPath
        layers.append(bottomrefri)
        
        let handle1 = CAShapeLayer()
        handle1.fillColor = backgroundColor?.cgColor
        handle1.strokeColor = bordercolor.cgColor
        handle1.lineWidth = linewidth
        path.move(to: CGPoint(x: x + cabwidth + 3 * linewidth, y: y + topheight - 4 * linewidth))
        path.addLine(to: CGPoint(x: x + cabwidth + 3 * linewidth, y: y + topheight - 2 * linewidth))
        handle1.path = path.cgPath
        layers.append(handle1)
        
        let handle2 = CAShapeLayer()
        handle2.fillColor = backgroundColor?.cgColor
        handle2.strokeColor = bordercolor.cgColor
        handle2.lineWidth = linewidth
        path.move(to: CGPoint(x: x + cabwidth + 3 * linewidth, y: y + topheight + linewidth + 4 * linewidth))
        path.addLine(to: CGPoint(x: x + cabwidth + 3 * linewidth, y: y + topheight + linewidth + 2 * linewidth))
        handle2.path = path.cgPath
        layers.append(handle2)
        
    }

    
}
