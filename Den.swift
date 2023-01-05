//
//  Den.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Den: Room {

    override init() {
        super.init()
        
        roomtype = .Den
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        roomtype = .Den
    }

    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
    
}
