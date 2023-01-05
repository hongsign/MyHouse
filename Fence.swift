//
//  Fence.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum FenceType: String {
    case Wood
    case Vinyl
    case WroughtIron
    case Aluminum
    case Bamboo
    case ChainLink
    case Picket
    case Electric
    
    static let strings = [Wood.rawValue,Vinyl.rawValue,WroughtIron.rawValue,Aluminum.rawValue,Bamboo.rawValue,ChainLink.rawValue,Picket.rawValue,Electric.rawValue]
}

class Fence: Article {
    
    //where the fence is. backyard or frontyard
    var yardid: Int = backyardid

    var fencetype : FenceType = FenceType.Wood

    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        yardid <- map["yardid"]
        fencetype <- map["fencetype"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        fencetype = ai.fencetype
        yardid = ai.fenceyardid
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(Fence.FenceType.Wood.ToString(), 10)
        lifespanWarn.Add(Fence.FenceType.Vinyl.ToString(), 20)
        lifespanWarn.Add(Fence.FenceType.WroughtIron.ToString(), 20)
        lifespanWarn.Add(Fence.FenceType.Aluminum.ToString(), 20)
        lifespanWarn.Add(Fence.FenceType.Bamboo.ToString(), 15)
        lifespanWarn.Add(Fence.FenceType.ChainLink.ToString(), 10)
        lifespanWarn.Add(Fence.FenceType.Picket.ToString(), 15)
        lifespanWarn.Add(Fence.FenceType.Electric.ToString(), 15)
        
        lifespanAlarm.Add(Fence.FenceType.Wood.ToString(), 20)
        lifespanAlarm.Add(Fence.FenceType.Vinyl.ToString(), 50)
        lifespanAlarm.Add(Fence.FenceType.WroughtIron.ToString(), 50)
        lifespanAlarm.Add(Fence.FenceType.Aluminum.ToString(), 50)
        lifespanAlarm.Add(Fence.FenceType.Bamboo.ToString(), 25)
        lifespanAlarm.Add(Fence.FenceType.ChainLink.ToString(), 20)
        lifespanAlarm.Add(Fence.FenceType.Picket.ToString(), 30)
        lifespanAlarm.Add(Fence.FenceType.Electric.ToString(), 30)
        */
        
        lifespanWarn[FenceType.Wood.rawValue] = 10
        lifespanWarn[FenceType.Vinyl.rawValue] = 20
        lifespanWarn[FenceType.WroughtIron.rawValue] = 20
        lifespanWarn[FenceType.Aluminum.rawValue] = 20
        lifespanWarn[FenceType.Bamboo.rawValue] = 15
        lifespanWarn[FenceType.ChainLink.rawValue] = 10
        lifespanWarn[FenceType.Picket.rawValue] = 15
        lifespanWarn[FenceType.Electric.rawValue] = 15
        
        lifespanAlarm[FenceType.Wood.rawValue] = 20
        lifespanAlarm[FenceType.Vinyl.rawValue] = 50
        lifespanAlarm[FenceType.WroughtIron.rawValue] = 50
        lifespanAlarm[FenceType.Aluminum.rawValue] = 50
        lifespanAlarm[FenceType.Bamboo.rawValue] = 25
        lifespanAlarm[FenceType.ChainLink.rawValue] = 20
        lifespanAlarm[FenceType.Picket.rawValue] = 30
        lifespanAlarm[FenceType.Electric.rawValue] = 30
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let wood = ArticleInfo(desc : "most popular fencing type. All factors highly depend on height, size, and type of wood",
            dura : 2,
            cost : 3,
            mainte : 3,
            install : 4)
        let vinyl = ArticleInfo(desc : "maintenance free and resists paint. Much stronger and more flexible than comparable wood fences",
            dura : 5,
            cost : 4,
            mainte : 1,
            install : 3)
        let wroughtiron = ArticleInfo(desc : "both strong and beautiful, they do require constant upkeep",
            dura : 5,
            cost : 4,
            mainte : 4,
            install : 3)
        let aluminum = ArticleInfo(desc : "relatively maintenance free and can essentially look like any other types",
            dura : 5,
            cost : 4,
            mainte : 1,
            install : 3)
        let bamboo = ArticleInfo(desc : "three styles for bamboo fencing: live bamboo, bamboo cane and rolled bamboo. one of the most environmentally friendly",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 4)
        let chainlink = ArticleInfo(desc : "do not add much privacy to the home, but perform the other basic functions of a fence",
            dura : 4,
            cost : 2,
            mainte : 4,
            install : 2)
        let picket = ArticleInfo(desc : "could use various materials. Installation not easy",
            dura : 3,
            cost : 2,
            mainte : 4,
            install : 5)
        let electric = ArticleInfo(desc : "Invisible fences are mainly used to contain dogs or animals through an invisible field of electricity",
            dura : 4,
            cost : 3,
            mainte : 4,
            install : 3)
        
        /*
        articleinfo.Add(Fence.FenceType.Wood.ToString(), wood)
        articleinfo.Add(Fence.FenceType.Vinyl.ToString(), vinyl)
        articleinfo.Add(Fence.FenceType.WroughtIron.ToString(), wroughtiron)
        articleinfo.Add(Fence.FenceType.Aluminum.ToString(), aluminum)
        articleinfo.Add(Fence.FenceType.Bamboo.ToString(), bamboo)
        articleinfo.Add(Fence.FenceType.ChainLink.ToString(), chainlink)
        articleinfo.Add(Fence.FenceType.Picket.ToString(), picket)
        articleinfo.Add(Fence.FenceType.Electric.ToString(), electric)
        */
        
        
        articleinfo[FenceType.Wood.rawValue] = wood
        articleinfo[FenceType.Vinyl.rawValue] = vinyl
        articleinfo[FenceType.WroughtIron.rawValue] = wroughtiron
        articleinfo[FenceType.Aluminum.rawValue] = aluminum
        articleinfo[FenceType.Bamboo.rawValue] = bamboo
        articleinfo[FenceType.ChainLink.rawValue] = chainlink
        articleinfo[FenceType.Picket.rawValue] = picket
        articleinfo[FenceType.Electric.rawValue] = electric
        
    }
    
}
