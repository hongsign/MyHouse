//
//  Bathroom.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Bathroom: Room {

    override init() {
        super.init()
        
        roomtype = .Bathroom
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        roomtype = .Bathroom
    }

    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
    
}
