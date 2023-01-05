//
//  UIFence.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

enum UIFenceType: String {
    case wood
    case iron
}

class UIFence: UIHouseViewBase {
    
    
    
    var _fencetype: UIFenceType = .iron
    var fencetype: UIFenceType {
        get { return _fencetype }
        set(newvalue) {
            if newvalue != _fencetype {
                _fencetype = newvalue
                reDisplay()
            }
        }
    }
    
    //BEGIN: fencetype - iron
    var _numberofoutterpoles: CGFloat = 3
    var numberofoutterpoles: CGFloat {
        get { return _numberofoutterpoles }
        set(newvalue) {
            if newvalue != _numberofoutterpoles {
                _numberofoutterpoles = newvalue
                if fencetype == .iron {
                    reDisplay()
                }
            }
        }
    }
    
    var _numberofinnerpoles: CGFloat = 4
    var numberofinnerpoles: CGFloat {
        get { return _numberofinnerpoles }
        set(newvalue) {
            if newvalue != _numberofinnerpoles {
                _numberofinnerpoles = newvalue
                if fencetype == .iron {
                    reDisplay()
                }
            }
        }
    }
    //END: fencetype - iron
    
    //BEGIN: fencetype - wood
    var _numberofpoles: CGFloat = 5
    var numberofpoles: CGFloat {
        get { return _numberofpoles }
        set(newvalue) {
            if newvalue != _numberofpoles {
                _numberofpoles = newvalue
                if fencetype == .wood {
                    reDisplay()
                }
            }
        }
    }

    //END: fencetype - wood
    
    // BEGIN: fencetype - wood
    private let paddingoffirstpole: CGFloat = 10
    private let positionoftopbanner: CGFloat = 30
    private let positionofbottombanner: CGFloat = 70
    private let widthofpole: CGFloat = 10
    private let sizeofpoletop: CGFloat = 10
    private let sizeofbanner: CGFloat = 10
    
    
    private var p1: CGPoint = .zero
    private var p2: CGPoint = .zero
    private var p3: CGPoint = .zero
    private var p4: CGPoint = .zero
    private var p5: CGPoint = .zero
    private var polepadding: CGFloat = 0
    private var xofpoleoffset: CGFloat = 0
    private var polewidth: CGFloat = 0
    private var poletopheight: CGFloat = 0
    // END: fencetype - wood
    
    //BEGIN: fencetype - iron
    private let sizeofoutterpole: CGFloat = 10
    private let sizeoftoppolepadding: CGFloat = 30
    private let sizeofinnerbanner: CGFloat = 40
    private let positionofinnertopbanner: CGFloat = 30
    private let positionofinnerbottombanner: CGFloat = 70
    private let sizeofcornerradiusofinnerpole: CGFloat = 15
    
    private var outterpolewidth: CGFloat = 0
    private var outterpolewidthwithpadding: CGFloat = 0
    private var toppadding: CGFloat = 0
    private var innerwidth: CGFloat = 0
    private var innerpolewidth: CGFloat = 0
    private var innerpoleoffset: CGFloat = 0
    //END: fencetype -iron
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .fence
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .fence
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        layers.removeAll()
        
        let cornerradius: CGFloat = 5
        
