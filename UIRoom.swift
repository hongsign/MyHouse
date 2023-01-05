//
//  UIRoom.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-07.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIRoom: UIHouseViewBase {
    
    private let sizeofcontrolrectpadding: CGFloat = 2
    
    private let maxsizeofcontrolrectfontsize: CGFloat = 10
    
    internal var sizeofheight: CGFloat {
        get { return 80 }
    }
    internal var sizeofwidth: CGFloat {
        get { return 100 }
    }
    internal var sizeofpadding: CGFloat {
        get { return 3 }
    }
    
    var position: RoomPosition = (storeyid: 0, positionid: 0)
    
    var controlrect: CGRect = .zero
    var textrect: CGRect = .zero
    var drawrect: CGRect = .zero
    
    var textsize: CGFloat = 10
    
    var _textcolor: UIColor = .black
    var textcolor: UIColor {
        get { return _textcolor }
        set(newvalue) {
            if newvalue != _textcolor {
                _textcolor = newvalue
                reDisplay()
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .room
        category = .room
        setupControlRect()
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .room
        category = .room
        setupControlRect()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        /*
        if !islabelrequiredfordisplayname {
            let text = displayname as NSString
            let attributes = [
                NSFontAttributeName: UIFont.systemFont(ofSize: textsize),
                NSForegroundColorAttributeName: textcolor
                ] as [String : Any]
            
            //let stringsize = text.size(attributes: attributes)
            text.draw(in: textrect, withAttributes: attributes)
        }
         */
    }
    
    override func drawLayers(rect: CGRect) {
        
        let padding = sizeofpadding * rect.size.height / 100
        
        drawrect.origin.x = rect.origin.x + padding
        drawrect.origin.y = rect.origin.y + rect.size.height - rect.size.height * sizeofheight / 100 + padding
        drawrect.size.width = rect.size.width * sizeofwidth / 100 - 2 * padding
        drawrect.size.height = rect.size.height * sizeofheight / 100 - 2 * padding
        
        layer.borderColor = bordercolor.cgColor
        layer.borderWidth = borderwidth
        
        
        
    }
    
    
    private func setupControlRect() {
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        var w: CGFloat = frame.size.width * sizeofwidth / 100
        var h: CGFloat = frame.size.height - frame.size.height * sizeofheight / 100
        
        let padding = w * sizeofcontrolrectpadding / 100
        x = x + padding
        y = y + padding
        w = w - 2 * padding
        h = h - 2 * padding
        
        controlrect.origin.x = x
        controlrect.origin.y = y
        controlrect.size.width = w
        controlrect.size.height = h
        
        let numberofchars = displayname.characters.count
        let fontsizefromwidth = w / CGFloat(numberofchars)
        let fontsizefromheight = h
        textsize = fontsizefromwidth > fontsizefromheight ? fontsizefromheight : fontsizefromwidth
        textsize = textsize > maxsizeofcontrolrectfontsize ? maxsizeofcontrolrectfontsize : textsize

        
        let textwidth = textsize * CGFloat(numberofchars)
        let textheight = textsize
        textrect.origin.x = x + (w - textwidth) / 2
        textrect.origin.y = y + (h - textheight) / 2
        textrect.size.width = textwidth
        textrect.size.height = textheight
        
    }

}
