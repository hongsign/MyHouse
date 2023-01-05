//
//  Driveway.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Driveway : Place {
    
    override init() {
        super.init()
        
        placetype = .Driveway
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        placetype = .Driveway
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
    
}
