//
//  FloorDiffuser.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum FloorDiffuserType: String {
    case Metal
    case Wood
    case Plastic
    
    static let strings = [Metal.rawValue,Wood.rawValue,Plastic.rawValue]
}

class FloorDiffuser: Article {
    
    var floordiffusertype : FloorDiffuserType = FloorDiffuserType.Metal
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        floordiffusertype <- map["floordiffusertype"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        floordiffusertype = ai.floordiffusertype
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(FloorDiffuser.FloorDiffuserType.Metal.ToString(), 15)
        lifespanWarn.Add(FloorDiffuser.FloorDiffuserType.Wood.ToString(), 20)
        lifespanWarn.Add(FloorDiffuser.FloorDiffuserType.Plastic.ToString(), 10)
        
        lifespanAlarm.Add(FloorDiffuser.FloorDiffuserType.Metal.ToString(), 25)
        lifespanAlarm.Add(FloorDiffuser.FloorDiffuserType.Wood.ToString(), 30)
        lifespanAlarm.Add(FloorDiffuser.FloorDiffuserType.Plastic.ToString(), 20)
        */
        
        lifespanWarn[FloorDiffuserType.Metal.rawValue] = 15
        lifespanWarn[FloorDiffuserType.Wood.rawValue] = 20
        lifespanWarn[FloorDiffuserType.Plastic.rawValue] = 10
        
        lifespanAlarm[FloorDiffuserType.Metal.rawValue] = 25
        lifespanAlarm[FloorDiffuserType.Wood.rawValue] = 30
        lifespanAlarm[FloorDiffuserType.Plastic.rawValue] = 20
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let metal = ArticleInfo(desc : "usually made of steel and aluminium",
            dura : 4,
            cost : 4,
            mainte : 3,
            install : 1)
        let wood = ArticleInfo(desc : "made of wood, usually hardwood and bamboo",
            dura : 5,
            cost : 5,
            mainte : 4,
            install : 1)
        let plastic = ArticleInfo(desc : "made of plastics",
            dura : 2,
            cost : 2,
            mainte : 2,
            install : 1)
        
        /*
        articleinfo.Add(FloorDiffuser.FloorDiffuserType.Metal.ToString(), metal)
        articleinfo.Add(FloorDiffuser.FloorDiffuserType.Wood.ToString(), wood)
        articleinfo.Add(FloorDiffuser.FloorDiffuserType.Plastic.ToString(), plastic)
        */
        
        articleinfo[FloorDiffuserType.Metal.rawValue] = metal
        articleinfo[FloorDiffuserType.Wood.rawValue] = wood
        articleinfo[FloorDiffuserType.Plastic.rawValue] = plastic
        
    }
    
}

