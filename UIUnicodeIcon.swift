//
//  UIUnicodeIcon.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-01-23.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIUnicodeIcon: UILabel {
    
    private let sizeofpadding: CGFloat = 7
    private var padding: CGFloat = 0
    
    var key: UnicodeIcon.UnicodeIconKey = UnicodeIcon.UnicodeIconKey.Ant
    var thetext: String = ""
    var size: CGFloat = 10
    
    init(frame: CGRect, key: UnicodeIcon.UnicodeIconKey, size: CGFloat, thetext: String?="") {
        super.init(frame: frame)
        
        padding = frame.size.width * sizeofpadding / 100
        
        if let txt = thetext {
            self.thetext = txt
        }
        else {
            self.thetext = ""
        }
        
        self.key = key
        self.size = size
        
        setDisplay()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeOnlyKey(key: UnicodeIcon.UnicodeIconKey) {
        self.key = key
        text = UnicodeIcon.getUnicodeIcon(key: key)
    }
    
    func change(key: UnicodeIcon.UnicodeIconKey) {
        self.key = key
        setDisplay()
        
        setNeedsDisplay()
    }
    
    private func setDisplay() {
        self.textAlignment = .center
        self.font = font.withSize(size - 2 * padding)
        if (thetext.characters.count) > 0 {
            text = UnicodeIcon.getUnicodeIcon(key: key) + " " + thetext
        }
        else {
            text = UnicodeIcon.getUnicodeIcon(key: key)
        }
    }
    
}

