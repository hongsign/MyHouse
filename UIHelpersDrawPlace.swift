//
//  UIHelpersDrawPlace.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-16.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawPlace: UIHelpers {
    
    enum UIPlaceType: String {
        case elevator
        case stair
        case balcony
        case pool
    }
    
    func drawPlace(type: UIPlaceType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        switch type {
        case .elevator:
            return drawElevator(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, bgcolor: bgcolor, borderwidth: borderwidth)
        case .stair:
            return drawStair(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, bgcolor: bgcolor, borderwidth: borderwidth, numberofsteps: 10, numberofpoles: 3)
        case .balcony:
            return drawBalcony(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, bgcolor: bgcolor, borderwidth: borderwidth)
        case .pool:
            return drawPool(rect: rect, strokecolor: strokecolor, bgcolor: bgcolor, borderwidth: borderwidth)
        }
        
    }
    
    private func drawElevator(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        let sizeofdoorwidth: CGFloat = 80
        let sizeofbuttonwidth: CGFloat = 12
        let sizeofbuttonheight: CGFloat = 15
        let sizeoftopheight: CGFloat = 20
        let sizeoftopwidthofdoor : CGFloat = 40
        let sizeofpadding: CGFloat = 4
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        if w > h {
            x = x + (w - h) / 2
            w = h
        }
        else {
            y = y + (h - w) / 2
            h = w
        }
        
        let doorwidth = w * sizeofdoorwidth / 100
        let buttonwidth = w * sizeofbuttonwidth / 100
        let buttonheight = h * sizeofbuttonheight / 100
        let topheight = h * sizeoftopheight / 100
        let topwidth = doorwidth * sizeoftopwidthofdoor / 100
        let padding = h * sizeofpadding / 100
        let buttonpadding = (w - doorwidth - buttonwidth) / 2
        
        let elevator = CAShapeLayer()
        let door = CAShapeLayer()
        let path = UIBezierPath()
        path.append(UIBezierPath(rect: CGRect(x: x, y: y + topheight, width: doorwidth / 2, height: h - topheight)))
        path.append(UIBezierPath(rect: CGRect(x: x + doorwidth / 2, y: y + topheight, width: doorwidth / 2, height: h - topheight)))
        path.append(UIBezierPath(rect: CGRect(x: x + (doorwidth - topwidth) / 2, y: y + padding, width: topwidth, height: topheight - 2 * padding)))
        door.fillColor = bgcolor.cgColor
        door.strokeColor = strokecolor.cgColor
        door.lineWidth = borderwidth
        door.lineJoin = kCALineJoinRound
        door.path = path.cgPath
        elevator.addSublayer(door)
        
        let button = CAShapeLayer()
        let buttonpath = UIBezierPath()
        let button1 = UIBezierPath()
        button1.move(to: CGPoint(x: x + doorwidth + buttonpadding + buttonwidth / 2, y: y + h / 2 - padding - buttonheight))
        button1.addLine(to: CGPoint(x: x + doorwidth + buttonpadding, y: y + h / 2 - padding))
        button1.addLine(to: CGPoint(x: x + doorwidth + buttonpadding + buttonwidth, y: y + h / 2 - padding))
        button1.close()
        let button2 = UIBezierPath()
        button2.move(to: CGPoint(x: x + doorwidth + buttonpadding + buttonwidth / 2, y: y + h / 2 + padding + buttonheight))
        button2.addLine(to: CGPoint(x: x + doorwidth + buttonpadding, y: y + h / 2 + padding))
        button2.addLine(to: CGPoint(x: x + doorwidth + buttonpadding + buttonwidth, y: y + h / 2 + padding))
        button2.close()
        buttonpath.append(button1)
        buttonpath.append(button2)
        button.fillColor = fillcolor.cgColor
        button.strokeColor = strokecolor.cgColor
        button.lineWidth = borderwidth
        button.lineJoin = kCALineJoinRound
        button.path = buttonpath.cgPath
        elevator.addSublayer(button)
        
        return elevator
        
    }
    
    private func drawStair(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat, numberofsteps: Int, numberofpoles: Int) -> CAShapeLayer {
        
        
        let sizeofwidthofheight: CGFloat = 60
        let sizeofstepoverlap: CGFloat = 35
        let sizeoftopareaofheight: CGFloat = 40
        
        let sizeofstepareaheight: CGFloat = 70
        let sizeofstepwidth: CGFloat = 30
        let sizeofstepheightofwidth: CGFloat = 40
        let sizeofstepcornerradiusofheight: CGFloat = 5
        let sizeofpadding: CGFloat = 3
        let sizeofpolewidthofstepheight: CGFloat = 50
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        let width = h * sizeofwidthofheight / 100
        if width > w {
            h = w * 100 / sizeofwidthofheight
            y = y + (rect.size.height - h) / 2
        }
        else {
            x = x + (w - width) / 2
            w = width
        }
        
        let padding = h * sizeofpadding / 100
        let stepwidth = w * sizeofstepwidth / 100
        let stepheight = stepwidth * sizeofstepheightofwidth / 100
        let polewidth = stepheight * sizeofpolewidthofstepheight / 100
        let stepoverlap = stepwidth * sizeofstepoverlap / 100
        let stepcornerradius = stepheight * sizeofstepcornerradiusofheight / 100
        
        var stepareaheight = h * sizeofstepareaheight / 100
        
        var edge: CGFloat = 0
        var numberofsteps: Int = numberofsteps
        for i in 0..<numberofsteps {
            
            let n = CGFloat(i)
            edge = stepwidth + n * stepoverlap
            if edge > w {
                numberofsteps = i + 1
                break
            }
            
        }
        
        stepareaheight = CGFloat(numberofsteps) * stepheight
        let stepareawidth = stepwidth + stepoverlap * CGFloat(numberofsteps)
        let topareaheight = stepareaheight * sizeoftopareaofheight / 100
        
        let stair = CAShapeLayer()
        let steps = CAShapeLayer()
        let steppath = UIBezierPath()
        for i in 0..<numberofsteps {
            let n = CGFloat(i)
            let r = CGRect(x: x + n * stepoverlap, y: y + h - n * stepheight, width: stepwidth, height: stepheight)
            steppath.append(UIBezierPath(roundedRect: r, cornerRadius: stepcornerradius))
        }
        steps.fillColor = fillcolor.cgColor
        steps.strokeColor = strokecolor.cgColor
        steps.lineWidth = borderwidth
        steps.path = steppath.cgPath
        stair.addSublayer(steps)
        
        let poles = CAShapeLayer()
        let polepath = UIBezierPath()
        for i in 0..<numberofpoles {
            let pole = UIBezierPath()
            pole.move(to: CGPoint(x: x + w - stepwidth - CGFloat(i) * (w - stepwidth) / CGFloat(numberofpoles - 1), y: y + h - stepareaheight - topareaheight + padding + CGFloat(i) * (w - stepwidth) / CGFloat(numberofpoles - 1) * stepareaheight / stepareawidth))
            pole.addLine(to: CGPoint(x: x + w - stepwidth - CGFloat(i) * (w - stepwidth) / CGFloat(numberofpoles - 1), y: y + h - stepareaheight + CGFloat(i) * (w - stepwidth) / CGFloat(numberofpoles - 1) * stepareaheight / stepareawidth))
            polepath.append(pole)
        }
        let toppole = UIBezierPath()
        toppole.move(to: CGPoint(x: x + w - stepwidth, y: y + h - stepareaheight - topareaheight + padding))
        toppole.addLine(to: CGPoint(x: x + w - stepwidth - CGFloat(numberofpoles - 1) * (w - stepwidth) / CGFloat(numberofpoles - 1), y: y + h - stepareaheight - topareaheight + padding + CGFloat(numberofpoles - 1) * (w - stepwidth) / CGFloat(numberofpoles - 1) * stepareaheight / stepareawidth))
        polepath.append(toppole)
        poles.strokeColor = strokecolor.cgColor
        poles.lineWidth = polewidth
        poles.lineCap = kCALineCapRound
        poles.path = polepath.cgPath
        stair.addSublayer(poles)
        
        return stair
        
    }
    
    private func drawPool(rect: CGRect, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeoflinewidth: CGFloat = 5
        let sizeofwaterheight: CGFloat = 35
        let sizeofescalatorheight: CGFloat = 65
        let sizeofescalatorwidth: CGFloat = 30
        let sizeofescalatortopwidth: CGFloat = 25
        let sizeofpadding: CGFloat = 5
        let sizeofwaterwave: CGFloat = 8
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        if w > h {
            x = x + (w - h) / 2
            w = h
        }
        else {
            y = y + (h - w) / 2
            h = w
        }

        let linewidth = w * sizeoflinewidth / 100
        let waterheight = h * sizeofwaterheight / 100
        let escalatorheight = h * sizeofescalatorheight / 100
        let escalatorwidth = w * sizeofescalatorwidth / 100
        let escalatortopwidth = w * sizeofescalatortopwidth / 100
        let padding = h * sizeofpadding / 100
        let waterwave = h * sizeofwaterwave / 100
        
        let pool = CAShapeLayer()
        let water = CAShapeLayer()
        let waterpath = UIBezierPath()
        let water1 = UIBezierPath()
        var wavecenter = y + padding + escalatorheight + padding + waterheight / 3
        water1.move(to: CGPoint(x: x, y: wavecenter))
        water1.addCurve(to: CGPoint(x: x + w / 2, y: wavecenter), controlPoint1: CGPoint(x: x + w / 2 / 4, y: wavecenter - waterwave), controlPoint2: CGPoint(x: x + 3 * w / 2 / 4, y: wavecenter + waterwave))
        water1.addCurve(to: CGPoint(x: x + w, y: wavecenter), controlPoint1: CGPoint(x: x + w / 2 + w / 8, y: wavecenter - waterwave), controlPoint2: CGPoint(x: x + w / 2 + 3 * w / 8, y: wavecenter + waterwave))
        waterpath.append(water1)
        let water2 = UIBezierPath()
        wavecenter = y + padding + escalatorheight + padding + 2 * waterheight / 3
        water2.move(to: CGPoint(x: x, y: wavecenter))
        water2.addCurve(to: CGPoint(x: x + w / 2, y: wavecenter), controlPoint1: CGPoint(x: x + w / 2 / 4, y: wavecenter - waterwave), controlPoint2: CGPoint(x: x + 3 * w / 2 / 4, y: wavecenter + waterwave))
        water2.addCurve(to: CGPoint(x: x + w, y: wavecenter), controlPoint1: CGPoint(x: x + w / 2 + w / 8, y: wavecenter - waterwave), controlPoint2: CGPoint(x: x + w / 2 + 3 * w / 8, y: wavecenter + waterwave))
        waterpath.append(water2)
        water.strokeColor = strokecolor.cgColor
        water.lineWidth = borderwidth
        water.lineJoin = kCALineCapRound
        water.path = waterpath.cgPath
        pool.addSublayer(water)
        
        let bottomheight = h - padding - padding - waterheight - escalatortopwidth / 2
        let escalator = CAShapeLayer()
        let escalatorpath = UIBezierPath()
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: x + w / 2 - escalatorwidth / 2, y: y + padding + escalatortopwidth / 2))
        path1.addLine(to: CGPoint(x: x + w / 2 - escalatorwidth / 2, y: y + padding + escalatorheight))
        escalatorpath.append(path1)
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: x + w / 2 + escalatorwidth / 2, y: y + padding + escalatortopwidth / 2))
        path2.addLine(to: CGPoint(x: x + w / 2 + escalatorwidth / 2, y: y + padding + escalatorheight))
        escalatorpath.append(path2)
        let path3 = UIBezierPath()
        path3.move(to: CGPoint(x: x + w / 2 - escalatorwidth / 2, y: y + y + padding + escalatortopwidth / 2 + bottomheight / 3))
        path3.addLine(to: CGPoint(x: x + w / 2 + escalatorwidth / 2, y: y + y + padding + escalatortopwidth / 2 + bottomheight / 3))
        escalatorpath.append(path3)
        let path4 = UIBezierPath()
        path4.move(to: CGPoint(x: x + w / 2 - escalatorwidth / 2, y: y + y + padding + escalatortopwidth / 2 + 2 * bottomheight / 3))
        path4.addLine(to: CGPoint(x: x + w / 2 + escalatorwidth / 2, y: y + y + padding + escalatortopwidth / 2 + 2 * bottomheight / 3))
        escalatorpath.append(path4)
        escalatorpath.append(UIBezierPath(arcCenter: CGPoint(x: x + w / 2 - escalatorwidth / 2 + escalatortopwidth / 2, y: y + padding + escalatortopwidth / 2), radius: escalatortopwidth / 2, startAngle: CGFloat.pi, endAngle: 0, clockwise: true))
        escalatorpath.append(UIBezierPath(arcCenter: CGPoint(x: x + w / 2 + escalatorwidth / 2 + escalatortopwidth / 2, y: y + padding + escalatortopwidth / 2), radius: escalatortopwidth / 2, startAngle: CGFloat.pi, endAngle: 0, clockwise: true))
        escalator.fillColor = bgcolor.cgColor
        escalator.strokeColor = strokecolor.cgColor
        escalator.lineWidth = linewidth
        escalator.lineCap = kCALineCapRound
        escalator.path = escalatorpath.cgPath
        pool.addSublayer(escalator)
        
        return pool
        
    }
    
    private func drawBalcony(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofdoorheight: CGFloat = 70
        let sizeofdoorwidth: CGFloat = 50
        let sizeofwindowheightofdoor: CGFloat = 30
        let sizeofpolewidth: CGFloat = 17
        let sizeofpoledecorwidth: CGFloat = 8
        let sizeoflinewidth: CGFloat = 3
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        if w > h {
            x = x + (w - h) / 2
            w = h
        }
        else {
            y = y + (h - w) / 2
            h = w
        }
        
        let doorheight = h * sizeofdoorheight / 100
        let doorwidth = w * sizeofdoorwidth / 100
        let windowheight = doorheight * sizeofwindowheightofdoor / 100
        let polewidth = w * sizeofpolewidth / 100
        let poledecor = w * sizeofpoledecorwidth / 100
        let linewidth = w * sizeoflinewidth / 100
        
        let balcony = CAShapeLayer()
        
        let door = CAShapeLayer()
        let doorpath = UIBezierPath()
        let framepath = UIBezierPath()
        framepath.move(to: CGPoint(x: x + (w - doorwidth) / 2, y: y + doorheight))
        framepath.addLine(to: CGPoint(x: x + (w - doorwidth) / 2, y: y + windowheight))
        framepath.addLine(to: CGPoint(x: x + w / 2 + doorwidth / 2, y: y + windowheight))
        framepath.addLine(to: CGPoint(x: x + w / 2 + doorwidth / 2, y: y + doorheight))
        framepath.lineWidth = linewidth
        let line2 = UIBezierPath()
        line2.lineWidth = borderwidth
        line2.move(to: CGPoint(x: x + w / 2, y: y + windowheight))
        line2.addLine(to: CGPoint(x: x + w / 2, y: y))
        doorpath.append(UIBezierPath(arcCenter: CGPoint(x: x + w / 2, y: y + windowheight), radius: windowheight, startAngle: CGFloat.pi, endAngle: 0, clockwise: true))
        doorpath.append(framepath)
        doorpath.append(line2)
        
        door.lineWidth = linewidth
        door.fillColor = bgcolor.cgColor
        door.strokeColor = strokecolor.cgColor
        door.lineJoin = kCALineJoinRound
        door.path = doorpath.cgPath
        balcony.addSublayer(door)
        
        let pole = CAShapeLayer()
        let polepath = UIBezierPath()
        let frame = UIBezierPath(rect: CGRect(x: x, y: y + doorheight, width: w, height: h - doorheight))
        frame.lineWidth = linewidth
        polepath.append(frame)
        let pole1 = UIBezierPath()
        pole1.move(to: CGPoint(x: x + w / 2, y: y + doorheight))
        pole1.addLine(to: CGPoint(x: x + w / 2, y: y + h))
        pole1.lineWidth = borderwidth
        polepath.append(pole1)
        let pole2 = UIBezierPath()
        pole2.move(to: CGPoint(x: x + w / 2 - polewidth, y: y + doorheight))
        pole2.addLine(to: CGPoint(x: x + w / 2 - polewidth, y: y + h))
        pole2.lineWidth = borderwidth
        polepath.append(pole2)
        let pole3 = UIBezierPath()
        pole3.move(to: CGPoint(x: x + w / 2 + polewidth, y: y + doorheight))
        pole3.addLine(to: CGPoint(x: x + w / 2 + polewidth, y: y + h))
        pole3.lineWidth = borderwidth
        polepath.append(pole3)
        let decor1 = UIBezierPath(ovalIn: CGRect(x: x, y: y + doorheight - poledecor, width: poledecor, height: poledecor))
        decor1.lineWidth = linewidth
        polepath.append(decor1)
        let decor2 = UIBezierPath(ovalIn: CGRect(x: x + w - poledecor, y: y + doorheight - poledecor, width: poledecor, height: poledecor))
        decor2.lineWidth = linewidth
        polepath.append(decor2)
        
        pole.lineWidth = linewidth
        pole.fillColor = bgcolor.cgColor
        pole.strokeColor = strokecolor.cgColor
        pole.lineJoin = kCALineJoinRound
        pole.path = polepath.cgPath
        balcony.addSublayer(pole)
        
        return balcony
        
    }
    
}