        switch fencetype {
        case .wood:
            //BEGIN: fencetype - wood
            polepadding = rect.size.width * paddingoffirstpole / 100
            xofpoleoffset = rect.size.width * (100 - paddingoffirstpole) / numberofpoles / 100
            polewidth = rect.size.width * widthofpole / 100
            poletopheight = rect.size.height * sizeofpoletop / 100
            
            
            let polepath = UIBezierPath()
            
            let pole = CAShapeLayer()
            pole.fillColor = fillcolor.cgColor
            pole.strokeColor = bordercolor.cgColor
            pole.lineWidth = borderwidth
            pole.lineJoin = kCALineJoinMiter
            
            for num in 0..<Int(numberofpoles) {
                getPointsOfPole(rect: rect,num: CGFloat(num))
                polepath.move(to: p1)
                polepath.addLine(to: p2)
                polepath.addLine(to: p3)
                polepath.addLine(to: p4)
                polepath.addLine(to: p5)
                polepath.close()
                pole.path = polepath.cgPath
                //layer.addSublayer(pole)
                layers.append(pole)
            }
            
            let topbanner = CAShapeLayer()
            topbanner.fillColor = fillcolor.cgColor
            topbanner.strokeColor = bordercolor.cgColor
            topbanner.lineWidth = borderwidth
            topbanner.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x, y: rect.origin.y + rect.size.height * positionoftopbanner / 100, width: rect.size.width, height: rect.size.height * sizeofbanner / 100), cornerRadius: cornerradius).cgPath
            //layer.addSublayer(topbanner)
            layers.append(topbanner)
            
            let bottombanner = CAShapeLayer()
            bottombanner.fillColor = fillcolor.cgColor
            bottombanner.strokeColor = bordercolor.cgColor
            bottombanner.lineWidth = borderwidth
            bottombanner.path = UIBezierPath(roundedRect: CGRect(x: rect.origin.x, y: rect.origin.y + rect.size.height * positionofbottombanner / 100, width: rect.size.width, height: rect.size.height * sizeofbanner / 100), cornerRadius: cornerradius).cgPath
            //layer.addSublayer(bottombanner)
            layers.append(bottombanner)
        //END: fencetype - wood
        case .iron:
            //BEGIN: fencetype - iron
            outterpolewidth = rect.size.width * sizeofoutterpole / 100
            toppadding = outterpolewidth * sizeoftoppolepadding / 100
            outterpolewidthwithpadding = outterpolewidth + toppadding
            innerwidth = (rect.size.width - 2 * toppadding - numberofoutterpoles * outterpolewidth) / (numberofoutterpoles - 1)
            innerpolewidth = innerwidth / numberofinnerpoles / 3
            innerpoleoffset = (innerwidth - numberofinnerpoles * innerpolewidth) / (numberofinnerpoles + 1)
            
            let cornerradiusofinnerpole = innerpolewidth * sizeofcornerradiusofinnerpole / 100
            
            let outterpole = CAShapeLayer()
            outterpole.fillColor = fillcolor.cgColor
            outterpole.strokeColor = bordercolor.cgColor
            outterpole.lineWidth = borderwidth
            
            let points = getPointsOfOutterPoles(rect: rect)
            let outterpolepath = UIBezierPath()
            outterpolepath.move(to: points[0])
            for i in 1..<points.count {
                outterpolepath.addLine(to: points[i])
            }
            outterpolepath.close()
            outterpole.path = outterpolepath.cgPath
            //layer.addSublayer(outterpole)
            layers.append(outterpole)
            
            
            for i in 0..<Int(numberofoutterpoles)-1 {
                let num = CGFloat(i)
                let rects = getRectsOfInnerPoles(rect: rect, num: num)
                for j in 0..<rects.count {
                    let innerpole = CAShapeLayer()
                    innerpole.fillColor = bordercolor.cgColor
                    innerpole.strokeColor = bordercolor.cgColor
                    innerpole.lineWidth = borderwidth
                    innerpole.path = UIBezierPath(roundedRect: rects[j], cornerRadius: cornerradiusofinnerpole).cgPath
                    //layer.addSublayer(innerpole)
                    layers.append(innerpole)
                }
                
                let bannerrects = getRectsOfInnerBanners(rect: rect, num: num)
                for j in 0..<bannerrects.count {
                    let banner = CAShapeLayer()
                    banner.fillColor = bordercolor.cgColor
                    banner.strokeColor = bordercolor.cgColor
                    banner.lineWidth = borderwidth
                    banner.path = UIBezierPath(roundedRect: bannerrects[j], cornerRadius: cornerradiusofinnerpole).cgPath
                    //layer.addSublayer(banner)
                    layers.append(banner)
                }
                
            }
            //END: fencetype -iron
            
        } //END: switch

    }
    
    private func getPointsOfPole(rect: CGRect, num: CGFloat) {
        p1.x = rect.origin.x + polepadding + xofpoleoffset * num + polewidth / 2
        p1.y = rect.origin.y
        p2.x = rect.origin.x + polepadding + xofpoleoffset * num
        p2.y = rect.origin.y + poletopheight
        p3.x = p2.x
        p3.y = rect.origin.y + rect.size.height
        p4.x = p2.x + polewidth
        p4.y = p3.y
        p5.x = p4.x
        p5.y = p2.y
    }
    
    private func getPointsOfOutterPoles(rect: CGRect) -> [CGPoint] {
        var points = [CGPoint]()
        points.append(CGPoint(x: rect.origin.x, y: rect.origin.y))
        points.append(CGPoint(x: rect.origin.x, y: rect.origin.y + outterpolewidth))
        points.append(CGPoint(x: rect.origin.x + toppadding, y: rect.origin.y + outterpolewidth))
        points.append(CGPoint(x: rect.origin.x + toppadding, y: rect.origin.y + rect.size.height))
        points.append(CGPoint(x: rect.origin.x + rect.size.width - toppadding, y: rect.origin.y + rect.size.height))
        points.append(CGPoint(x: rect.origin.x + rect.size.width - toppadding, y: rect.origin.y + outterpolewidth))
        points.append(CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + outterpolewidth))
        points.append(CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y))
        points.append(CGPoint(x: rect.origin.x + rect.size.width - 2 * toppadding - outterpolewidth, y: rect.origin.y))
        points.append(CGPoint(x: rect.origin.x + rect.size.width - 2 * toppadding - outterpolewidth, y: rect.origin.y + outterpolewidth))
        points.append(CGPoint(x: rect.origin.x + rect.size.width - toppadding - outterpolewidth, y: rect.origin.y + outterpolewidth))
        points.append(CGPoint(x: rect.origin.x + rect.size.width - toppadding - outterpolewidth, y: rect.origin.y + rect.size.height - outterpolewidth))
        
        //add points of outterpoles in the middle. It is all outterpoles minor 2 (first one and last one)
        for i in 0..<Int(numberofoutterpoles)-2 {
            
            let num = CGFloat(i)
            let xofpole = rect.origin.x + rect.size.width - toppadding - outterpolewidth - (num + 1) * innerwidth - num * outterpolewidth
            
            points.append(CGPoint(x: xofpole, y: rect.origin.y + rect.size.height - outterpolewidth))
            points.append(CGPoint(x: xofpole, y: rect.origin.y + outterpolewidth))
            points.append(CGPoint(x: xofpole + toppadding, y: rect.origin.y + outterpolewidth))
            points.append(CGPoint(x: xofpole + toppadding, y: rect.origin.y))
            points.append(CGPoint(x: xofpole - outterpolewidth - toppadding, y: rect.origin.y))
            points.append(CGPoint(x: xofpole - outterpolewidth - toppadding, y: rect.origin.y + outterpolewidth))
            points.append(CGPoint(x: xofpole - outterpolewidth, y: rect.origin.y + outterpolewidth))
            points.append(CGPoint(x: xofpole - outterpolewidth, y: rect.origin.y + rect.size.height - outterpolewidth))
        }
        
        points.append(CGPoint(x: rect.origin.x + toppadding + outterpolewidth, y: rect.origin.y + rect.size.height - outterpolewidth))
        points.append(CGPoint(x: rect.origin.x + toppadding + outterpolewidth, y: rect.origin.y + outterpolewidth))
        points.append(CGPoint(x: rect.origin.x + 2 * toppadding + outterpolewidth, y: rect.origin.y + outterpolewidth))
        points.append(CGPoint(x: rect.origin.x + 2 * toppadding + outterpolewidth, y: rect.origin.y))
        return points
    }
    
    private func getRectsOfInnerPoles(rect: CGRect, num: CGFloat) -> [CGRect] {
        let xofinner = rect.origin.x + outterpolewidthwithpadding + num * outterpolewidth + num * innerwidth
        var rects = [CGRect]()
        for i in 0..<Int(numberofinnerpoles) {
            let n = CGFloat(i)
            rects.append(CGRect(x: xofinner + (n + 1) * innerpoleoffset + n * innerpolewidth, y: rect.origin.y + outterpolewidth + toppadding, width: innerpolewidth, height: rect.size.height - 2 * outterpolewidth - toppadding))
        }
        
        return rects
    }
    
    private func getRectsOfInnerBanners(rect: CGRect, num: CGFloat) -> [CGRect] {
        let xofinner = rect.origin.x + outterpolewidthwithpadding + num * outterpolewidth + num * innerwidth
        let yofinner = rect.origin.y + outterpolewidth + toppadding
        let heightofinner = rect.size.height - 2 * outterpolewidth - toppadding
        var rects = [CGRect]()
        
        rects.append(CGRect(x: xofinner, y: yofinner + heightofinner * positionofinnertopbanner / 100, width: innerwidth, height: innerpolewidth * sizeofinnerbanner / 100))
        rects.append(CGRect(x: xofinner, y: yofinner + heightofinner * positionofinnerbottombanner / 100, width: innerwidth, height: innerpolewidth * sizeofinnerbanner / 100))
        
        return rects
    }

}
