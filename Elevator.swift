//
//  Elevator.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Elevator: Place {
    
    override init() {
        super.init()
        
        placetype = .Elevator
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        placetype = .Elevator
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
 
}
