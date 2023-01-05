//
//  UIHelpers.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-08.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHelpers {
    
    
    
    func makeSquare(rect: CGRect) -> UIRect {
        
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
        return (x, y, w, h)
        
    }
    
    func makeThinRectangle(rect: CGRect, sizeofwidthofheight: CGFloat) -> UIRect {
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        let width = h * sizeofwidthofheight / 100
        if width > w {
            h = w * 100 / sizeofwidthofheight
            y = y + (rect.size.height - h)
        }
        else {
            x = x + (w - width) / 2
            w = width
        }
        
        return (x, y, w, h)

    }
    
    func makeFatRectangle(rect: CGRect, sizeofheightofwidth: CGFloat) -> UIRect {
        
        var x = rect.origin.x
        var y = rect.origin.y
        var w = rect.size.width
        var h = rect.size.height
        
        let height = w * sizeofheightofwidth / 100
        if height > h {
            w = h * 100 / sizeofheightofwidth
            x = x + (rect.size.width - w) / 2
        }
        else {
            y = y + (h - height)
            h = height
        }
        return (x, y, w, h)
    }
        
        
}
