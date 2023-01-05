//
//  AirPurifier.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-01.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class AirPurifier : Appliance {
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        powertype = ai.pt
        year = ai.year
        
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    
    override func initializeLifespan() {
        //lifespanWarn.Add(Article.ArticleType.AirPurifier.ToString(), 5)
        
        //lifespanAlarm.Add(Article.ArticleType.AirPurifier.ToString(), 8)
        
        lifespanWarn[ArticleType.AirPurifier.rawValue] = 5
        lifespanAlarm[ArticleType.AirPurifier.rawValue] = 8
        
        maintenanceWarn[ArticleType.AirPurifier.rawValue] = 12
        maintenanceAlarm[ArticleType.AirPurifier.rawValue] = 18
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let purifier = ArticleInfo(desc : "Air Purifier",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.AirPurifier.ToString(), purifier)
        
        articleinfo[ArticleType.AirPurifier.rawValue] = purifier
        
    }
    
}
