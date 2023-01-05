//
//  ArticleInfo.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class ArticleInfo: Base {
    
        init(desc : String, dura : Int, cost : Int, mainte : Int, install : Int) {
            
            super.init()
            
            self.desc = desc
            self.durability = dura
            self.cost = cost
            self.maintenancecost = mainte
            self.installationdifficulty = install
            
            
        }
        
        required init?(map: Map) {
            super.init(map: map)
        }
        
        override public func mapping(map: Map) {
            super.mapping(map: map)
            
            desc <- map["desc"]
            durability <- map["durability"]
            cost <- map["cost"]
            maintenancecost <- map["maintenancecost"]
            installationdifficulty <- map["installationdifficulty"]
            isDescOnly <- map["isDescOnly"]
        }
        
        
        var desc : String = ""
        var durability : Int = 1
        var cost : Int = 1
        var maintenancecost : Int = 1
        var installationdifficulty : Int = 1
        
        
        var isDescOnly : Bool = false
    
}
