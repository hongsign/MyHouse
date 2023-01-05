//
//  Sunroom.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Sunroom: Room {

    override init() {
        super.init()
        
        roomtype = .Sunroom
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        roomtype = .Sunroom
    }
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }

    
}
