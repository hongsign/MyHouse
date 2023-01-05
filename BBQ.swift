//
//  BBQ.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-01.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class BBQ: Appliance {
    
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
        //lifespanWarn.Add(Article.ArticleType.BBQ.ToString(), 8)
        
        //lifespanAlarm.Add(Article.ArticleType.BBQ.ToString(), 15)
        
        lifespanWarn[ArticleType.BBQ.rawValue] = 8
        lifespanAlarm[ArticleType.BBQ.rawValue] = 15
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let bbq = ArticleInfo(desc : "Barbecue",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        
        //articleinfo.Add(Article.ArticleType.BBQ.ToString(), bbq)
        articleinfo[ArticleType.BBQ.rawValue] = bbq
        
    }
    
}
