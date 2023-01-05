//
//  Storey.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-03.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

typealias StoreyPostion = (
    col: Int,
    floornumber: Int
)

class Storey: Base {
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        position <- map["position"]
    }

    var position: StoreyPostion = (0,0)
    
}
