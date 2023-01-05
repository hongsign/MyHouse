//
//  Extensions.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-23.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

extension Character {
    var asciiValue: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}

extension NSObject {
    var theclassname: String {
        return NSStringFromClass(type(of: self))
    }
}

extension String {
    
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
    
    var boolValue: Bool {
        return NSString(string: self).boolValue
    }
    
    var intValue: Int? {
        return Int(self)
    }
    
    var doubleValue: Double? {
        return Double(self)
    }
    
    var floatValue: Float? {
        return Float(self)
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSFontAttributeName: font]
        let size = self.size(attributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSFontAttributeName: font]
        let size = self.size(attributes: fontAttributes)
        return size.height
    }
}

extension Date {
    
    //func toString() -> String {
    //    return String(.year()) + "-" + String(.month()) + "-" + String(.day())
    //}
    
    
    
    func hour() -> Int {
        //Get Hour
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.hour], from: self)
        let hour = components.hour!
        
        //Return Hour
        return hour
    }
    
    
    func minute() -> Int {
        //Get Minute
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.minute], from: self)
        let minute = components.minute!
        
        //Return Minute
        return minute
    }
    
    func year() -> Int {
        //Get Year
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year], from: self)
        let year = components.year!
        
        //Return Year
        return year
    }
    
    func month() -> Int {
        //Get Month
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.month], from: self)
        let month = components.month!
        
        //Return Month
        return month
    }
    
    func day() -> Int {
        //Get Day
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day], from: self)
        let day = components.day!
        
        //Return Day
        return day
    }
    
    func toShortTimeString() -> String {
        
        //Get Short Time String
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let timeString = formatter.string(from: self)
        
        //Return Short Time String
        return timeString
    }
    
    
    func toDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
}


