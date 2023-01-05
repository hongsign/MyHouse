//
//  UICustomTextField.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-29.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UICustomTextField: UITextField, UITextFieldDelegate {
    
    //1st feature: only show bottom border
    var isbottomborderonly: Bool = true
    //var bordercolor: UIColor = UIColor( red: 32.0/255, green: 53.0/255, blue:88.0/255, alpha: 1.0 )
    var bordercolor: UIColor = UIColor.lightGray
    
    //2nd feature: only number allowed
    var isnumberonly: Bool = false
    
    //3rd feature: limit char number
    var ischarnumberlimited: Bool = false
    var charnumberlimited: Int = 4
    
    let border = CALayer()
    let width = CGFloat(2.0)
    
    /*
     required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
     
     self.delegate = self
     
     border.borderColor = bordercolor.CGColor
     border.borderWidth = width
     self.layer.addSublayer(border)
     self.layer.masksToBounds = true
     }
     */
    
    init(frame: CGRect, bottomborderonly: Bool, numberonly: Bool) {
        super.init(frame: frame)
        
        self.delegate = self
        
        isbottomborderonly = bottomborderonly
        isnumberonly = numberonly
        
        if isbottomborderonly {
            border.borderColor = bordercolor.cgColor
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        if isbottomborderonly {
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        }
        else {
            super.draw(rect)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if isbottomborderonly {
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var ret_numberonly: Bool = true
        var ret_numberlimited: Bool = true
        
        if isnumberonly {
            // Create an `NSCharacterSet` set which includes everything *but* the digits
            let inverseSet = NSCharacterSet(charactersIn:"0123456789.").inverted
            
            // At every character in this "inverseSet" contained in the string,
            // split the string up into components which exclude the characters
            // in this inverse set
            let components = string.components(separatedBy: inverseSet)
            
            // Rejoin these components
            let filtered = components.joined(separator: "")  // use join("", components) if you are using Swift 1.2
            
            // If the original string is equal to the filtered string, i.e. if no
            // inverse characters were present to be eliminated, the input is valid
            // and the statement returns true; else it returns false
            ret_numberonly = (string == filtered)
        }
        
        if ischarnumberlimited {
            ret_numberlimited = ((textField.text?.characters.count)! < charnumberlimited)
        }
        
        //if not limit to number only
        return ret_numberonly && ret_numberlimited
        
    }
}
