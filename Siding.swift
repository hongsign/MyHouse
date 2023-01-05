//
//  Siding.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum SidingType: String {
    case Vinyl
    case Aluminum
    case Brick
    case Stone
    case Wood
    case Log
    case FiberCement
    case WoodShake
    
    static let strings = [Vinyl.rawValue,Aluminum.rawValue,Brick.rawValue,Stone.rawValue,Wood.rawValue,Log.rawValue,FiberCement.rawValue,WoodShake.rawValue]
}

class Siding: Article {
    
    var sidingtype : SidingType = SidingType.Brick

    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        sidingtype <- map["sidingtype"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        sidingtype = ai.sidingtype
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(Siding.SidingType.Vinyl.ToString(), 15)
        lifespanWarn.Add(Siding.SidingType.Aluminum.ToString(), 20)
        lifespanWarn.Add(Siding.SidingType.Brick.ToString(), 25)
        lifespanWarn.Add(Siding.SidingType.Stone.ToString(), 50)
        lifespanWarn.Add(Siding.SidingType.Wood.ToString(), 20)
        lifespanWarn.Add(Siding.SidingType.Log.ToString(), 30)
        lifespanWarn.Add(Siding.SidingType.FiberCement.ToString(), 35)
        lifespanWarn.Add(Siding.SidingType.WoodShake.ToString(), 25)
        
        lifespanAlarm.Add(Siding.SidingType.Vinyl.ToString(), 25)
        lifespanAlarm.Add(Siding.SidingType.Aluminum.ToString(), 30)
        lifespanAlarm.Add(Siding.SidingType.Brick.ToString(), 70)
        lifespanAlarm.Add(Siding.SidingType.Stone.ToString(), 100)
        lifespanAlarm.Add(Siding.SidingType.Wood.ToString(), 50)
        lifespanAlarm.Add(Siding.SidingType.Log.ToString(), 50)
        lifespanAlarm.Add(Siding.SidingType.FiberCement.ToString(), 50)
        lifespanAlarm.Add(Siding.SidingType.WoodShake.ToString(), 40)
        */
        
        lifespanWarn[SidingType.Vinyl.rawValue] = 15
        lifespanWarn[SidingType.Aluminum.rawValue] = 20
        lifespanWarn[SidingType.Brick.rawValue] = 25
        lifespanWarn[SidingType.Stone.rawValue] = 50
        lifespanWarn[SidingType.Wood.rawValue] = 20
        lifespanWarn[SidingType.Log.rawValue] = 30
        lifespanWarn[SidingType.FiberCement.rawValue] = 35
        lifespanWarn[SidingType.WoodShake.rawValue] = 25
        
        lifespanAlarm[SidingType.Vinyl.rawValue] = 25
        lifespanAlarm[SidingType.Aluminum.rawValue] = 30
        lifespanAlarm[SidingType.Brick.rawValue] = 70
        lifespanAlarm[SidingType.Stone.rawValue] = 100
        lifespanAlarm[SidingType.Wood.rawValue] = 50
        lifespanAlarm[SidingType.Log.rawValue] = 50
        lifespanAlarm[SidingType.FiberCement.rawValue] = 50
        lifespanAlarm[SidingType.WoodShake.rawValue] = 40
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let vinyl = ArticleInfo(desc : "Cheap siding will begin to show its age in 12-15 years and none should be expected to look good and perform well past 25 years",
            dura : 2,
            cost : 1,
            mainte : 1,
            install : 1)
        let aluminum = ArticleInfo(desc : "prone to chalking and fading. The quality of the finish will make the difference",
            dura : 3,
            cost : 3,
            mainte : 2,
            install : 1)
        let brick = ArticleInfo(desc : "Not as expensive as stone, but it is pricey. Down the road 15-25 years, mortar repairs will begin to be required",
            dura : 4,
            cost : 4,
            mainte : 3,
            install : 4)
        let stone = ArticleInfo(desc : "hile the durability is outstanding, this is the costliest common siding product",
            dura : 5,
            cost : 5,
            mainte : 3,
            install : 5)
        let wood = ArticleInfo(desc : "All wood sidings must be carefully maintained to prevent rot and insect infestation",
            dura : 4,
            cost : 4,
            mainte : 4,
            install : 2)
        let log = ArticleInfo(desc : "must be carefully maintained to prevent rot and insect infestation",
            dura : 4,
            cost : 5,
            mainte : 5,
            install : 5)
        let fibercement = ArticleInfo(desc : "The product selection is somewhat limited. It must be painted regularly to maintain an attractive appearance",
            dura : 3,
            cost : 2,
            mainte : 3,
            install : 2)
        let woodshake = ArticleInfo(desc : "must be carefully maintained to prevent rot and insect infestation",
            dura : 3,
            cost : 4,
            mainte : 5,
            install : 3)
        
        /*
        articleinfo.Add(Siding.SidingType.Vinyl.ToString(), vinyl)
        articleinfo.Add(Siding.SidingType.Aluminum.ToString(), aluminum)
        articleinfo.Add(Siding.SidingType.Brick.ToString(), brick)
        articleinfo.Add(Siding.SidingType.Stone.ToString(), stone)
        articleinfo.Add(Siding.SidingType.Wood.ToString(), wood)
        articleinfo.Add(Siding.SidingType.Log.ToString(), log)
        articleinfo.Add(Siding.SidingType.FiberCement.ToString(), fibercement)
        articleinfo.Add(Siding.SidingType.WoodShake.ToString(), woodshake)
        */
        
        articleinfo[SidingType.Vinyl.rawValue] = vinyl
        articleinfo[SidingType.Aluminum.rawValue] = aluminum
        articleinfo[SidingType.Brick.rawValue] = brick
        articleinfo[SidingType.Stone.rawValue] = stone
        articleinfo[SidingType.Wood.rawValue] = wood
        articleinfo[SidingType.Log.rawValue] = log
        articleinfo[SidingType.FiberCement.rawValue] = fibercement
        articleinfo[SidingType.WoodShake.rawValue] = woodshake
        
    }
    
}

