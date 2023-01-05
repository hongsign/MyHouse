//
//  UIDoor.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-01.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIDoor: UIHouseViewBase {
    
    enum DoorState: String {
        case close
        case open
        case halfopen
    }
    
    enum UIDoorType: String {
        case normal
        case easy
    }
    
    var _doorstate: DoorState = .close
    var doorstate: DoorState {
        get { return _doorstate }
        set(newvalue) {
            _doorstate = newvalue
            reDisplay()
        }
    }
    
    var _doortype: UIDoorType = .normal
    var doortype: UIDoorType {
        get { return _doortype }
        set(newvalue) {
            if newvalue != _doortype {
                _doortype = newvalue
                reDisplay()
            }
        }
    }
    
    var _innercolor: UIColor = .white
    var innercolor: UIColor {
        get { return _innercolor }
        set(newvalue) {
            _innercolor = newvalue
            reDisplay()
        }
    }

    
    private let sizeofframe: CGFloat = 2
    private let sizeofpadding: CGFloat = 3
    private let sizeofopenshift: CGFloat = 10
    private let positionoftophinge: CGFloat = 33
    private let positionofbottomhinge: CGFloat = 66
    private let sizeofnodwidth: CGFloat = 1
    private let sizeofnodheight: CGFloat = 6
    private let positionofnodhorizontal: CGFloat = 15
    private let positionofnodvertical: CGFloat = 48
    
    private let sizeofesaydoorwidth: CGFloat = 70
    private let sizeofeasydoorarrowwidth: CGFloat = 50
    private let sizeofeasydoorarrowheight: CGFloat = 35
    private let sizeofeasydoorlinewidth: CGFloat = 7
    private let sizeofeasydoorarrowheadwidth: CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .door
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .door
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawLayers(rect: CGRect) {
        
        layers.removeAll()
        
        let x = rect.origin.x
        let y = rect.origin.y
        let w = rect.size.width
        let h = rect.size.height
        
        switch doortype {
        case .easy:
            let doorwidth = w * sizeofesaydoorwidth / 100
            let arrowwidth = w * sizeofeasydoorarrowwidth / 100
            let arrowheight = h * sizeofeasydoorarrowheight / 100
            let arrowheadwidth = arrowwidth * sizeofeasydoorarrowheadwidth / 100
            let linewidth = w * sizeofeasydoorlinewidth / 100
            
            let door = CAShapeLayer()
            let doorpath = UIBezierPath()
            doorpath.move(to: CGPoint(x: x + (w - doorwidth), y: y + h - (h - arrowheight) / 2))
            doorpath.addLine(to: CGPoint(x: x + (w - doorwidth), y: y + h))
            doorpath.addLine(to: CGPoint(x: x + w, y: y + h))
            doorpath.addLine(to: CGPoint(x: x + w, y: y))
            doorpath.addLine(to: CGPoint(x: x + (w - doorwidth), y: y))
            doorpath.addLine(to: CGPoint(x: x + (w - doorwidth), y: y + (h - arrowheight) / 2))
            door.fillColor = UIColor.clear.cgColor
            door.strokeColor = bordercolor.cgColor
            door.lineWidth = linewidth
            door.lineJoin = kCALineJoinRound
            door.path = doorpath.cgPath
            layers.append(door)
            
            let arrow = CAShapeLayer()
            let arrowpath = UIBezierPath()
            arrowpath.move(to: CGPoint(x: x, y: y + (h - arrowheight) / 2 + arrowheight / 4))
            arrowpath.addLine(to: CGPoint(x: x, y: y + (h - arrowheight) / 2 + 3 * arrowheight / 4))
            arrowpath.addLine(to: CGPoint(x: x + (arrowwidth - arrowheadwidth), y: y + (h - arrowheight) / 2 + 3 * arrowheight / 4))
            arrowpath.addLine(to: CGPoint(x: x + (arrowwidth - arrowheadwidth), y: y + (h - arrowheight) / 2 + arrowheight))
            arrowpath.addLine(to: CGPoint(x: x + arrowwidth, y: y + (h - arrowheight) / 2 + arrowheight / 2))
            arrowpath.addLine(to: CGPoint(x: x + (arrowwidth - arrowheadwidth), y: y + (h - arrowheight) / 2))
            arrowpath.addLine(to: CGPoint(x: x + (arrowwidth - arrowheadwidth), y: y + (h - arrowheight) / 2 + arrowheight / 4))
            arrowpath.close()
            arrow.fillColor = fillcolor.cgColor
            arrow.strokeColor = bordercolor.cgColor
            arrow.lineWidth = borderwidth
            arrow.lineJoin = kCALineJoinRound
            arrow.path = arrowpath.cgPath
            layers.append(arrow)
            
        case .normal:
        let framewidth = rect.size.width * sizeofframe / 100
        let paddingwidth = rect.size.width * sizeofpadding / 100
        let openshift = rect.size.width * sizeofopenshift / 100
        let doorwidth = (rect.size.width - 2 * framewidth - 3 * paddingwidth) / 2
        let doorheight = rect.size.height - framewidth - 2 * paddingwidth
        let nodwidth = doorwidth * sizeofnodwidth / 100
        let nodheight = doorheight * sizeofnodheight / 100
        let nodshifthorizontal = doorwidth * positionofnodhorizontal / 100
        let nodshiftvertical = doorheight * positionofnodvertical / 100
        let leftdoorx = rect.origin.x + framewidth + paddingwidth
        let leftdoory = rect.origin.y + framewidth + paddingwidth
        let rightdoorx = rect.origin.x + framewidth + 2 * paddingwidth + doorwidth
        let rightdoory = rect.origin.y + framewidth + paddingwidth
        
        let doorframe = CAShapeLayer()
        doorframe.fillColor = innercolor.cgColor //fillcolor.cgColor
        doorframe.strokeColor = bordercolor.cgColor
        doorframe.lineWidth = framewidth
        doorframe.lineJoin = kCALineJoinMiter
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y + rect.size.height))
        path.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height))
        doorframe.path = path.cgPath
        //layer.addSublayer(doorframe)
        
        
        let leftdoor = CAShapeLayer()
        leftdoor.fillColor = fillcolor.cgColor
        leftdoor.strokeColor = bordercolor.cgColor
        leftdoor.lineWidth = borderwidth
        leftdoor.lineJoin = kCALineJoinMiter
        if doorstate == .close || doorstate == .halfopen {
            leftdoor.path = UIBezierPath(rect: CGRect(x: leftdoorx, y: leftdoory, width: doorwidth, height: doorheight)).cgPath
        }
        else if doorstate == .open {
            let leftdoorpath = UIBezierPath()
            leftdoorpath.move(to: CGPoint(x: leftdoorx, y: leftdoory))
            leftdoorpath.addLine(to: CGPoint(x: leftdoorx + doorwidth - openshift, y: leftdoory + openshift))
            leftdoorpath.addLine(to: CGPoint(x: leftdoorx + doorwidth - openshift, y: leftdoory + doorheight - openshift))
            leftdoorpath.addLine(to: CGPoint(x: leftdoorx, y: leftdoory + doorheight))
            leftdoorpath.close()
            leftdoor.path = leftdoorpath.cgPath
        }
        //layer.addSublayer(leftdoor)
        
        let rightdoor = CAShapeLayer()
        rightdoor.fillColor = fillcolor.cgColor
        rightdoor.strokeColor = bordercolor.cgColor
        rightdoor.lineWidth = borderwidth
        rightdoor.lineJoin = kCALineJoinMiter
        if doorstate == .close {
            rightdoor.path = UIBezierPath(rect: CGRect(x: rightdoorx, y: rightdoory, width: doorwidth, height: doorheight)).cgPath
        }
        else if doorstate == .open || doorstate == .halfopen {
            let rightdoorpath = UIBezierPath()
            rightdoorpath.move(to: CGPoint(x: rightdoorx + openshift, y: rightdoory + openshift))
            rightdoorpath.addLine(to: CGPoint(x: rightdoorx + openshift, y: rightdoory + doorheight - openshift))
            rightdoorpath.addLine(to: CGPoint(x: rightdoorx + doorwidth, y: rightdoory + doorheight))
            rightdoorpath.addLine(to: CGPoint(x: rightdoorx + doorwidth, y: rightdoory))
            rightdoorpath.close()
            rightdoor.path = rightdoorpath.cgPath
        }
        //layer.addSublayer(rightdoor)
        
        let leftnod = CAShapeLayer()
        leftnod.fillColor = innercolor.cgColor
        leftnod.strokeColor = innercolor.cgColor
        leftnod.lineWidth = nodwidth
        let leftnodpath = UIBezierPath()
        var startpoint: CGPoint = .zero
        var endpoint: CGPoint = .zero
        if doorstate == .close || doorstate == .halfopen {
            startpoint.x = leftdoorx + doorwidth - nodshifthorizontal
            startpoint.y = leftdoory + nodshiftvertical
            endpoint.x = startpoint.x
            endpoint.y = startpoint.y + nodheight
        }
        else if doorstate == .open {
            startpoint.x = leftdoorx + doorwidth - openshift - nodshifthorizontal
            startpoint.y = leftdoory + nodshiftvertical
            endpoint.x = startpoint.x
            endpoint.y = startpoint.y + nodheight
        }
        leftnodpath.move(to: startpoint)
        leftnodpath.addLine(to: endpoint)
        leftnod.path = leftnodpath.cgPath
        //layer.addSublayer(leftnod)

        let rightnod = CAShapeLayer()
        rightnod.fillColor = innercolor.cgColor
        rightnod.strokeColor = innercolor.cgColor
        rightnod.lineWidth = nodwidth
        let rightnodpath = UIBezierPath()
        if doorstate == .close {
            startpoint.x = rightdoorx + nodshifthorizontal
            startpoint.y = rightdoory + nodshiftvertical
            endpoint.x = startpoint.x
            endpoint.y = startpoint.y + nodheight
        }
        else if doorstate == .open || doorstate == .halfopen {
            startpoint.x = rightdoorx + openshift + nodshifthorizontal
            startpoint.y = rightdoory + nodshiftvertical
            endpoint.x = startpoint.x
            endpoint.y = startpoint.y + nodheight
        }
        rightnodpath.move(to: startpoint)
        rightnodpath.addLine(to: endpoint)
        rightnod.path = rightnodpath.cgPath
        //layer.addSublayer(rightnod)

        layers.append(doorframe)
        layers.append(leftdoor)
        layers.append(rightdoor)
        layers.append(leftnod)
        layers.append(rightnod)
        } //end of switch
        
    }
    
}
