//
//  Closet.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Closet : Place {
    
    override init() {
        super.init()
        
        placetype = .Closet
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        placetype = .Closet
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }

    
}
