//
//  AtticFan.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-01.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class AtticFan: Appliance {
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
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
        //lifespanWarn.Add(Article.ArticleType.AtticFan.ToString(), 20)
        
        //lifespanAlarm.Add(Article.ArticleType.AtticFan.ToString(), 25)
        
        lifespanWarn[ArticleType.AtticFan.rawValue] = 20
        lifespanAlarm[ArticleType.AtticFan.rawValue] = 25
        
        maintenanceWarn[ArticleType.AtticFan.rawValue] = 24
        maintenanceAlarm[ArticleType.AtticFan.rawValue] = 60
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let atticfan = ArticleInfo(desc : "Whole house fan",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.AtticFan.ToString(), atticfan)
        
        articleinfo[ArticleType.AtticFan.rawValue] = atticfan
        
    }
    
}
