//
//  Heater.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Heater: Appliance {

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
        
        initializeLifespan()
        initializeArticleinfo()
    }

    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(Article.ArticleType.Heater.ToString(), 5)
        
        lifespanAlarm.Add(Article.ArticleType.Heater.ToString(), 8)
        */
        
        lifespanWarn[ArticleType.Heater.rawValue] = 5
        lifespanAlarm[ArticleType.Heater.rawValue] = 8
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let heater = ArticleInfo(desc : "Heater",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.Heater.ToString(), heater)
        articleinfo[ArticleType.Heater.rawValue] = heater
        
    }
    
    
}

