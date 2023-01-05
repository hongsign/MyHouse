//
//  Doorbell.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Doorbell : Appliance {
    
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
        //lifespanWarn.Add(Article.ArticleType.Doorbell.ToString(), 15)
        
        //lifespanAlarm.Add(Article.ArticleType.Doorbell.ToString(), 25)
        
        lifespanWarn[ArticleType.Doorbell.rawValue] = 15
        lifespanAlarm[ArticleType.Doorbell.rawValue] = 25
        
        maintenanceWarn[ArticleType.Doorbell.rawValue] = 24
        maintenanceAlarm[ArticleType.Doorbell.rawValue] = 36
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let doorbell = ArticleInfo(desc : "Door bell",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.Doorbell.ToString(), doorbell)
        articleinfo[ArticleType.Doorbell.rawValue] = doorbell
        
    }
    
}
