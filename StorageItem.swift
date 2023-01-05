//
//  StorageItem.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class StorageItem: Base {
    
    var date: String = ""
    var name: String = ""
    var description: String = ""
    
    var subid: Int = 0
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        date <- map["date"]
        name <- map["name"]
        description <- map["description"]
        subid <- map["subid"]
    }
}
