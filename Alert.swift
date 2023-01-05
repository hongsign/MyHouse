//
//  Alert.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class Alert: Base {
    
    var date: String = ""
    var alertid: Int = 0
    
    var alerttype: AlertType = .Warning
    var alerttypeofarticle: AlertTypeOfArticle = .Lifespan
    var alertstatus: AlertStatus = .New
    var articleid: Int = 0
    var notes: String = ""
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        date <- map["date"]
        alertid <- map["alertid"]
        alerttype <- map["alerttype"]
        alerttypeofarticle <- map["alerttypeofarticle"]
        alertstatus <- map["alertstatus"]
        articleid <- map["articleid"]
        notes <- map["notes"]
    }
}
