//
//  Washer.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Washer: Appliance {
    
    var capacity: Double = 8.3

    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        capacity <- map["capacity"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        powertype = ai.pt
        year = ai.year
        capacity = ai.capacity
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        //lifespanWarn.Add(Article.ArticleType.Washer.ToString(), 10)
        
        //lifespanAlarm.Add(Article.ArticleType.Washer.ToString(), 15)
        
        lifespanWarn[ArticleType.Washer.rawValue] = 10
        lifespanAlarm[ArticleType.Washer.rawValue] = 15
        
        maintenanceWarn[ArticleType.Washer.rawValue] = 24
        maintenanceAlarm[ArticleType.Washer.rawValue] = 36
        
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let washer = ArticleInfo(desc : "clothes washer",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.Washer.ToString(), washer)
        articleinfo[ArticleType.Washer.rawValue] = washer
        
    }
    
}
