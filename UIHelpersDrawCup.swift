//
//  UIHelpersDrawCup.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-14.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawCup: UIHelpers {
    
    enum UICupType: String {
        case coffee
        case cocktail
        case wine
    }
    
    func drawCup(type: UICupType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, backgroundcolor: UIColor? = .clear, borderwidth: CGFloat, hasplate: Bool? = true, hasair: Bool? = true) -> CAShapeLayer {
        
        switch type {
        case .coffee:
            return drawCoffeeCup(rect: rect, hasPlate: hasplate!, hasAir: hasair!, fillcolor: fillcolor, strokecolor: strokecolor, backgroundcolor: backgroundcolor!, borderwidth: borderwidth)
        case .cocktail:
            return drawCocktailCup(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        case .wine:
            return drawWineCup(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        }
        
    }
    
    private func drawCocktailCup(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofbottomwidth: CGFloat = 30
        let sizeofrightpadding: CGFloat = 15
        let sizeofleftpadding: CGFloat = 15
        let sizeoftoppadding: CGFloat = 25
        let sizeoflegwidth: CGFloat = 5
        let sizeofliquor: CGFloat = 66
        let sizeoflegheight: CGFloat = 40
        
        let x = rect.origin.x
        let y = rect.origin.y
        let w = rect.size.width
        let h = rect.size.height
        
        let bottomwidth = w * sizeofbottomwidth / 100
        let toppadding = h * sizeoftoppadding / 100
        let leftpadding = h * sizeofleftpadding / 100
        let rightpadding = h * sizeofrightpadding / 100
        let legwidth = w * sizeoflegwidth / 100
        let legheight = h * sizeoflegheight / 100
        let cupheight = h - toppadding - legheight
        let cupwidth = w - leftpadding - rightpadding
        let liquorheight = cupheight * sizeofliquor / 100
        
        let cupcenterx = x + leftpadding + cupwidth / 2
        
        let cup = CAShapeLayer()
        
        let path = UIBezierPath()
        let bottom = CAShapeLayer()
        bottom.fillColor = strokecolor.cgColor
        bottom.strokeColor = strokecolor.cgColor
        bottom.lineWidth = borderwidth
        bottom.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: cupcenterx - bottomwidth / 2, y: y + h))
        path.addLine(to: CGPoint(x: cupcenterx + bottomwidth / 2, y: y + h))
        bottom.path = path.cgPath
        cup.addSublayer(bottom)
        
        let leg = CAShapeLayer()
        leg.fillColor = strokecolor.cgColor
        leg.strokeColor = strokecolor.cgColor
        leg.lineWidth = borderwidth
        leg.lineCap = kCALineCapSquare
        path.move(to: CGPoint(x: cupcenterx, y: y + h))
        path.addLine(to: CGPoint(x: cupcenterx, y: y + h - legheight))
        leg.path = path.cgPath
        cup.addSublayer(leg)
        
        let cuppath = UIBezierPath()
        let thecup = CAShapeLayer()
        thecup.fillColor = strokecolor.inverse().cgColor
        thecup.strokeColor = strokecolor.cgColor
        thecup.lineWidth = borderwidth
        thecup.lineJoin = kCALineJoinBevel
        cuppath.move(to: CGPoint(x: x + leftpadding, y: y + toppadding))
        cuppath.addLine(to: CGPoint(x: x + leftpadding + cupwidth, y: y + toppadding))
        cuppath.addLine(to: CGPoint(x: cupcenterx, y: y + toppadding + cupheight))
        cuppath.close()
        thecup.path = cuppath.cgPath
        cup.addSublayer(thecup)
        
        let angle = atan(cupwidth / 2 / cupheight)
        let xx = tan(angle) * liquorheight
        
        let liquorpath = UIBezierPath()
        let liquor = CAShapeLayer()
        liquor.fillColor = fillcolor.cgColor
        liquor.strokeColor = strokecolor.cgColor
        liquor.lineWidth = borderwidth
        liquor.lineJoin = kCALineJoinRound
        liquorpath.move(to: CGPoint(x: cupcenterx, y: y + toppadding + cupheight))
        liquorpath.addLine(to: CGPoint(x: cupcenterx - xx, y: y + toppadding + cupheight - liquorheight))
        liquorpath.addLine(to: CGPoint(x: cupcenterx + xx, y: y + toppadding + cupheight - liquorheight))
        liquorpath.close()
        liquor.path = liquorpath.cgPath
        cup.addSublayer(liquor)
        
        let leftdecor = CAShapeLayer()
        leftdecor.fillColor = UIColor.clear.cgColor //strokecolor.inverse().cgColor
        leftdecor.strokeColor = strokecolor.cgColor
        leftdecor.lineWidth = borderwidth
        leftdecor.path = UIBezierPath(ovalIn: CGRect(x: x, y: y + toppadding - leftpadding, width: 2 * leftpadding, height: 2 * leftpadding)).cgPath
        cup.addSublayer(leftdecor)
        
        let decorpath = UIBezierPath()
        let rightdecor = CAShapeLayer()
        rightdecor.fillColor = strokecolor.inverse().cgColor
        rightdecor.strokeColor = strokecolor.cgColor
        rightdecor.lineWidth = legwidth
        rightdecor.lineCap = kCALineCapRound
        decorpath.move(to: CGPoint(x: x + w, y: y + toppadding / 3))
        decorpath.addLine(to: CGPoint(x: x + w - rightpadding, y: y + toppadding / 2))
        decorpath.addLine(to: CGPoint(x: x + w - rightpadding - cupwidth / 5, y: y + toppadding))
        rightdecor.path = decorpath.cgPath
        cup.addSublayer(rightdecor)
        
        return cup
        
    }
    
    private func drawCoffeeCup(rect: CGRect, hasPlate: Bool, hasAir: Bool, fillcolor: UIColor, strokecolor: UIColor, backgroundcolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        let sizeofplatepadding: CGFloat = 12
        let sizeofplateheight: CGFloat = 12
        let sizeofcupwidth: CGFloat = 76
        let sizeofcupheight: CGFloat = 50
        let sizeofairheight: CGFloat = 35
        let sizeofairpadding: CGFloat = 7
        let sizeofcupbottomwidth: CGFloat = 30
        let sizeofplatebottomwidth: CGFloat = 50
        let sizeofairwidth: CGFloat = 4
        let sizeofaircurvewidth: CGFloat = 20
        let sizeofhandlewidthofplateheight: CGFloat = 38
        
        //make it a square
        if w > h {
            x = x + (w - h) / 2
            w = h
        }
        else {
            y = y + (h - w) / 2
            h = w
        }
        
        let platepadding = w * sizeofplatepadding / 100
        let plateheight = h * sizeofplateheight / 100
        let cupwidth = w * sizeofcupwidth / 100
        let cupheight = h * sizeofcupheight / 100
        let airheight = h * sizeofairheight / 100
        let airpadding = h * sizeofairpadding / 100
        let cupbottomwidth = cupwidth * sizeofcupbottomwidth / 100
        let platebottomwidth = w * sizeofplatebottomwidth / 100
        let cupbottompadding = (cupwidth - cupbottomwidth) / 2
        let platebottompadding = (w - platebottomwidth) / 2
        let airwidth = cupwidth * sizeofairwidth / 100
        let aircurvewidth = cupwidth * sizeofaircurvewidth / 100
        let handlewidth = plateheight * sizeofhandlewidthofplateheight / 100
        
        let cup = CAShapeLayer()
        
        let cuppath = UIBezierPath()
        let thecup = CAShapeLayer()
        thecup.fillColor = fillcolor.cgColor
        thecup.strokeColor = strokecolor.cgColor
        thecup.lineWidth = borderwidth
        thecup.lineJoin = kCALineJoinRound
        cuppath.move(to: CGPoint(x: x + platepadding, y: y + h - cupheight))
        cuppath.addLine(to: CGPoint(x: x + platepadding + cupwidth, y: y + h - cupheight))
        cuppath.addCurve(to: CGPoint(x: x + platepadding + cupbottompadding + cupbottomwidth, y: y + h), controlPoint1: CGPoint(x: x + platepadding + cupwidth - cupbottompadding / 6, y: y + h - 2 * cupheight / 3) , controlPoint2: CGPoint(x: x + platepadding + cupwidth - 2 * cupbottompadding / 5, y: y + h - cupheight / 3))
        cuppath.addLine(to: CGPoint(x: x + platepadding + cupbottompadding, y: y + h))
        cuppath.addCurve(to: CGPoint(x: x + platepadding, y: y + h - cupheight ), controlPoint1: CGPoint(x: x + platepadding + 3 * cupbottompadding / 5, y: y + h - cupheight / 3), controlPoint2: CGPoint(x: x + platepadding + cupbottompadding / 6, y: y + h - 2 * cupheight / 3))
        thecup.path = cuppath.cgPath
        cup.addSublayer(thecup)
        
        if hasPlate {
            let platepath = UIBezierPath()
            let plate = CAShapeLayer()
            plate.fillColor = fillcolor.cgColor
            plate.strokeColor = strokecolor.cgColor
            plate.lineWidth = borderwidth
            plate.lineJoin = kCALineJoinRound
            platepath.move(to: CGPoint(x: x, y: y + h - plateheight))
            platepath.addLine(to: CGPoint(x: x + w, y: y + h - plateheight))
            platepath.addCurve(to: CGPoint(x: x + platebottompadding + platebottomwidth, y: y + h), controlPoint1: CGPoint(x: x + platebottompadding + platebottomwidth + 3 * platebottompadding / 4, y: y + h - 2 * plateheight / 3), controlPoint2: CGPoint(x: x + platebottompadding + platebottomwidth + 2 * platebottompadding / 4, y: y + h - plateheight / 3))
            platepath.addLine(to: CGPoint(x: x + platebottompadding, y: y + h))
            platepath.addCurve(to: CGPoint(x: x, y: y + h - plateheight), controlPoint1: CGPoint(x: x + 3 * platebottompadding / 4, y: y + h - plateheight / 3), controlPoint2: CGPoint(x: x + 2 *  platebottompadding / 4, y: y + h - 2 * plateheight / 3))
            plate.path = platepath.cgPath
            cup.addSublayer(plate)
            
            let handle = CAShapeLayer()
            handle.fillColor = backgroundcolor.cgColor
            handle.strokeColor = strokecolor.cgColor
            handle.lineWidth = handlewidth
            handle.path = UIBezierPath(ovalIn: CGRect(x: x + platepadding + cupwidth - platepadding / 3, y: y + h - cupheight + handlewidth, width: platepadding * 2, height: platepadding * 2)).cgPath
            cup.addSublayer(handle)
            
        }
        
        if hasAir {
            let airpath = UIBezierPath()
            let air1 = CAShapeLayer()
            air1.fillColor = fillcolor.cgColor
            air1.strokeColor = strokecolor.cgColor
            air1.lineWidth = airwidth
            air1.lineCap = kCALineCapButt
            airpath.move(to: CGPoint(x: x + platepadding + cupwidth / 3, y: y))
            airpath.addCurve(to: CGPoint(x: x + platepadding + cupwidth / 3, y: y + airheight), controlPoint1: CGPoint(x: x + platepadding + cupwidth / 3 + aircurvewidth / 2, y: y + airheight / 3), controlPoint2: CGPoint(x: x + platepadding + cupwidth / 3 - aircurvewidth / 2, y: y + 2 * airheight / 3))
            air1.path = airpath.cgPath
            cup.addSublayer(air1)
            
            let air2 = CAShapeLayer()
            air2.fillColor = fillcolor.cgColor
            air2.strokeColor = strokecolor.cgColor
            air2.lineWidth = airwidth
            air2.lineCap = kCALineCapButt
            airpath.move(to: CGPoint(x: x + platepadding + 2 * cupwidth / 3, y: y + airpadding))
            airpath.addCurve(to: CGPoint(x: x + platepadding + 2 * cupwidth / 3, y: y + airpadding + airheight), controlPoint1: CGPoint(x: x + platepadding + 2 * cupwidth / 3 + aircurvewidth / 2, y: y + airpadding + airheight / 3), controlPoint2: CGPoint(x: x + platepadding + 2 * cupwidth / 3 - aircurvewidth / 2, y: y + airpadding + 2 * airheight / 3))
            air2.path = airpath.cgPath
            cup.addSublayer(air2)
        }
        
        return cup
        
    }
    
    private func drawWineCup(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofwidthofheight: CGFloat = 40
        let sizeoflegheight: CGFloat = 30
        let sizeoflegwidth: CGFloat = 7
        //let sizeofwineheight: CGFloat = 50
        let sizeofbottomwidth: CGFloat = 35
        let sizeofcuppadding: CGFloat = 5
        
        var x = rect.origin.x
        var y = rect.origin.y
        let w = rect.size.width
        let h = rect.size.height
        var width = w
        var height = h
        
        width = h * sizeofwidthofheight / 100
        if width > w {
            width = w
            height = width * 100 / sizeofwidthofheight
            y = y + (h - height) / 2
        }
        else {
            x = x + (w - width) / 2
        }
        
        let legheight = height * sizeoflegheight / 100
        let legwidth = width * sizeoflegwidth / 100
        let cupheight = height - legheight
        //let wineheight = cupheight * sizeofwineheight / 100
        let bottomwidth = width * sizeofbottomwidth / 100
        let cuppadding = width * sizeofcuppadding / 100
        
        let bottompath = UIBezierPath()
        bottompath.lineWidth = legwidth
        bottompath.lineCapStyle = .round
        bottompath.move(to: CGPoint(x: x + width / 2 - bottomwidth / 2, y: y + height))
        bottompath.addLine(to: CGPoint(x: x + width / 2 + bottomwidth / 2, y: y + height))
        let legpath = UIBezierPath()
        legpath.lineWidth = legwidth
        legpath.lineCapStyle = .butt
        legpath.move(to: CGPoint(x: x + width / 2, y: y + height))
        legpath.addLine(to: CGPoint(x: x + width / 2, y: y + height - legheight))
        let cuppath = UIBezierPath()
        cuppath.lineWidth = borderwidth
        cuppath.lineJoinStyle = .round
        cuppath.move(to: CGPoint(x: x + cuppadding, y: y))
        cuppath.addLine(to: CGPoint(x: x + width - cuppadding, y: y))
        cuppath.addCurve(to: CGPoint(x: x + width / 2, y: y + cupheight), controlPoint1: CGPoint(x: x + width - 2 * cuppadding, y: y + cupheight / 2), controlPoint2: CGPoint(x: x + width, y: y + 2 * cupheight / 3))
        cuppath.addCurve(to: CGPoint(x: x + cuppadding, y: y), controlPoint1: CGPoint(x: x, y: y + 2 * cupheight / 3), controlPoint2: CGPoint(x: x + 2 * cuppadding, y: y + cupheight / 2))
        
        let path = UIBezierPath()
        path.append(bottompath)
        path.append(legpath)
        path.append(cuppath)
        
        let thecup = CAShapeLayer()
        thecup.fillColor = UIColor.clear.cgColor
        thecup.strokeColor = strokecolor.cgColor
        thecup.path = path.cgPath
        
        let winepath = UIBezierPath()
        winepath.move(to: CGPoint(x: x + width / 2, y: y + cupheight))
        winepath.addQuadCurve(to: CGPoint(x: x + 2 * cuppadding, y: y + cupheight / 2), controlPoint: CGPoint(x: x, y: y + 2 * cupheight / 3))//, controlPoint2: CGPoint(x: x + 2 * cuppadding, y: y + cupheight / 2))
        winepath.addLine(to: CGPoint(x: x + width - 2 * cuppadding, y: y + cupheight / 2))
        winepath.addQuadCurve(to: CGPoint(x: x + width / 2, y: y + cupheight), controlPoint: CGPoint(x: x + width, y: y + 2 * cupheight / 3))
        
        let wine = CAShapeLayer()
        wine.fillColor = fillcolor.cgColor
        wine.strokeColor = strokecolor.cgColor
        wine.lineWidth = borderwidth
        wine.path = winepath.cgPath
        
        let cup = CAShapeLayer()
        cup.addSublayer(thecup)
        cup.addSublayer(wine)
        
        return cup
        
    }

    
}
