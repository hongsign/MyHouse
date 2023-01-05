//
//  Trimmer.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Trimmer: GardenAppliance {
 
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
        //lifespanWarn.Add(Article.ArticleType.Trimmer.ToString(), 10)
        
        //lifespanAlarm.Add(Article.ArticleType.Trimmer.ToString(), 15)
        
        lifespanWarn[ArticleType.Trimmer.rawValue] = 10
        lifespanAlarm[ArticleType.Trimmer.rawValue] = 15
        
        maintenanceWarn[ArticleType.Trimmer.rawValue] = 12
        maintenanceAlarm[ArticleType.Trimmer.rawValue] = 24
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let trimmer = ArticleInfo(desc : "Trimmer",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.Trimmer.ToString(), trimmer)
        articleinfo[ArticleType.Trimmer.rawValue] = trimmer
        
    }
    
}

