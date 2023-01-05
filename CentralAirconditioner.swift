//
//  CentralAirConditioner.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-01.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class CentralAirconditioner : Appliance {
    
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
        //lifespanWarn.Add(Airconditioner.AirconditionerType.Portable.ToString(), 15)
        //lifespanAlarm.Add(Airconditioner.AirconditionerType.Portable.ToString(), 20)
        
        lifespanWarn[ArticleType.CentralAirconditioner.rawValue] = 15
        lifespanAlarm[ArticleType.CentralAirconditioner.rawValue] = 20
        
        maintenanceWarn[ArticleType.CentralAirconditioner.rawValue] = 24
        maintenanceAlarm[ArticleType.CentralAirconditioner.rawValue] = 48
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let central = ArticleInfo(desc : "the premium cooling solution for your home. It is the quietest, best performing and most comfortable",
            dura : 4,
            cost : 5,
            mainte : 3,
            install : 5)
        
        //articleinfo.Add(Article.ArticleType.CentralAirconditioner.ToString(), central)
        articleinfo[ArticleType.CentralAirconditioner.rawValue] = central
    }
    
}
