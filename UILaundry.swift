//
//  UILaundry.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-09.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UILaundry: UIRoom {
    
    private let sizeofdevwidth: CGFloat = 70
    private let sizeofdevheight: CGFloat = 100
    
    private let sizeofcontrolpadheight: CGFloat = 15
    private let sizeofstorageheight: CGFloat = 10
    private let sizeofcontrolbuttonradius: CGFloat = 5 / 2
    
    private let sizeofoutterradius: CGFloat = 30 / 2
    private let sizeofinnerradius: CGFloat = 20 / 2
    
    private let sizeofborderwidth: CGFloat = 4
    private let sizeofpadborderwidth: CGFloat = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .laundry
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .laundry
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
        
        layers.removeAll()
        
        let devwidth = drawrect.size.width * sizeofdevwidth / 100
        let devheight = drawrect.size.height * sizeofdevheight / 100
        let controlpadheight = drawrect.size.height * sizeofcontrolpadheight / 100
        let controlpadbuttonradius = drawrect.size.height * sizeofcontrolbuttonradius / 100
        let storageheight = drawrect.size.height * sizeofstorageheight / 100
        let outterradius = drawrect.size.height * sizeofoutterradius / 100
        let innerradius = drawrect.size.height * sizeofinnerradius / 100
        let outterborderwidth = drawrect.size.height * sizeofborderwidth / 100
        let innerborderwidth = drawrect.size.height * sizeofpadborderwidth / 100
        let cornerradius = devwidth * 5 / 100
        
        let x = drawrect.origin.x + (drawrect.size.width - devwidth) / 2
        let y = drawrect.origin.y + (drawrect.size.height - devheight) / 2
        
        let frame = CAShapeLayer()
        frame.fillColor = backgroundColor?.cgColor
        frame.strokeColor = bordercolor.cgColor
        frame.lineWidth = outterborderwidth
        frame.path = UIBezierPath(roundedRect: CGRect(x: x, y: y, width: devwidth, height: devheight), cornerRadius: cornerradius).cgPath
        layers.append(frame)
        
        let path = UIBezierPath()
        let padline = CAShapeLayer()
        padline.fillColor = backgroundColor?.cgColor
        padline.strokeColor = bordercolor.cgColor
        padline.lineWidth = innerborderwidth
        path.move(to: CGPoint(x: x, y: y + controlpadheight))
        path.addLine(to: CGPoint(x: x + devwidth, y: y + controlpadheight))
        padline.path = path.cgPath
        layers.append(padline)
        
        let button1 = CAShapeLayer()
        button1.fillColor = fillcolor.cgColor
        button1.strokeColor = bordercolor.cgColor
        button1.lineWidth = borderwidth
        button1.path = UIBezierPath(ovalIn: CGRect(x: x + devwidth - 5 * 2 * controlpadbuttonradius, y: y + (controlpadheight - 2 * controlpadbuttonradius) / 2, width: 2 * controlpadbuttonradius, height: 2 * controlpadbuttonradius)).cgPath
        layers.append(button1)
        
        let button2 = CAShapeLayer()
        button2.fillColor = fillcolor.cgColor
        button2.strokeColor = bordercolor.cgColor
        button2.lineWidth = borderwidth
        button2.path = UIBezierPath(ovalIn: CGRect(x: x + devwidth - 3 * 2 * controlpadbuttonradius, y: y + (controlpadheight - 2 * controlpadbuttonradius) / 2, width: 2 * controlpadbuttonradius, height: 2 * controlpadbuttonradius)).cgPath
        layers.append(button2)
        
        let storageline = CAShapeLayer()
        storageline.fillColor = backgroundColor?.cgColor
        storageline.strokeColor = bordercolor.cgColor
        storageline.lineWidth = innerborderwidth
        path.move(to: CGPoint(x: x, y: y + devheight - storageheight))
        path.addLine(to: CGPoint(x: x + devwidth, y: y + devheight - storageheight))
        padline.path = path.cgPath
        layers.append(storageline)
        
        let outercircle = CAShapeLayer()
        outercircle.fillColor = backgroundColor?.cgColor
        outercircle.strokeColor = bordercolor.cgColor
        outercircle.lineWidth = outterborderwidth
        outercircle.path = UIBezierPath(ovalIn: CGRect(x: x + (devwidth - 2 * outterradius) / 2, y: y + (devheight - 2 * outterradius) / 2, width: 2 * outterradius, height: 2 * outterradius)).cgPath
        layers.append(outercircle)
        
        let innercircle = CAShapeLayer()
        innercircle.fillColor = backgroundColor?.cgColor
        innercircle.strokeColor = bordercolor.cgColor
        innercircle.lineWidth = innerborderwidth
        innercircle.path = UIBezierPath(ovalIn: CGRect(x: x + (devwidth - 2 * innerradius) / 2, y: y + (devheight - 2 * innerradius) / 2, width: 2 * innerradius, height: 2 * innerradius)).cgPath
        layers.append(innercircle)
    }

    
}
