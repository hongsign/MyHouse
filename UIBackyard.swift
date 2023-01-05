//
//  UIBackyard.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIBackyard: UIPlace {
    
    let sizeofoutterwidthofheight: CGFloat = 28
    let sizeofpadding: CGFloat = 2
    
    internal var hasborder: Bool {
        get { return true }
    }
    
    var _numberofinnerrects: Int = 3
    var numberofinnerrects: Int {
        get { return _numberofinnerrects }
        set(newvalue) {
            if newvalue != _numberofinnerrects {
                _numberofinnerrects = newvalue
                reDisplay()
            }
        }
    }
    
    private var r: UIRect = (x: 0, y: 0, w: 0, h: 0)
    private var outterwidth: CGFloat = 0
    private var innerwidth: CGFloat = 0
    private var padding: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewid = .backyard
        category = .place
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        viewid = .backyard
        category = .place
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        layers.removeAll()
        
        autoResize(rect: rect)
        
        if hasborder {
            //draw a border here
        }
        
        layers.append(UIDrawHelper.instance.garden.drawGarden(type: .grass, rect: CGRect(x: r.x, y: r.y, width: outterwidth, height: outterwidth), fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        layers.append(UIDrawHelper.instance.garden.drawGarden(type: .grass, rect: CGRect(x: r.x, y: r.y + r.h - outterwidth, width: outterwidth, height: outterwidth), fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        layers.append(UIDrawHelper.instance.garden.drawGarden(type: .grass, rect: CGRect(x: r.x + r.w - outterwidth, y: r.y, width: outterwidth, height: outterwidth), fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        layers.append(UIDrawHelper.instance.garden.drawGarden(type: .grass, rect: CGRect(x: r.x + r.w - outterwidth, y: r.y + r.h - outterwidth, width: outterwidth, height: outterwidth), fillcolor: fillcolor, strokecolor: bordercolor, borderwidth: borderwidth))
        
    }
    
    func getInnerRects(number: Int) -> CGRect {
        
        if number > numberofinnerrects || number <= 0 {
            return .zero
        }
        let n = CGFloat(number)
        return CGRect(x: frame.origin.x + r.x + outterwidth + (n - 1) * innerwidth + (n - 1) * padding, y: frame.origin.y + r.y + outterwidth, width: innerwidth, height: innerwidth)
    }

    
    private func autoResize(rect: CGRect) {
        
        padding = r.w * sizeofpadding / 100
        
        let sizeofinnerwidthofheight: CGFloat = 100 - 2 * sizeofoutterwidthofheight
        
        r.x = rect.origin.x
        r.y = rect.origin.y
        r.w = rect.size.width
        r.h = rect.size.height
        
        outterwidth = r.h * sizeofoutterwidthofheight / 100
        innerwidth = r.h - 2 * outterwidth
        let width = CGFloat(numberofinnerrects) * innerwidth + outterwidth
        
        if width > r.w {
            outterwidth = sizeofoutterwidthofheight * r.w / (CGFloat(numberofinnerrects) * sizeofinnerwidthofheight + sizeofoutterwidthofheight)
            r.h = outterwidth * 100 / sizeofoutterwidthofheight
            r.y = r.y + (rect.size.height - r.h) / 2
            innerwidth = r.h - 2 * outterwidth
        }
        else {
            r.x = r.x + (r.w - width) / 2
            r.w = width
        }
        
        
    }

}
