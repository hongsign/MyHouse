//
//  Freezer.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Freezer: Appliance {
 
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
        //lifespanWarn.Add(Article.ArticleType.Freezer.ToString(), 7)
        
        //lifespanAlarm.Add(Article.ArticleType.Freezer.ToString(), 10)
        
        lifespanWarn[ArticleType.Freezer.rawValue] = 7
        lifespanAlarm[ArticleType.Freezer.rawValue] = 10
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let freezer = ArticleInfo(desc : "Freezer",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.Freezer.ToString(), freezer)
        articleinfo[ArticleType.Freezer.rawValue] = freezer
        
    }
    
}
