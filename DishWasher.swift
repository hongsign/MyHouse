//
//  DishWasher.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class DishWasher : Appliance {

    var capacity: Double = 14.0
    
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
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }

    
    override func initializeLifespan() {
        //lifespanWarn.Add(Article.ArticleType.DishWasher.ToString(), 8)
        
        //lifespanAlarm.Add(Article.ArticleType.DishWasher.ToString(), 12)
        
        lifespanWarn[ArticleType.DishWasher.rawValue] = 8
        lifespanAlarm[ArticleType.DishWasher.rawValue] = 12
        
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let dishwasher = ArticleInfo(desc : "Dish Washer",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.DishWasher.ToString(), dishwasher)
        
        articleinfo[ArticleType.DishWasher.rawValue] = dishwasher
        
    }
}

