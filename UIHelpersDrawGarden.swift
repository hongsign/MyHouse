//
//  UIHelpersDrawGarden.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-20.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawGarden: UIHelpers {
    
    enum UIGardenType: String {
        case grass
        case flower
    }
    
    func drawGarden(type: UIGardenType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat, bgcolor: UIColor? = .clear) -> CAShapeLayer {
        
        switch type {
        case .grass:
            return drawGrass(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth)
        case .flower:
            let bgclr = bgcolor ?? .clear
            return drawFlower(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, bgcolor: bgclr, borderwidth: borderwidth)
        }
        
    }
    
    private func drawGrass(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofgrasswidth: CGFloat = 20
        let sizeofgrasswidth1: CGFloat = 15
        let sizeoffirstheight: CGFloat = 60
        let sizeofsecondheight: CGFloat = 98
        let sizeofthirdheight: CGFloat = 65
        let sizeoffourthfromheight: CGFloat = 40
        let sizeoffourthtoheight: CGFloat = 80
        
        let r = makeSquare(rect: rect)
        
        let grasswidth = r.w * sizeofgrasswidth / 100
        let grasswidth1 = r.w * sizeofgrasswidth1 / 100
        let firstheight = r.h * sizeoffirstheight / 100
        let secondheight = r.h * sizeofsecondheight / 100
        let thirdheight = r.h * sizeofthirdheight / 100
        let fourthfrom = r.h * sizeoffourthfromheight / 100
        let fourthto = r.h * sizeoffourthtoheight / 100
        let padding = (r.w - 3 * grasswidth) / 2
        
        let grass = CAShapeLayer()
        
        let path = UIBezierPath()
        let first = CAShapeLayer()
        path.move(to: CGPoint(x: r.x + padding, y: r.y + r.h))
        path.addLine(to: CGPoint(x: r.x + padding + grasswidth, y: r.y + r.h))
        path.addQuadCurve(to: CGPoint(x: r.x, y: r.y + r.h - firstheight), controlPoint: CGPoint(x: r.x + padding + grasswidth - grasswidth / 6, y: r.y + r.h - firstheight / 2))
        path.addQuadCurve(to: CGPoint(x: r.x + padding, y: r.y + r.h), controlPoint: CGPoint(x: r.x + 5 * padding / 6, y: r.y + r.h - firstheight / 2))
        first.fillColor = fillcolor.cgColor
        first.strokeColor = strokecolor.cgColor
        first.lineWidth = borderwidth
        first.lineJoin = kCALineJoinRound
        first.path = path.cgPath
        grass.addSublayer(first)
        
        let second = CAShapeLayer()
        path.move(to: CGPoint(x: r.x + padding + grasswidth, y: r.y + r.h))
        path.addLine(to: CGPoint(x: r.x + padding + 2 * grasswidth, y: r.y + r.h))
        path.addQuadCurve(to: CGPoint(x: r.x + padding, y: r.y + r.h - secondheight), controlPoint: CGPoint(x: r.x + padding + grasswidth + 5 * grasswidth / 6, y: r.y + r.h - secondheight / 2))
        path.addQuadCurve(to: CGPoint(x: r.x + padding + grasswidth, y: r.y + r.h), controlPoint: CGPoint(x: r.x + padding + 5 * grasswidth / 6, y: r.y + r.h - secondheight / 2))
        second.fillColor = fillcolor.cgColor
        second.strokeColor = strokecolor.cgColor
        second.lineWidth = borderwidth
        second.lineJoin = kCALineJoinRound
        second.path = path.cgPath
        grass.addSublayer(second)
        
        let third = CAShapeLayer()
        path.move(to: CGPoint(x: r.x + padding + 2 * grasswidth, y: r.y + r.h))
        path.addLine(to: CGPoint(x: r.x + padding + 3 * grasswidth, y: r.y + r.h))
        path.addQuadCurve(to: CGPoint(x: r.x + r.w, y: r.y + r.h - thirdheight), controlPoint: CGPoint(x: r.x + r.w - 5 * padding / 6, y: r.y + r.h - thirdheight / 2))
        path.addQuadCurve(to: CGPoint(x: r.x + padding + 2 * grasswidth, y: r.y + r.h), controlPoint: CGPoint(x: r.x + r.w - grasswidth - 5 * padding / 6, y: r.y + r.h - thirdheight / 2))
        third.fillColor = fillcolor.cgColor
        third.strokeColor = strokecolor.cgColor
        third.lineWidth = borderwidth
        third.lineJoin = kCALineJoinRound
        third.path = path.cgPath
        grass.addSublayer(third)
        
        let fourth = CAShapeLayer()
        path.move(to: CGPoint(x: r.x + padding + 2 * grasswidth, y: r.y + r.h - fourthfrom))
        path.addQuadCurve(to: CGPoint(x: r.x + padding + 3 * grasswidth, y: r.y + r.h - fourthto), controlPoint: CGPoint(x: r.x + padding + 3 * grasswidth + grasswidth / 8, y: r.y + r.h - fourthfrom - (fourthto - fourthfrom) / 2))
        path.addQuadCurve(to: CGPoint(x: r.x + padding + 2 * grasswidth - grasswidth1 / 3, y: r.y + r.h - fourthfrom - grasswidth1), controlPoint: CGPoint(x: r.x + padding + 3 * grasswidth - 5 * grasswidth / 6, y: r.y + r.h - fourthfrom - (fourthto - fourthfrom) / 2))
        path.addLine(to: CGPoint(x: r.x + padding + 2 * grasswidth, y: r.y + r.h - fourthfrom))
        fourth.fillColor = fillcolor.cgColor
        fourth.strokeColor = strokecolor.cgColor
        fourth.lineWidth = borderwidth
        fourth.lineJoin = kCALineJoinRound
        fourth.path = path.cgPath
        grass.addSublayer(fourth)
        
        return grass
    }
    
    private func drawFlower(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofwidthofheight: CGFloat = 60
        let sizeofflowerheight: CGFloat = 50
        let sizeofleafheight: CGFloat = 30
        let sizeofrightleafoffset: CGFloat = 20
        let sizeofleftleafoffset: CGFloat = 12
        let sizeofleafwidth: CGFloat = 10
        let sizeofmiddlewidth: CGFloat = 30
        
        let r = makeThinRectangle(rect: rect, sizeofwidthofheight: sizeofwidthofheight)
        
        let flowerheight = r.h * sizeofflowerheight / 100
        let leafheight = r.h * sizeofleafheight / 100
        let leafwidth = r.h * sizeofleafwidth / 100
        let rightleafoffset = r.h * sizeofrightleafoffset / 100
        let leftleafoffset = r.h * sizeofleftleafoffset / 100
        let middlewidth = r.w * sizeofmiddlewidth / 100
        let radius = middlewidth / 2
        let center = CGPoint(x: r.x + r.w / 2, y: r.y + flowerheight / 2)
        
        let pi = CGFloat.pi
        let radius1 = radius + (flowerheight - middlewidth) / 2 / 3
        
        let p1 = CGPoint(x: center.x + radius1 * cos(pi/5), y: center.y - radius1 * sin(pi/5))
        let p2 = CGPoint(x: center.x - radius1 * sin(pi/10), y: center.y - radius1 * cos(pi/10))
        let p3 = CGPoint(x: center.x - radius1, y: center.y)
        let p4 = CGPoint(x: center.x - radius1 * sin(pi/10), y: center.y + radius1 * cos(pi/10))
        let p5 = CGPoint(x: center.x + radius1 * cos(pi/5), y: center.y + radius1 * sin(pi/5))
        let pieceradius = 2 * (flowerheight - middlewidth) / 2 / 3
        
        let flower = CAShapeLayer()
        
        
        let pedals = CAShapeLayer()
        let pedalspath = UIBezierPath()
        //let pedal1 = UIBezierPath()
        //pedal1.move(to: p1)
        //pedal1.addLine(to: CGPoint(x: ))
        pedalspath.addArc(withCenter: p1, radius: pieceradius, startAngle: 0 * pi / 5, endAngle: 10 * pi / 5, clockwise: true)
        pedalspath.addArc(withCenter: p2, radius: pieceradius, startAngle: 0 * pi / 5, endAngle: 10 * pi / 5, clockwise: true)
        pedalspath.addArc(withCenter: p3, radius: pieceradius, startAngle: 0 * pi / 5, endAngle: 10 * pi / 5, clockwise: true)
        pedalspath.addArc(withCenter: p4, radius: pieceradius, startAngle: 0 * pi / 5, endAngle: 10 * pi / 5, clockwise: true)
        pedalspath.addArc(withCenter: p5, radius: pieceradius, startAngle: 0 * pi / 5, endAngle: 10 * pi / 5, clockwise: true)
        pedals.fillColor = fillcolor.cgColor
        pedals.strokeColor = fillcolor.cgColor
        pedals.lineWidth = borderwidth
        pedals.path = pedalspath.cgPath
        flower.addSublayer(pedals)
        
        let stamens = CAShapeLayer()
        stamens.fillColor = UIColor.white.cgColor //bgcolor.cgColor
        stamens.strokeColor = fillcolor.cgColor
        stamens.lineWidth = borderwidth
        stamens.path = UIBezierPath(ovalIn: CGRect(x: center.x - radius, y: center.y - radius, width: middlewidth, height: middlewidth )).cgPath
        flower.addSublayer(stamens)
        
        let stem = CAShapeLayer()
        let stempath = UIBezierPath()
        let leftleaf = UIBezierPath()
        leftleaf.move(to: CGPoint(x: r.x, y: r.y + r.h - leafheight - leftleafoffset))
        leftleaf.addQuadCurve(to: CGPoint(x: r.x + r.w / 2, y: r.y + r.h - leafheight), controlPoint: CGPoint(x: r.x + 3 * r.w / 8, y: r.y + r.h - leafheight - leafwidth))
        leftleaf.addQuadCurve(to: CGPoint(x: r.x, y: r.y + r.h - leafheight - leftleafoffset), controlPoint: CGPoint(x: r.x + r.w / 8, y: r.y + r.h - leafheight + leafwidth))
        let rightleaf = UIBezierPath()
        rightleaf.move(to: CGPoint(x: r.x + r.w, y: r.y + r.h - leafheight - rightleafoffset))
        rightleaf.addQuadCurve(to: CGPoint(x: r.x + r.w / 2, y: r.y + r.h - leafheight), controlPoint: CGPoint(x: r.x + r.w - 3 * r.w / 8, y: r.y + r.h - leafheight - leafwidth))
        rightleaf.addQuadCurve(to: CGPoint(x: r.x + r.w, y: r.y + r.h - leafheight - rightleafoffset), controlPoint: CGPoint(x: r.x + r.w - r.w / 8, y: r.y + r.h - leafheight - rightleafoffset + leafwidth))
        let middlestem = UIBezierPath()
        middlestem.move(to: CGPoint(x: r.x + r.w / 2, y: r.y + r.h))
        middlestem.addLine(to: CGPoint(x: r.x + r.w / 2, y: r.y + flowerheight))
        stempath.append(leftleaf)
        stempath.append(rightleaf)
        stempath.append(middlestem)
        stem.fillColor = fillcolor.cgColor
        stem.strokeColor = strokecolor.cgColor
        stem.lineWidth = borderwidth
        stem.lineJoin = kCALineJoinRound
        stem.lineCap = kCALineCapRound
        stem.path = stempath.cgPath
        flower.addSublayer(stem)
        
        return flower
        
    }
    
}
