//
//  UICar.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-03.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UICar: UIHouseViewBase {
    
    private let sizeofbase: CGFloat = 50
    private let sizeoftire: CGFloat = 16
    private let sizeofframe: CGFloat = 34
    
    private let sizeofframepadding: CGFloat = 8
    //private let sizeofframeborder: CGFloat = 5
    
    private let sizeoflightradius: CGFloat = 7
    
    var _lightcolor: UIColor = .white
    var lightcolor: UIColor {
        get { return _lightcolor }
        set(newvalue) {
            if newvalue != _lightcolor {
                _lightcolor = newvalue
                reDisplay()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .car
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .car
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        layers.removeAll()
        
        let padding = rect.size.width * sizeofframepadding / 100
        let basecornerradius = padding
        let lightradius = rect.size.width * sizeoflightradius / 100
        //let frameborderwidth = rect.size.width * sizeofframeborder / 100
        
        let heightofbase = rect.size.height * sizeofbase / 100
        let heightofframe = rect.size.height * sizeofframe / 100
        let heightoftire = rect.size.height * sizeoftire / 100
        let tirecurve = heightoftire / 3
        let tirewidth = 2 * lightradius
        let yoftire = rect.origin.y + heightofframe + heightofbase
        let xoffsetoftire = rect.size.width - 2 * padding - tirewidth
        let centerpointoflight = CGPoint(x: rect.origin.x + padding + lightradius, y: rect.origin.y + heightofframe + padding + lightradius)
        let centerpointoflight2 = CGPoint(x: rect.origin.x + padding + lightradius + xoffsetoftire, y: rect.origin.y + heightofframe + padding + lightradius)
        
        let base = CAShapeLayer()
        base.fillColor = fillcolor.cgColor
        base.strokeColor = bordercolor.cgColor
        base.lineWidth = borderwidth
        base.lineJoin = kCALineJoinRound
        base.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x, y: rect.origin.y + heightofframe, width: rect.size.width, height: heightofbase), cornerRadius: basecornerradius).cgPath
        //layer.addSublayer(base)
        layers.append(base)
        
        let path = UIBezierPath()
        let carframe = CAShapeLayer()
        carframe.fillColor = backgroundColor?.cgColor
        carframe.strokeColor = bordercolor.cgColor
        carframe.lineWidth = borderwidth //frameborderwidth
        carframe.lineJoin = kCALineJoinRound
        path.move(to: CGPoint(x: rect.origin.x + padding, y: rect.origin.y + heightofframe))
        path.addLine(to: CGPoint(x: rect.origin.x + padding + 2 * lightradius, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width - padding - 2 * lightradius, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width - padding, y: rect.origin.y + heightofframe))
        carframe.path = path.cgPath
        //layer.addSublayer(carframe)
        layers.append(carframe)
        
        let tirepath = UIBezierPath()
        let tire = CAShapeLayer()
        tire.fillColor = bordercolor.cgColor
        tire.borderColor = bordercolor.cgColor
        tire.lineWidth = borderwidth
        tire.lineJoin = kCALineJoinRound
        tirepath.move(to: CGPoint(x: rect.origin.x + padding, y: yoftire))
        tirepath.addLine(to: CGPoint(x: rect.origin.x + padding, y: yoftire + heightoftire - tirecurve))
        tirepath.addCurve(to: CGPoint(x: rect.origin.x + padding + tirewidth, y: yoftire + heightoftire - tirecurve), controlPoint1: CGPoint(x: rect.origin.x + padding + tirewidth / 4, y: yoftire + heightoftire - tirecurve/2), controlPoint2: CGPoint(x: rect.origin.x + padding + 3 * tirewidth / 4, y: yoftire + heightoftire - tirecurve/2))
        tirepath.addLine(to: CGPoint(x: rect.origin.x + padding + tirewidth, y: yoftire))
        tirepath.close()
        tire.path = tirepath.cgPath
        //layer.addSublayer(tire)
        layers.append(tire)
        
        tirepath.move(to: CGPoint(x: rect.origin.x + padding + xoffsetoftire, y: yoftire))
        tirepath.addLine(to: CGPoint(x: rect.origin.x + padding + xoffsetoftire, y: yoftire + heightoftire - tirecurve))
        tirepath.addCurve(to: CGPoint(x: rect.origin.x + padding + tirewidth + xoffsetoftire, y: yoftire + heightoftire - tirecurve), controlPoint1: CGPoint(x: rect.origin.x + padding + tirewidth / 4 + xoffsetoftire, y: yoftire + heightoftire - tirecurve/2), controlPoint2: CGPoint(x: rect.origin.x + padding + 3 * tirewidth / 4 + xoffsetoftire, y: yoftire + heightoftire - tirecurve/2))
        tirepath.addLine(to: CGPoint(x: rect.origin.x + padding + tirewidth + xoffsetoftire, y: yoftire))
        tirepath.close()
        tire.path = tirepath.cgPath
        //layer.addSublayer(tire)
        layers.append(tire)
        
        let light1 = CAShapeLayer()
        light1.fillColor = lightcolor.cgColor
        light1.strokeColor = bordercolor.cgColor
        light1.lineWidth = borderwidth
        light1.path = UIBezierPath(arcCenter: centerpointoflight, radius: lightradius, startAngle: CGFloat.pi * 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        //layer.addSublayer(light1)
        layers.append(light1)
        
        let light2 = CAShapeLayer()
        light2.fillColor = lightcolor.cgColor
        light2.strokeColor = bordercolor.cgColor
        light2.lineWidth = borderwidth
        light2.path = UIBezierPath(arcCenter: centerpointoflight2, radius: lightradius, startAngle: CGFloat.pi * 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        //layer.addSublayer(light2)
        layers.append(light2)
        
        let ventpath = UIBezierPath()
        let vent = CAShapeLayer()
        vent.fillColor = lightcolor.cgColor
        vent.strokeColor = bordercolor.cgColor
        vent.lineWidth = lightradius
        ventpath.move(to: CGPoint(x: centerpointoflight.x + 3 * lightradius, y: centerpointoflight.y + lightradius))
        ventpath.addLine(to: CGPoint(x: centerpointoflight2.x - 3 * lightradius, y: centerpointoflight2.y + lightradius))
        vent.path = ventpath.cgPath
        //layer.addSublayer(vent)
        layers.append(vent)
    }
    
}
