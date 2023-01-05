//
//  UIDefinitions.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-01-23.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIDefinitions {
    
    static let screenwidth: CGFloat = UIScreen.main.bounds.size.width
    static let screenheight: CGFloat = UIScreen.main.bounds.size.height
    
    /*-----------------------------------------------
     Everything is percentage
    -------------------------------------------------*/
    
    /*-----------------screen padding----------------------*/
    static let sizeofpaddingtop: CGFloat = 1
    static let sizeofpaddingbottom: CGFloat = 1
    static let sizeofpaddingleft: CGFloat = 1
    static let sizeofpaddingright: CGFloat = 1

    class var paddingtop: CGFloat {
        get { return screenheight * sizeofpaddingtop / 100 }
    }
    class var paddingbottom: CGFloat {
        get { return screenheight * sizeofpaddingbottom / 100 }
    }
    class var paddingleft: CGFloat {
        get { return screenwidth * sizeofpaddingleft / 100 }
    }
    class var paddingright: CGFloat {
        get { return screenwidth * sizeofpaddingright / 100 }
    }
    
    /*-----------------topbar with padding-----------------------*/
    static let sizeoftopbarheightofscreenheight: CGFloat = 5
    static let maxheightoftopbar: CGFloat = 30
    
    class var topbarheight: CGFloat {
        get {
            var height = screenheight * sizeoftopbarheightofscreenheight / 100
            if height > maxheightoftopbar {
                height = maxheightoftopbar
            }
            return height
        }
    }
    
    static let sizeoftopbariconpadding: CGFloat = 1
    class var topbariconpadding: CGFloat {
        get { return screenwidth * sizeoftopbariconpadding / 100 }
    }
    
    /*--------------UIHouseView padding-----------------*/
    static let sizeofhouseviewpadding: CGFloat = 2
    class var houseviewpadding: CGFloat {
        get { return screenwidth * sizeofhouseviewpadding / 100 }
    }
    
    
    
}
