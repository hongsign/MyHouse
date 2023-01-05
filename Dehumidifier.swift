//
//  Dehumidifier.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Dehumidifier : Appliance {

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
        //lifespanWarn.Add(Article.ArticleType.Dehumidifier.ToString(), 5)
        
        //lifespanAlarm.Add(Article.ArticleType.Dehumidifier.ToString(), 10)
        
        lifespanWarn[ArticleType.Dehumidifier.rawValue] = 5
        lifespanAlarm[ArticleType.Dehumidifier.rawValue] = 10
        
        maintenanceWarn[ArticleType.Dehumidifier.rawValue] = 6
        maintenanceAlarm[ArticleType.Dehumidifier.rawValue] = 12
        
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let dehumidifier = ArticleInfo(desc : "Dehumidifier",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.Dehumidifier.ToString(), dehumidifier)
        
        articleinfo[ArticleType.Dehumidifier.rawValue] = dehumidifier
    }
}

