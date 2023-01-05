//
//  Hall.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Hall: Room {

    override init() {
        super.init()
        
        roomtype = .Hall
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        roomtype = .Hall
    }

    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
    
}
