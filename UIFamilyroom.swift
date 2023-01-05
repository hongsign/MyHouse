//
//  UIFamilyroom.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-09.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIFamilyroom: UIRoom {
    
    private let sizeoftvheight: CGFloat = 50
    private let sizeoftvslope: CGFloat = 20
    private let sizeoftvstandpadding: CGFloat = 15
    private let sizeofmiddlepadding: CGFloat = 15
    private let sizeoffamilyheight: CGFloat = 50
    private let sizeoftoppadding: CGFloat = 35
    private let sizeoflinewidth : CGFloat = 5
    private let sizeoftvlinewidth: CGFloat = 3
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .familyroom
        category = .room
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .familyroom
        category = .room
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        super.drawLayers(rect: rect)
        
        /*---------------------------------------
         simplify (x,y,width,height)
         -----------------------------------------*/
        let w = drawrect.size.width
        let h = drawrect.size.height
        let x = drawrect.origin.x
        let y = drawrect.origin.y
        
        layers.removeAll()
        
        let middlepadding = w * sizeofmiddlepadding / 100
        var tvheight = h * sizeoftvheight / 100
        let tvwidth = w * (100 - sizeofmiddlepadding) / 2 / 100
        tvheight = 3 * tvwidth / 4 > tvheight ? tvheight : 3 * tvwidth / 4
        let tvlinewidth = h * sizeoftvlinewidth / 100
        let tvslope = tvheight * sizeoftvslope / 100
        let tvstandpadding = tvheight * sizeoftvstandpadding / 100
        
        let angle = asin(tvslope / tvwidth)
        let standx1 = x + cos(angle) * tvwidth / 4
        let standy1 = y + tvheight + tvslope - tvwidth / 4 * sin(angle) + tvstandpadding
        let standx2 = x + cos(angle) * 3 * tvwidth / 4
        let standy2 = y + tvheight + tvslope - 3 * tvwidth / 4 * sin(angle) + tvstandpadding
        
        let tvpath = UIBezierPath()
        let tv = CAShapeLayer()
        tv.fillColor = fillcolor.cgColor
        tv.strokeColor = bordercolor.cgColor
        tv.lineWidth = tvlinewidth
        tv.lineJoin = kCALineJoinRound
        tvpath.move(to: CGPoint(x: x, y: y + tvslope))
        tvpath.addLine(to: CGPoint(x: x, y: y + tvslope + tvheight))
        tvpath.addLine(to: CGPoint(x: x + cos(angle) * tvwidth, y: y + tvheight))
        tvpath.addLine(to: CGPoint(x: x + cos(angle) * tvwidth, y: y))
        tvpath.close()
        tv.path = tvpath.cgPath
        layers.append(tv)
        
        let path = UIBezierPath()
        let stand = CAShapeLayer()
        stand.fillColor = bordercolor.cgColor
        stand.strokeColor = bordercolor.cgColor
        stand.lineWidth = tvlinewidth
        path.move(to: CGPoint(x: standx1, y: standy1))
        path.addLine(to: CGPoint(x: standx2, y: standy2))
        stand.path = path.cgPath
        layers.append(stand)
        
        
        let familyheight = h * sizeoffamilyheight / 100
        let familywidth = tvwidth
        let length = familyheight > familywidth ? familywidth : familyheight
        let linewidth = h * sizeoflinewidth / 100
        let toppadding = h * sizeoftoppadding / 100
        
        let familyx = x + w / 2 + middlepadding / 2
        let familyy = y + toppadding
        
        let parentheadradius = 5 * length / 12 / 2
        let kidheadradius = 2 * parentheadradius / 3
        let parentbodyradius = length / 2 / 2
        let kidbodyraidus = 2 * parentbodyradius / 3
        let bodystartangle = 7 * CGFloat.pi / 6
        let bodayendangle = 11 * CGFloat.pi / 6
        
        let kidheadrect = CGRect(x: familyx + length / 2 - kidheadradius, y: familyy + 2 * parentheadradius, width: 2 * kidheadradius, height: 2 * kidheadradius)
        let kidbodycenter = CGPoint(x: familyx + length / 2, y: familyy + 2 * parentheadradius + 2 * kidheadradius + linewidth / 2 + kidbodyraidus)
        
        let head1 = CAShapeLayer()
        head1.fillColor = backgroundColor?.cgColor
        head1.strokeColor = bordercolor.cgColor
        head1.lineWidth = borderwidth
        head1.path = UIBezierPath(ovalIn: CGRect(x: familyx + length / 12, y: familyy, width: 2 * parentheadradius, height: 2 * parentheadradius)).cgPath
        layers.append(head1)
        
        let head2 = CAShapeLayer()
        head2.fillColor = backgroundColor?.cgColor
        head2.strokeColor = bordercolor.cgColor
        head2.lineWidth = borderwidth
        head2.path = UIBezierPath(ovalIn: CGRect(x: familyx + 7 * length / 12, y: familyy, width: 2 * parentheadradius, height: 2 * parentheadradius)).cgPath
        layers.append(head2)
        
        let body1 = CAShapeLayer()
        body1.fillColor = backgroundColor?.cgColor
        body1.strokeColor = bordercolor.cgColor
        body1.lineWidth = borderwidth
        body1.path = UIBezierPath(arcCenter: CGPoint(x: familyx + length / 2 / 2, y: familyy + 2 * parentheadradius + linewidth + parentbodyradius), radius: parentbodyradius, startAngle: bodystartangle, endAngle: bodayendangle, clockwise: true).cgPath
        layers.append(body1)
        
        let body2 = CAShapeLayer()
        body2.fillColor = backgroundColor?.cgColor
        body2.strokeColor = bordercolor.cgColor
        body2.lineWidth = borderwidth
        body2.path = UIBezierPath(arcCenter: CGPoint(x: familyx + 3 * length / 2 / 2 + length / 12, y: familyy + 2 * parentheadradius + linewidth + parentbodyradius), radius: parentbodyradius, startAngle: bodystartangle, endAngle: bodayendangle, clockwise: true).cgPath
        layers.append(body2)
        
        let kidhead = CAShapeLayer()
        kidhead.fillColor = backgroundColor?.cgColor
        kidhead.strokeColor = bordercolor.cgColor
        kidhead.lineWidth = borderwidth
        kidhead.path = UIBezierPath(ovalIn: kidheadrect).cgPath
        layers.append(kidhead)
        
        let kidbody = CAShapeLayer()
        kidbody.fillColor = backgroundColor?.cgColor
        kidbody.strokeColor = bordercolor.cgColor
        kidbody.lineWidth = borderwidth
        kidbody.path = UIBezierPath(arcCenter: kidbodycenter, radius: kidbodyraidus, startAngle: bodystartangle, endAngle: bodayendangle, clockwise: true).cgPath
        layers.append(kidbody)
        
    }

    
}
