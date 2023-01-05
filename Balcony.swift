//
//  Balcony.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-03.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class Balcony : Place {
    
    override init() {
        super.init()
        
        placetype = .Balcony
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
    
}
