//
//  Dressingroom.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class Dressingroom: Room {
    
    override init() {
        super.init()
        
        roomtype = .Dressingroom
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        roomtype = .Dressingroom
    }
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }

    
}
