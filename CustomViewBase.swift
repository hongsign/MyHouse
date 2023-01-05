//
//  CustomViewBase.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-22.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

protocol CustomViewDelegate {
    func getArticleType()
    func populate()
}

class CustomViewBase {
    
    private let sizeoftoppadding: CGFloat = 5
    private let sizeofleftpadding: CGFloat = 5
    private let sizeofbottompadding: CGFloat = 5
    private let sizeofrightpadding: CGFloat = 5
    
    private let sizeofpadding: CGFloat = 1
    
    internal var sizeofleftwidth: CGFloat {
        get { return 60 }
    }
    internal var sizeofrightwidth: CGFloat {
        get { return 40 }
    }
    
    internal var toppadding: CGFloat = 50
    internal var leftpadding: CGFloat = 20
    internal var bottompadding: CGFloat = 60
    internal var rightpadding: CGFloat = 20
    
    internal var leftwidth: CGFloat = 60
    internal var rightwidth: CGFloat = 40
    
    internal var rowheight: CGFloat = 30
    internal var padding: CGFloat = 5
    
    internal var width: CGFloat = 0
    internal var height: CGFloat = 0
    
    var _row: Int = 1
    var row: Int {
        get { return _row }
        set(newvalue) {
            if newvalue != _row {
                _row = newvalue
                getSizeInfo()
            }
        }
    }
    
    private func getSizeInfo() {
        toppadding = UIDefinitions.screenheight * sizeoftoppadding / 100
        bottompadding = UIDefinitions.screenheight * sizeofbottompadding / 100
        leftpadding = UIDefinitions.screenwidth * sizeoftoppadding / 100
        rightpadding = UIDefinitions.screenwidth * sizeofrightpadding / 100
        padding = width * sizeofpadding / 100
        
        width = UIDefinitions.screenwidth - 3 * padding - leftpadding - rightpadding
        height = UIDefinitions.screenheight - toppadding - bottompadding
        
        leftwidth = width * sizeofleftwidth / 100
        rightwidth = width * sizeofrightwidth / 100
        
        
        
        rowheight = (height / CGFloat(row)) - 2 * padding
    }
    
    func getLeftRect(row: Int, width: CGFloat) -> CGRect {
        let r = CGFloat(row)
        return CGRect(x: padding, y: toppadding + r * rowheight, width: width, height: rowheight)
    }
    
    func getRightRect(top: CGFloat, row: Int, width: CGFloat, leftwidth: CGFloat) -> CGRect {
        let r = CGFloat(row)
        return CGRect(x: leftwidth + 2 * padding, y: toppadding + r * rowheight, width: width, height: rowheight)
    }
    
}
