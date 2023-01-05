//
//  Cellar.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Cellar: Place {
    
    override init() {
        super.init()
        
        placetype = .Cellar
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
        placetype = .Cellar
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
    
}
