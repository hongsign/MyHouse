//
//  UIHelpersDrawTable.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-13.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawTable: UIHelpers {
    
    enum UITableType: String {
        case dining
        case office
        case easy
    }
    
    func drawTable(type: UITableType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, backgroundcolor: UIColor? = .clear, legthick: CGFloat? = 0, topthick: CGFloat? = 0, borderwidth: CGFloat? = 1) -> CAShapeLayer {
        
        let x = rect.origin.x
        let y = rect.origin.y
        let w = rect.size.width
        let h = rect.size.height
        
        switch type {
        case .dining:
            return drawDiningTable(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, legthick: legthick!, topthick: topthick!)
        case .office:
            return drawOfficeTable(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, borderwidth: borderwidth!)
        case .easy:
            return drawEasyTableWithLight(x: x, y: y, w: w, h: h, fillcolor: fillcolor, strokecolor: strokecolor, backgroundcolor: backgroundcolor!)
        }
        
    }
    
    private func drawDiningTable(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, legthick: CGFloat, topthick: CGFloat) -> CAShapeLayer {
        
        let table = CAShapeLayer()
        
        let sizeoflegpadding: CGFloat = 14
        let legpadding = w * sizeoflegpadding / 100
        
        let path = UIBezierPath()
        let top = CAShapeLayer()
        top.fillColor = fillcolor.cgColor
        top.strokeColor = strokecolor.cgColor
        top.lineWidth = topthick
        top.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x + w, y: y))
        top.path = path.cgPath
        table.addSublayer(top)
        
        let legpath = UIBezierPath()
        let leg1 = CAShapeLayer()
        leg1.fillColor = fillcolor.cgColor
        leg1.strokeColor = strokecolor.cgColor
        leg1.lineWidth = legthick
        leg1.lineCap = kCALineCapButt
        legpath.move(to: CGPoint(x: x + legpadding, y: y))
        legpath.addLine(to: CGPoint(x: x + legpadding / 2, y: y + h))
        leg1.path = legpath.cgPath
        table.addSublayer(leg1)
        
        let leg2 = CAShapeLayer()
        leg2.fillColor = fillcolor.cgColor
        leg2.strokeColor = strokecolor.cgColor
        leg2.lineWidth = legthick
        leg2.lineCap = kCALineCapButt
        legpath.move(to: CGPoint(x: x + 2 * legpadding, y: y))
        legpath.addLine(to: CGPoint(x: x + 3 * legpadding / 2, y: y + h - legpadding))
        leg2.path = legpath.cgPath
        table.addSublayer(leg2)
        
        let leg3 = CAShapeLayer()
        leg3.fillColor = fillcolor.cgColor
        leg3.strokeColor = strokecolor.cgColor
        leg3.lineWidth = legthick
        leg3.lineCap = kCALineCapButt
        legpath.move(to: CGPoint(x: x + w - legpadding, y: y))
        legpath.addLine(to: CGPoint(x: x + w - legpadding / 2, y: y + h))
        leg3.path = legpath.cgPath
        table.addSublayer(leg3)
        
        let leg4 = CAShapeLayer()
        leg4.fillColor = fillcolor.cgColor
        leg4.strokeColor = strokecolor.cgColor
        leg4.lineWidth = legthick
        leg4.lineCap = kCALineCapButt
        legpath.move(to: CGPoint(x: x + w - 2 * legpadding, y: y))
        legpath.addLine(to: CGPoint(x: x + w - 3 * legpadding / 2, y: y + h - legpadding))
        leg4.path = legpath.cgPath
        table.addSublayer(leg4)
        
        return table
    }
    
    private func drawOfficeTable(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let table = CAShapeLayer()
        
        let sizeoflinewidth: CGFloat = 5
        let sizeofdrawerpadding: CGFloat = 2
        let sizeofleftdrawerwidth: CGFloat = 2 * (100 - 5 * sizeoflinewidth - 4 * sizeofdrawerpadding) / 3
        let sizeofleftdrawerheight: CGFloat = 20
        let sizeofrightgrawerwidth: CGFloat = (100 - 5 * sizeoflinewidth - 4 * sizeofdrawerpadding) / 3
        let sizeofrightdrawerheight: CGFloat = 100 - sizeoflinewidth - 2 * sizeofdrawerpadding
        let sizeofdrawerhandlewidthofdrawer: CGFloat = 30
        
        let linewidth = w * sizeoflinewidth / 100
        let drawerpadding = w * sizeofdrawerpadding / 100
        let leftdrawerwidth = w * sizeofleftdrawerwidth / 100
        let leftdrawerheight = h * sizeofleftdrawerheight / 100
        let rightdrawerwidth = w * sizeofrightgrawerwidth / 100 - drawerpadding
        let rightdrawerheight = h * sizeofrightdrawerheight / 100
        let leftdrawerhandlewidth = leftdrawerwidth * sizeofdrawerhandlewidthofdrawer / 100
        let rightdrawerhandlewidth = rightdrawerheight * sizeofdrawerhandlewidthofdrawer / 100
        
        let path = UIBezierPath()
        let top = CAShapeLayer()
        top.fillColor = strokecolor.cgColor
        top.strokeColor = strokecolor.cgColor
        top.lineWidth = linewidth
        top.lineCap = kCALineCapRound
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x + w, y: y))
        top.path = path.cgPath
        table.addSublayer(top)
        
        var legx: CGFloat = 0
        for i in 0..<3 {
            
            switch i {
            case 0:
                legx = x + linewidth
            case 1:
                legx = x + 3 * linewidth + 2 * drawerpadding + leftdrawerwidth
            case 2:
                legx = x + 3 * linewidth + 2 * drawerpadding + leftdrawerwidth + linewidth + 3 * drawerpadding + rightdrawerwidth
            default:
                break
            }
            
            let leg = CAShapeLayer()
            leg.fillColor = strokecolor.cgColor
            leg.strokeColor = strokecolor.cgColor
            leg.lineWidth = linewidth
            leg.lineCap = kCALineCapRound
            path.move(to: CGPoint(x: legx, y: y))
            path.addLine(to: CGPoint(x: legx, y: y + h))
            leg.path = path.cgPath
            table.addSublayer(leg)
        }
        
        let ldrawer = CAShapeLayer()
        ldrawer.fillColor = fillcolor.cgColor
        ldrawer.strokeColor = strokecolor.cgColor
        ldrawer.lineWidth = borderwidth
        ldrawer.path = UIBezierPath(rect: CGRect(x: x + 2 * linewidth + drawerpadding, y: y + linewidth + drawerpadding, width: leftdrawerwidth, height: leftdrawerheight)).cgPath
        table.addSublayer(ldrawer)
        
        let lhandle = CAShapeLayer()
        lhandle.fillColor = strokecolor.cgColor
        lhandle.strokeColor = strokecolor.cgColor
        lhandle.lineWidth = drawerpadding
        lhandle.lineCap = kCALineCapSquare
        path.move(to: CGPoint(x: x + 2 * linewidth + drawerpadding + (leftdrawerwidth - leftdrawerhandlewidth) / 2, y: y + linewidth + drawerpadding + leftdrawerheight / 2))
        path.addLine(to: CGPoint(x: x + 2 * linewidth + drawerpadding + (leftdrawerwidth - leftdrawerhandlewidth) / 2 + leftdrawerhandlewidth, y: y + linewidth + drawerpadding + leftdrawerheight / 2))
        lhandle.path = path.cgPath
        table.addSublayer(lhandle)
        
        let rdrawer = CAShapeLayer()
        rdrawer.fillColor = fillcolor.cgColor
        rdrawer.strokeColor = strokecolor.cgColor
        rdrawer.lineWidth = borderwidth
        rdrawer.path = UIBezierPath(rect: CGRect(x: x + 3 * linewidth + 5 * drawerpadding + leftdrawerwidth, y: y + linewidth + drawerpadding, width: rightdrawerwidth, height: rightdrawerheight)).cgPath
        table.addSublayer(rdrawer)
        
        let rhandle = CAShapeLayer()
        rhandle.fillColor = strokecolor.cgColor
        rhandle.strokeColor = strokecolor.cgColor
        rhandle.lineWidth = drawerpadding
        rhandle.lineCap = kCALineCapSquare
        path.move(to: CGPoint(x: x + 3 * linewidth + 3 * drawerpadding + leftdrawerwidth + 3 * drawerpadding, y: y + linewidth + drawerpadding +  (rightdrawerheight - rightdrawerhandlewidth) / 2))
        path.addLine(to: CGPoint(x: x + 3 * linewidth + 3 * drawerpadding + leftdrawerwidth + 3 * drawerpadding, y: y + linewidth + drawerpadding +  (rightdrawerheight - rightdrawerhandlewidth) / 2 + rightdrawerhandlewidth))
        lhandle.path = path.cgPath
        table.addSublayer(lhandle)
        
        return table
    }
    
    private func drawEasyTableWithLight(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fillcolor: UIColor, strokecolor: UIColor, backgroundcolor: UIColor) -> CAShapeLayer {
        
        let table = CAShapeLayer()
        
        var drawrect = CGRect(x: x, y: y, width: w, height: h)
        
        /*-----------------------------------------
         Draw a square symbol in middle of screen
         -------------------------------------------*/
        if drawrect.size.width > drawrect.size.height {
            drawrect.origin.x = drawrect.origin.x + (drawrect.size.width - drawrect.size.height) / 2
            drawrect.size.width = drawrect.size.height
        }
        else {
            drawrect.origin.y = drawrect.origin.y + (drawrect.size.height - drawrect.size.width) / 2
            drawrect.size.height = drawrect.size.width
        }
        
        let sizeoflightheight: CGFloat = 40
        let sizeofdeskheight: CGFloat = 60
        let sizeofchairheight: CGFloat = 40
        let sizeoflightwidth: CGFloat = 25
        let sizeofdeskwidth: CGFloat = 100
        let sizeofchairwidth: CGFloat = 35
        let sizeoflightoffset: CGFloat = 10
        let sizeoflinewidth: CGFloat = 4
        
        let lightheight = drawrect.size.height * sizeoflightheight / 100
        let lightwidth = drawrect.size.width * sizeoflightwidth / 100
        let deskheight = drawrect.size.height * sizeofdeskheight / 100
        let deskwidth = drawrect.size.width * sizeofdeskwidth / 100
        let chairheight = drawrect.size.height * sizeofchairheight / 100
        let chairwidth = drawrect.size.width * sizeofchairwidth / 100
        let lightoffset = drawrect.size.width * sizeoflightoffset / 100
        
        let linewidth = drawrect.size.width * sizeoflinewidth / 100
        
        let path = UIBezierPath()
        let desk = CAShapeLayer()
        desk.fillColor = backgroundcolor.cgColor
        desk.strokeColor = strokecolor.cgColor
        desk.lineWidth = linewidth
        desk.lineJoin = kCALineJoinRound
        path.move(to: CGPoint(x: drawrect.origin.x, y: drawrect.origin.y + drawrect.size.height))
        path.addLine(to: CGPoint(x: drawrect.origin.x, y: drawrect.origin.y + drawrect.size.height - deskheight))
        path.addLine(to: CGPoint(x: drawrect.origin.x + deskwidth, y: drawrect.origin.y + drawrect.size.height - deskheight))
        path.addLine(to: CGPoint(x: drawrect.origin.x + deskwidth, y: drawrect.origin.y + drawrect.size.height))
        desk.path = path.cgPath
        table.addSublayer(desk)
        
        let chair = CAShapeLayer()
        chair.fillColor = backgroundcolor.cgColor
        chair.strokeColor = strokecolor.cgColor
        chair.lineWidth = linewidth
        chair.lineJoin = kCALineJoinRound
        path.move(to: CGPoint(x: drawrect.origin.x + (drawrect.size.width - chairwidth) / 2, y: drawrect.origin.y + drawrect.size.height))
        path.addLine(to: CGPoint(x: drawrect.origin.x + (drawrect.size.width - chairwidth) / 2, y: drawrect.origin.y + drawrect.size.height - chairheight))
        path.addLine(to: CGPoint(x: drawrect.origin.x + (drawrect.size.width - chairwidth) / 2 + chairwidth, y: drawrect.origin.y + drawrect.size.height - chairheight))
        path.addLine(to: CGPoint(x: drawrect.origin.x + (drawrect.size.width - chairwidth) / 2 + chairwidth, y: drawrect.origin.y + drawrect.size.height))
        chair.path = path.cgPath
        table.addSublayer(chair)
        
        let lighttop = CAShapeLayer()
        lighttop.fillColor = backgroundcolor.cgColor
        lighttop.strokeColor = strokecolor.cgColor
        lighttop.lineWidth = linewidth
        lighttop.lineJoin = kCALineJoinRound
        path.move(to: CGPoint(x: drawrect.origin.x + lightoffset, y: drawrect.origin.y + lightheight / 2))
        path.addLine(to: CGPoint(x: drawrect.origin.x + lightoffset + lightwidth / 4, y: drawrect.origin.y))
        path.addLine(to: CGPoint(x: drawrect.origin.x + lightoffset + 3 * lightwidth / 4, y: drawrect.origin.y))
        path.addLine(to: CGPoint(x: drawrect.origin.x + lightoffset + lightwidth, y: drawrect.origin.y + lightheight / 2))
        path.close()
        lighttop.path = path.cgPath
        table.addSublayer(lighttop)
        
        let lightbottom = CAShapeLayer()
        lightbottom.fillColor = backgroundcolor.cgColor
        lightbottom.strokeColor = strokecolor.cgColor
        lightbottom.lineWidth = linewidth
        path.move(to: CGPoint(x: drawrect.origin.x + lightoffset + lightwidth / 4, y: drawrect.origin.y + lightheight - linewidth))
        path.addLine(to: CGPoint(x: drawrect.origin.x + lightoffset + 3 * lightwidth / 4, y: drawrect.origin.y + lightheight - linewidth))
        lightbottom.path = path.cgPath
        table.addSublayer(lightbottom)
        
        let lightmid = CAShapeLayer()
        lightmid.fillColor = backgroundcolor.cgColor
        lightmid.strokeColor = strokecolor.cgColor
        lightmid.lineWidth = linewidth
        path.move(to: CGPoint(x: drawrect.origin.x + lightoffset + lightwidth / 2, y: drawrect.origin.y + lightheight - linewidth))
        path.addLine(to: CGPoint(x: drawrect.origin.x + lightoffset + lightwidth / 2, y: drawrect.origin.y + lightheight / 2))
        lightmid.path = path.cgPath
        table.addSublayer(lightmid)
        
        return table
    }

}
