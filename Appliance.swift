//
//  Appliance.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class Appliance: Article {
    
    var _powertype: PowerType = PowerType.Battery
    var powertype: PowerType {
        get { return _powertype }
        set(newvalue) {
            if newvalue != _powertype {
                _powertype = newvalue
            }
        }
    }
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
        
        isappliance = true
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        isappliance = true
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        _powertype <- map["_powertype"]
    }
    
}
