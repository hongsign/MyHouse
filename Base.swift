//
//  Base.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-01.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class Base: Mappable {
    
    internal var version: String = "1.0"
    
    var isarticle: Bool {
        get { return false }
    }
    
    
    //where the thing belongs to. It is unique id of corresponding UIView
    var containerid: Int = 0
    
    var _id: Int = 0
    var id: Int {
        get { return _id }
        set(newvalue) {
            if newvalue != _id {
                _id = newvalue
            }
        }
    }
    
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        version <- map["version"]
        _id <- map["_id"]
        containerid <- map["containerid"]
    }
}
