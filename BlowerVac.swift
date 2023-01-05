//
//  BlowerVac.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-01.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class BlowerVac : GardenAppliance {
    
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
        //lifespanWarn.Add(Article.ArticleType.BlowerVac.ToString(), 10)
        
        //lifespanAlarm.Add(Article.ArticleType.BlowerVac.ToString(), 15)
        
        lifespanWarn[ArticleType.BlowerVac.rawValue] = 10
        lifespanAlarm[ArticleType.BlowerVac.rawValue] = 15
        
        maintenanceWarn[ArticleType.BlowerVac.rawValue] = 12
        maintenanceAlarm[ArticleType.BlowerVac.rawValue] = 24
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let blowervac = ArticleInfo(desc : "Blower Vac",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.BlowerVac.ToString(), blowervac)
        articleinfo[ArticleType.BlowerVac.rawValue] = blowervac
        
    }
    
}
