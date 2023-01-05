//
//  UIAlarmIcon.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-01-23.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIAlarmIcon: UIView {
    
    let alarmicon: String = UnicodeIcon.getUnicodeIcon(key: .ClosedBook)
    let padding: CGFloat = 3
    let normalcolor: UIColor = .black
    let alarmcolor: UIColor = .red
    
    var _alarmnumber: Int = 0
    var alarmnumber: Int {
        get { return _alarmnumber }
        set(newvalue) {
            if newvalue != _alarmnumber {
                _alarmnumber = newvalue
                setNeedsDisplay()
            }
        }
    }
    
    var iconlabel: UILabel!
    var numberlabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        iconlabel = UILabel(frame: CGRect(x: 0, y: frame.size.height / 3, width: frame.size.width * 2 / 3, height: frame.size.height * 2 / 3))
        iconlabel.text = alarmicon
        iconlabel.textAlignment = .center
        iconlabel.font = iconlabel.font.withSize(frame.size.width * 2 / 3 - 2 * padding)
        
        addSubview(iconlabel)
        
        numberlabel = UILabel(frame: CGRect(x: frame.size.width / 3, y: 0, width: frame.size.width * 2 / 3, height: frame.size.height / 3))
        numberlabel.text = "0"
        numberlabel.font = numberlabel.font.withSize(frame.size.height / 3 - 2 * padding)
        numberlabel.textAlignment = .center
        
        addSubview(numberlabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        numberlabel.text = String(alarmnumber)
        if alarmnumber == 0 {
            numberlabel.textColor = normalcolor
        }
        else {
            numberlabel.textColor = alarmcolor
        }
    }
    
    
}
