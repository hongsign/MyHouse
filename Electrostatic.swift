//
//  Electrostatic.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

class Electrostatic : Appliance {
 
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
        
        //lifespanWarn.Add(Article.ArticleType.Electrostatic.ToString(), 20)
        
        //lifespanAlarm.Add(Article.ArticleType.Electrostatic.ToString(), 30)
        
        lifespanWarn[ArticleType.Electrostatic.rawValue] = 20
        lifespanAlarm[ArticleType.Electrostatic.rawValue] = 30
        
        maintenanceWarn[ArticleType.Electrostatic.rawValue] = 24
        maintenanceAlarm[ArticleType.Electrostatic.rawValue] = 48
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = false
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let electrostatic = ArticleInfo(desc : "Filtration relies on static electricity. Pros: permanent filter. Save money. Cons: filter only small things, not big dirt. Air flow is restricted up to 10%-50%.",
            dura : 0,
            cost : 0,
            mainte : 0,
            install : 0)
        
        electrostatic.isDescOnly = true
        
        //articleinfo.Add(Article.ArticleType.Electrostatic.ToString(), electrostatic)
        articleinfo[ArticleType.Electrostatic.rawValue] = electrostatic
        
    }
    
}
