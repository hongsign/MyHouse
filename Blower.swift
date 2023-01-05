//
//  Blower.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-01.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Blower : GardenAppliance {
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
    }

    override func initialize(ai:ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        powertype = ai.pt
        year = ai.year
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }

    
    override func initializeLifespan() {
        //lifespanWarn.Add(Article.ArticleType.Blower.ToString(), 10)
        
        //lifespanAlarm.Add(Article.ArticleType.Blower.ToString(), 15)
        
        lifespanWarn[ArticleType.Blower.rawValue] = 10
        lifespanAlarm[ArticleType.Blower.rawValue] = 15
        
        maintenanceWarn[ArticleType.Blower.rawValue] = 12
        maintenanceAlarm[ArticleType.Blower.rawValue] = 24
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let blower = ArticleInfo(desc : "Blower",
            dura : 3,
            cost : 3,
            mainte : 3, 
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.Blower.ToString(), blower)
        
        articleinfo[ArticleType.Blower.rawValue] = blower
        
    }
    
}
