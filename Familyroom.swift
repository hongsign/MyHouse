//
//  Familyroom.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Familyroom : Room {

    override init() {
        super.init()
        
        roomtype = .Familyroom
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        roomtype = .Familyroom
    }

    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
    
}
