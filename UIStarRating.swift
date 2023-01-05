//
//  UIStarRating.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-22.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIStarRating: UIView {
    
    internal var sizeofpadding: CGFloat {
        return 2
    }
    
    internal var emptystar: String {
        return UnicodeIcon.getUnicodeIcon(key: .WhiteStar)
    }
    internal var filledstar: String {
        return UnicodeIcon.getUnicodeIcon(key: .GlowingStar)
    }
    
    private var widthpadding: CGFloat = 0
    private var heightpadding: CGFloat = 0
    private var fontsize: CGFloat = 0
    private var label: UILabel!
    
    var _total: Int = 0
    var total: Int {
        get { return _total }
        set(newvalue) {
            if newvalue != _total {
                _total = newvalue
                getSizeInfo()
                setNeedsDisplay()
            }
        }
    }
    
    var _rating: Int = 0
    var rating: Int {
        get { return _rating }
        set(newvalue) {
            if newvalue != _rating {
                _rating = newvalue
                setNeedsDisplay()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        getSizeInfo()
        
        label = UILabel(frame: frame)
        label.textAlignment = .center
        label.font = label.font.withSize(fontsize)
        label.text = getStarText()
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        label.text = getStarText()
    }
    
    private func getSizeInfo() {
        widthpadding = frame.size.width * sizeofpadding / 100
        heightpadding = frame.size.height * sizeofpadding / 100
        
        let w = (frame.size.width - (CGFloat(total) + 1) * widthpadding) / CGFloat(total)
        let h = frame.size.height - 2 * heightpadding
        fontsize = h > w ? w : h
    }
    
    private func getStarText() -> String {
        var text: String = ""
        
        for i in 0..<total {
            if rating > i {
                text = text + filledstar
            }
            else {
                text = text + emptystar
            }
        }
        return text
    }
    
}
