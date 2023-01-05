//
//  UIHelpersDrawFurniture.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-15.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpersDrawFurniture: UIHelpers {
    
    enum UIFurnitureType: String {
        case cabinet
        case bookshelf
        case winerack
        case mirror
        case patioset
    }
    
    enum UIMirrorType: String {
        case circle
        case rectangle
    }
    
    func drawFurniture(type: UIFurnitureType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat, numberoflayers: Int? = 3, numberofbottles: Int? = 4, mirrortype: UIMirrorType? = .circle) -> CAShapeLayer {
        
        switch type {
        case .cabinet:
            return drawCabinet(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, bgcolor: bgcolor, borderwidth: borderwidth)
        case .bookshelf:
            return drawBookshelf(rect: rect, bgcolor: bgcolor, strokecolor: strokecolor, numberoflayers: numberoflayers!)
        case .winerack:
            return drawWinerack(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, bgcolor: bgcolor, borderwidth: borderwidth, numberoflayers: numberoflayers!, numberofbottles: numberofbottles!)
        case .mirror:
            let mtype = mirrortype ?? .circle
            return drawMirror(type: mtype, rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, bgcolor: bgcolor, borderwidth: borderwidth)
        case .patioset:
            return drawPatioSet(rect: rect, fillcolor: fillcolor, strokecolor: strokecolor, bgcolor: bgcolor, borderwidth: borderwidth)
            
        }
        
    }
    
    private func drawCabinet(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        let sizeofheightofwidth: CGFloat = 80
        let sizeofshadowareaheight: CGFloat = 30
        let sizeofshadowwidthpadding: CGFloat = 30
        let sizeofshadowheightpadding: CGFloat = 20
        let sizeofshadowwidth: CGFloat = 15
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        let height = w * sizeofheightofwidth / 100
        if height > h {
            let width = h * 100 / sizeofheightofwidth
            x = x + (w - width) / 2
            w = width
        }
        else {
            y = y + (h - height)
            h = height
        }
        
        let sectionwidth = w / 3
        let sectionheight = h / 3
        let shadowareaheight = h * sizeofshadowareaheight / 100
        let shadowwidthpadding = sectionwidth * sizeofshadowwidthpadding / 100
        let shadowheightpadding = shadowareaheight * sizeofshadowheightpadding / 100
        let shadowwidth = sectionwidth * sizeofshadowwidth / 100
        
        let cabinet = CAShapeLayer()
        
        let buttonradius = sectionwidth / 12
        
        let frame1 = CAShapeLayer()
        let path1 = UIBezierPath()
        path1.append(UIBezierPath(rect: CGRect(x: x, y: y, width: sectionwidth, height: sectionheight)))
        path1.append(UIBezierPath(rect: CGRect(x: x, y: y + sectionheight, width: sectionwidth, height: sectionheight)))
        path1.append(UIBezierPath(rect: CGRect(x: x, y: y + 2 * sectionheight, width: sectionwidth / 2, height: sectionheight)))
        path1.append(UIBezierPath(rect: CGRect(x: x + sectionwidth / 2, y: y + 2 * sectionheight, width: sectionwidth / 2, height: sectionheight)))
        path1.append(UIBezierPath(ovalIn: CGRect(x: x + sectionwidth / 2 / 2, y: y + 2 * sectionheight + 2 * sectionheight / 5, width: buttonradius * 2, height: buttonradius * 2)))
        path1.append(UIBezierPath(ovalIn: CGRect(x: x + sectionwidth / 2 + sectionwidth / 4 - buttonradius
             * 2, y: y + 2 * sectionheight + 2 * sectionheight / 5, width: buttonradius * 2, height: buttonradius * 2)))
        frame1.fillColor = fillcolor.cgColor
        frame1.strokeColor = strokecolor.cgColor
        frame1.lineWidth = borderwidth
        frame1.lineJoin = kCALineJoinRound
        frame1.path = path1.cgPath
        cabinet.addSublayer(frame1)
        
        let frame = CAShapeLayer()
        let path2 = UIBezierPath()
        path2.append(UIBezierPath(rect: CGRect(x: x + sectionwidth, y: y, width: sectionwidth, height: h)))
        path2.append(UIBezierPath(rect: CGRect(x: x + 2 * sectionwidth, y: y, width: sectionwidth, height: h)))
        frame.fillColor = bgcolor.cgColor
        frame.strokeColor = strokecolor.cgColor
        frame.lineWidth = borderwidth
        frame.lineJoin = kCALineJoinRound
        frame.path = path2.cgPath
        cabinet.addSublayer(frame)
        
        let shadow = CAShapeLayer()
        let shadowpath = UIBezierPath()
        let shadow1 = UIBezierPath()
        shadow1.move(to: CGPoint(x: x + 2 * sectionwidth - shadowwidthpadding, y: y + shadowheightpadding))
        shadow1.addLine(to: CGPoint(x: x + sectionwidth + shadowwidthpadding + shadowwidth, y: y + shadowareaheight - shadowheightpadding))
        let shadow2 = UIBezierPath()
        shadow2.move(to: CGPoint(x: x + 2 * sectionwidth - shadowwidthpadding - shadowwidth, y: y + shadowheightpadding))
        shadow2.addLine(to: CGPoint(x: x + sectionwidth + shadowwidthpadding, y: y + shadowareaheight - shadowheightpadding))
        let shadow3 = UIBezierPath()
        shadow3.move(to: CGPoint(x: x + 3 * sectionwidth - shadowwidthpadding, y: y + h - shadowareaheight + shadowheightpadding))
        shadow3.addLine(to: CGPoint(x: x + 2 * sectionwidth + shadowwidthpadding + shadowwidth, y: y + h - shadowheightpadding))
        let shadow4 = UIBezierPath()
        shadow4.move(to: CGPoint(x: x + 3 * sectionwidth - shadowwidthpadding - shadowwidth, y: y + h - shadowareaheight + shadowheightpadding))
        shadow4.addLine(to: CGPoint(x: x + 2 * sectionwidth + shadowwidthpadding, y: y + h  - shadowheightpadding))
        shadowpath.append(shadow1)
        shadowpath.append(shadow2)
        shadowpath.append(shadow3)
        shadowpath.append(shadow4)
        shadow.strokeColor = fillcolor.cgColor
        shadow.lineWidth = borderwidth * 2
        shadow.lineCap = kCALineCapRound
        shadow.path = shadowpath.cgPath
        cabinet.addSublayer(shadow)
        
        return cabinet
        
    }
    
    private func drawBookshelf(rect: CGRect, bgcolor: UIColor, strokecolor: UIColor, numberoflayers: Int) -> CAShapeLayer {
        
        let sizeofframewidth: CGFloat = 8
        let sizeofshelfwidth: CGFloat = 3
        let sizeofbookwidth: CGFloat = 5
        
        let numberofbooks: Int = 3
        
        /*---------------------------------------
         simplify (x,y,width,height), and draw in square
         -----------------------------------------*/
        var w = rect.size.width
        var h = rect.size.height
        var x = rect.origin.x
        var y = rect.origin.y
        x = w > h ? x + (rect.size.width - h) / 2 : x
        y = w > h ? y : y + (rect.size.height - w) / 2
        w = w > h ? h : w
        h = w
        
        let framewidth = h * sizeofframewidth / 100
        let bookwidth = h * sizeofbookwidth / 100
        let shelfwidth = h * sizeofshelfwidth / 100
        let shelfheight = (h - framewidth - (CGFloat(numberoflayers) - 1) * shelfwidth) / CGFloat(numberoflayers)
        let bookheight = shelfheight * 80 / 100
        
        let bookshelf = CAShapeLayer()
        
        let path = UIBezierPath()
        let frame = CAShapeLayer()
        frame.fillColor = bgcolor.cgColor
        frame.strokeColor = strokecolor.cgColor
        frame.lineWidth = framewidth
        frame.lineJoin = kCALineJoinBevel
        path.move(to: CGPoint(x: x, y: y + h))
        path.addLine(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x + w, y: y))
        path.addLine(to: CGPoint(x: x + w, y: y + h))
        frame.path = path.cgPath
        bookshelf.addSublayer(frame)
        
        let shelf = CAShapeLayer()
        shelf.fillColor = bgcolor.cgColor
        shelf.strokeColor = strokecolor.cgColor
        shelf.lineWidth = shelfwidth
        shelf.lineCap = kCALineCapRound
        let allshelfpath = UIBezierPath()
        
        let books = CAShapeLayer()
        books.fillColor = bgcolor.cgColor
        books.strokeColor = strokecolor.cgColor
        books.lineWidth = bookwidth
        books.lineCap = kCALineCapButt
        let allbookpath = UIBezierPath()
        
        for i in 0..<numberoflayers-1 {
            let n = CGFloat(i)
            
            let shelfpath = UIBezierPath()
            shelfpath.move(to: CGPoint(x: x, y: y + framewidth + (n + 1) * shelfheight + n * shelfwidth))
            shelfpath.addLine(to: CGPoint(x: x + w, y: y + framewidth + (n + 1) * shelfheight + n * shelfwidth))
            allshelfpath.append(shelfpath)
            
            if i == 0 {
                for j in 0..<numberofbooks {
                    let m = CGFloat(j)
                    let bookpath = UIBezierPath()
                    bookpath.move(to: CGPoint(x: x + shelfwidth + (m + 1) * bookwidth + m * bookwidth, y: y + shelfwidth + n * shelfwidth + (n + 1) * shelfheight - bookheight))
                    bookpath.addLine(to: CGPoint(x: x + shelfwidth + (m + 1) * bookwidth + m * bookwidth, y: y + shelfwidth + n * shelfwidth + (n + 1) * shelfheight))
                    allbookpath.append(bookpath)
                }
            }
            else if i == 1 {
                for j in 0..<numberofbooks {
                    let m = CGFloat(j)
                    let bookpath = UIBezierPath()
                    bookpath.move(to: CGPoint(x: x + w - shelfwidth - (m + 1) * bookwidth - m * bookwidth, y: y + shelfwidth + n * shelfwidth + (n + 1) * shelfheight - bookheight))
                    bookpath.addLine(to: CGPoint(x: x + w - shelfwidth - (m + 1) * bookwidth - m * bookwidth, y: y + shelfwidth + n * shelfwidth + (n + 1) * shelfheight))
                    allbookpath.append(bookpath)
                }
                
                let b = CGFloat(numberofbooks)
                let bookpath = UIBezierPath()
                bookpath.move(to: CGPoint(x: x + w - shelfwidth - (2 * b + 1) * bookwidth, y: y + shelfwidth + n * shelfwidth + (n + 1) * shelfheight - bookheight))
                bookpath.addLine(to: CGPoint(x: x + w - shelfwidth - (2 * b + 1) * bookwidth - 2 * bookwidth, y: y + shelfwidth + n * shelfwidth + (n + 1) * shelfheight))
                allbookpath.append(bookpath)
                
            }
            else {
                //only draw books on first and second layers
            }
            
        }
        
        shelf.path = allshelfpath.cgPath
        bookshelf.addSublayer(shelf)
        books.path = allbookpath.cgPath
        bookshelf.addSublayer(books)
        
        return bookshelf
        
    }
    
    private func drawWinerack(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat, numberoflayers: Int, numberofbottles: Int) -> CAShapeLayer {
        let sizeofrackwidth: CGFloat = 80
        let sizeofwidthpadding: CGFloat = 5
        let sizeofbottlewidth: CGFloat = 10
        let sizeofbottleneckwidth: CGFloat = 30
        let sizeofbottleheightofwidth: CGFloat = 400
        let sizeofbottleneckheight: CGFloat = 30
        let sizeofbottlecurveheightofheight: CGFloat = 15
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

        let rackwidth = w * sizeofrackwidth / 100
        let widthpadding = w * sizeofwidthpadding / 100
        var bottlewidth = w * sizeofbottlewidth / 100
        var bottleneckwidth = bottlewidth * sizeofbottleneckwidth / 100
        let linewidth = w * sizeoflinewidth / 100
        let shelfheight = h / CGFloat(numberoflayers + 1)
        
        if (h - linewidth) / CGFloat(numberoflayers+1) < bottlewidth {
            bottlewidth = (h - linewidth) / CGFloat(numberoflayers+1)
            bottleneckwidth = bottlewidth * sizeofbottleneckwidth / 100
        }
        let bottleareawidth = rackwidth / CGFloat(numberofbottles)
        let skip: (row: Int,col: Int) = (2,1)
        let bottleheight = bottlewidth * sizeofbottleheightofwidth / 100
        let bottleneckheight = bottleheight * sizeofbottleneckheight / 100
        let bottlecurve = bottleheight * sizeofbottlecurveheightofheight / 100
        
        let winerace = CAShapeLayer()
        
        let frame = CAShapeLayer()
        let framepath = UIBezierPath()
        framepath.move(to: CGPoint(x: x, y: y + h))
        framepath.addLine(to: CGPoint(x: x, y: y))
        framepath.addLine(to: CGPoint(x: x + rackwidth, y: y))
        framepath.addLine(to: CGPoint(x: x + rackwidth, y: y + h))
        frame.lineWidth = linewidth
        frame.fillColor = bgcolor.cgColor
        frame.strokeColor = strokecolor.cgColor
        frame.lineJoin = kCALineJoinRound
        frame.path = framepath.cgPath
        winerace.addSublayer(frame)
        
        let shelfs = CAShapeLayer()
        let shelfpath = UIBezierPath()
        for i in 0..<numberoflayers {
            let n = CGFloat(i)
            let shelf = UIBezierPath()
            shelf.move(to: CGPoint(x: x, y: y + (n + 1) * shelfheight))
            shelf.addLine(to: CGPoint(x: x + rackwidth, y: y + (n + 1) * shelfheight))
            shelfpath.append(shelf)
        }
        shelfs.lineWidth = borderwidth
        shelfs.lineCap = kCALineCapRound
        shelfs.strokeColor = strokecolor.cgColor
        shelfs.path = shelfpath.cgPath
        winerace.addSublayer(shelfs)
        
        let bottles = CAShapeLayer()
        let bottlespath = UIBezierPath()
        for i in 0..<numberoflayers {
            let n = CGFloat(i)
            for j in 0..<numberofbottles {
                let m = CGFloat(j)
                if i == skip.row && j == skip.col {
                    //skip this bottle
                }
                else {
                    bottlespath.append(UIBezierPath(ovalIn: CGRect(x: x + bottleareawidth / 2 - bottlewidth / 2 + m * bottleareawidth, y: y + (n + 1) * shelfheight - bottlewidth, width: bottlewidth, height: bottlewidth)))
                }
            }
        }
        bottles.fillColor = fillcolor.cgColor
        bottles.strokeColor = strokecolor.cgColor
        bottles.lineWidth = borderwidth
        bottles.path = bottlespath.cgPath
        winerace.addSublayer(bottles)
        
        let bottlex = x + rackwidth + widthpadding
        
        let bottle = CAShapeLayer()
        let bottlepath = UIBezierPath()
        bottlepath.move(to: CGPoint(x: bottlex, y: y + h))
        bottlepath.addLine(to: CGPoint(x: bottlex, y: y + h - bottleheight + bottleneckheight + bottlecurve))
        bottlepath.addQuadCurve(to: CGPoint(x: bottlex + bottlewidth / 2 - bottleneckwidth / 2, y: y + h - bottleheight + bottleneckheight), controlPoint: CGPoint(x: bottlex + bottlewidth / 8, y: y + h - bottleheight + bottleneckheight + bottlecurve / 3))
        bottlepath.addLine(to: CGPoint(x: bottlex + bottlewidth / 2 - bottleneckwidth / 2, y: y + h - bottleheight))
        bottlepath.addLine(to: CGPoint(x: bottlex + bottlewidth / 2 + bottleneckwidth / 2, y: y + h - bottleheight))
        bottlepath.addLine(to: CGPoint(x: bottlex + bottlewidth / 2 + bottleneckwidth / 2, y: y + h - bottleheight + bottleneckheight))
        bottlepath.addQuadCurve(to: CGPoint(x: bottlex + bottlewidth, y: y + h - bottleheight + bottleneckheight + bottlecurve), controlPoint: CGPoint(x: bottlex + 7 * bottlewidth / 8, y: y + h - bottleheight + bottleneckheight + bottlecurve / 3))
        bottlepath.addLine(to: CGPoint(x: bottlex + bottlewidth, y: y + h))
        bottlepath.close()
        bottle.fillColor = fillcolor.cgColor
        bottle.strokeColor = strokecolor.cgColor
        bottle.lineWidth = borderwidth
        bottle.lineJoin = kCALineJoinRound
        bottle.path = bottlepath.cgPath
        winerace.addSublayer(bottle)
        
        return winerace
        
    }
    
    private func drawMirror(type: UIMirrorType, rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofframewidth: CGFloat = 6
        let sizeofshadowwidth: CGFloat = 10
        let sizeofshadowheight: CGFloat = 20
        let sizeofshadowpadding: CGFloat = 15
        
        let x = rect.origin.x
        let y = rect.origin.y
        let w = rect.size.width
        let h = rect.size.height
        
        let framewidth = w * sizeofframewidth / 100
        let shadowwidth = w * sizeofshadowwidth / 100
        let shadowheight = h * sizeofshadowheight / 100
        let shadowpadding = w * sizeofshadowpadding / 100
        
        let mirror = CAShapeLayer()
        let frame = CAShapeLayer()
        switch type {
        case .circle:
            frame.path = UIBezierPath(ovalIn: rect).cgPath
        case .rectangle:
            frame.path = UIBezierPath(rect: rect).cgPath
        }
        frame.lineWidth = framewidth
        frame.lineJoin = kCALineJoinRound
        frame.fillColor = bgcolor.cgColor
        frame.strokeColor = strokecolor.cgColor
        mirror.addSublayer(frame)
        
        let shadow = CAShapeLayer()
        let shadowpath = UIBezierPath()
        let shadow1 = UIBezierPath()
        shadow1.move(to: CGPoint(x: x + w - shadowpadding, y: y + h / 2 - shadowheight / 2))
        shadow1.addLine(to: CGPoint(x: x + shadowpadding + shadowwidth, y: y + h / 2 + shadowheight / 2))
        shadowpath.append(shadow1)
        let shadow2 = UIBezierPath()
        shadow2.move(to: CGPoint(x: x + w - shadowpadding - shadowwidth, y: y + h / 2 - shadowheight / 2))
        shadow2.addLine(to: CGPoint(x: x + shadowpadding, y: y + h / 2 + shadowheight / 2))
        shadowpath.append(shadow2)
        shadow.strokeColor = fillcolor.cgColor
        shadow.lineWidth = borderwidth
        shadow.lineCap = kCALineCapRound
        shadow.path = shadowpath.cgPath
        mirror.addSublayer(shadow)
        
        return mirror
        
    }
    
    private func drawPatioSet(rect: CGRect, fillcolor: UIColor, strokecolor: UIColor, bgcolor: UIColor, borderwidth: CGFloat) -> CAShapeLayer {
        
        let sizeofumbrallaheight: CGFloat = 30
        let sizeoftableheight: CGFloat = 35
        let sizeoftablewidth: CGFloat = 60
        let sizeofbottomwidth: CGFloat = 25
        let sizeofchairheight: CGFloat = 55
        let sizeofchairwidth: CGFloat = 33
        let sizeofsitheight: CGFloat = 25
        let sizeofcurve: CGFloat = 8
        let sizeoflinewidth: CGFloat = 3
        
        let r = makeSquare(rect: rect)
        
        let unbrellaheight = r.h * sizeofumbrallaheight / 100
        let tableheight = r.h * sizeoftableheight / 100
        let tablewidth = r.w * sizeoftablewidth / 100
        let bottomwidth = r.w * sizeofbottomwidth / 100
        let chairheight = r.h * sizeofchairheight / 100
        let chairwidth = r.w * sizeofchairwidth / 100
        let sitheight = r.h * sizeofsitheight / 100
        let curvewidth = r.w * sizeofcurve / 100
        let linewidth = r.w * sizeoflinewidth / 100
        
        let patioset = CAShapeLayer()
        let umbrella = CAShapeLayer()
        let umbrellapath = UIBezierPath()
        umbrellapath.move(to: CGPoint(x: r.x, y: r.y + unbrellaheight))
        umbrellapath.addLine(to: CGPoint(x: r.x + r.w, y: r.y + unbrellaheight))
        umbrellapath.addQuadCurve(to: CGPoint(x: r.x, y: r.y + unbrellaheight), controlPoint: CGPoint(x: r.x + r.w / 2, y: r.y))
        umbrella.fillColor = fillcolor.cgColor
        umbrella.strokeColor = strokecolor.cgColor
        umbrella.lineWidth = borderwidth
        umbrella.lineJoin = kCALineJoinRound
        umbrella.path = umbrellapath.cgPath
        
        patioset.addSublayer(umbrella)
        
        let others = CAShapeLayer()
        let path = UIBezierPath()
        //pole
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: r.x + r.w / 2, y: r.y + unbrellaheight))
        path1.addLine(to: CGPoint(x: r.x + r.w / 2, y: r.y + r.h))
        //table
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: r.x + (r.w - tablewidth) / 2, y: r.y + r.h - tableheight))
        path2.addLine(to: CGPoint(x: r.x + (r.w - tablewidth) / 2 + tablewidth, y: r.y + r.h - tableheight))
        //bottom
        let path3 = UIBezierPath()
        path3.move(to: CGPoint(x: r.x + (r.w - bottomwidth) / 2, y: r.y + r.h))
        path3.addLine(to: CGPoint(x: r.x + (r.w - bottomwidth) / 2 + bottomwidth, y: r.y + r.h))
        //chair1
        let path4 = UIBezierPath()
        path4.move(to: CGPoint(x: r.x, y: r.y + r.h - chairheight))
        path4.addLine(to: CGPoint(x: r.x + curvewidth, y: r.y + r.h - sitheight))
        path4.addLine(to: CGPoint(x: r.x + chairwidth, y: r.y + r.h - sitheight))
        let path5 = UIBezierPath()
        path5.move(to: CGPoint(x: r.x + curvewidth, y: r.y + r.h - sitheight))
        path5.addLine(to: CGPoint(x: r.x, y: r.y + r.h))
        let path6 = UIBezierPath()
        path6.move(to: CGPoint(x: r.x + 3 * chairwidth / 4, y: r.y + r.h - sitheight))
        path6.addLine(to: CGPoint(x: r.x + chairwidth - linewidth, y: r.y + r.h))
        //chair2
        let path7 = UIBezierPath()
        path7.move(to: CGPoint(x: r.x + r.w, y: r.y + r.h - chairheight))
        path7.addLine(to: CGPoint(x: r.x + r.w - curvewidth, y: r.y + r.h - sitheight))
        path7.addLine(to: CGPoint(x: r.x + r.w - chairwidth, y: r.y + r.h - sitheight))
        let path8 = UIBezierPath()
        path8.move(to: CGPoint(x: r.x + r.w - curvewidth, y: r.y + r.h - sitheight))
        path8.addLine(to: CGPoint(x: r.x + r.w, y: r.y + r.h))
        let path9 = UIBezierPath()
        path9.move(to: CGPoint(x: r.x + r.w - 3 * chairwidth / 4, y: r.y + r.h - sitheight))
        path9.addLine(to: CGPoint(x: r.x + r.w - chairwidth + linewidth, y: r.y + r.h))
        path.append(path1)
        path.append(path2)
        path.append(path3)
        path.append(path4)
        path.append(path5)
        path.append(path6)
        path.append(path7)
        path.append(path8)
        path.append(path9)
        
        others.fillColor = bgcolor.cgColor
        others.strokeColor = strokecolor.cgColor
        others.lineWidth = linewidth
        others.lineCap = kCALineCapRound
        others.path = path.cgPath
        
        patioset.addSublayer(others)
        
        return patioset
        
    }
    
}
