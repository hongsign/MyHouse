//
//  Stair.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class Stair: Place {
    
    override init() {
        super.init()
        
        placetype = .Stair
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        placetype = .Stair
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }

    
}
