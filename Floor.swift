//
//  Floor.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum FloorType: String {
    case Hardwood
    case Ceramic
    case WoodTile
    case Carpet
    case EngineeredWood
    case Bamboo
    case Cork
    case Stone
    case Vinyl
    
    static let strings = [Hardwood.rawValue,Ceramic.rawValue,WoodTile.rawValue,Carpet.rawValue,EngineeredWood.rawValue,Bamboo.rawValue,Cork.rawValue,Stone.rawValue,Vinyl.rawValue]
}

class Floor: Article {
    
    var floortype : FloorType = FloorType.Hardwood
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        floortype <- map["floortype"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        floortype = ai.floortype
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(Floor.FloorType.Ceramic.ToString(), 30)
        lifespanWarn.Add(Floor.FloorType.WoodTile.ToString(), 30)
        lifespanWarn.Add(Floor.FloorType.Carpet.ToString(), 30)
        lifespanWarn.Add(Floor.FloorType.Hardwood.ToString(), 30)
        lifespanWarn.Add(Floor.FloorType.EngineeredWood.ToString(), 30)
        lifespanWarn.Add(Floor.FloorType.Bamboo.ToString(), 35)
        lifespanWarn.Add(Floor.FloorType.Cork.ToString(), 30)
        lifespanWarn.Add(Floor.FloorType.Stone.ToString(), 30)
        lifespanWarn.Add(Floor.FloorType.Vinyl.ToString(), 30)
        
        lifespanAlarm.Add(Floor.FloorType.Ceramic.ToString(), 50)
        lifespanAlarm.Add(Floor.FloorType.WoodTile.ToString(), 50)
        lifespanAlarm.Add(Floor.FloorType.Carpet.ToString(), 50)
        lifespanAlarm.Add(Floor.FloorType.Hardwood.ToString(), 50)
        lifespanAlarm.Add(Floor.FloorType.EngineeredWood.ToString(), 50)
        lifespanAlarm.Add(Floor.FloorType.Bamboo.ToString(), 50)
        lifespanAlarm.Add(Floor.FloorType.Cork.ToString(), 50)
        lifespanAlarm.Add(Floor.FloorType.Stone.ToString(), 50)
        lifespanAlarm.Add(Floor.FloorType.Vinyl.ToString(), 50)
        */
        
        lifespanWarn[FloorType.Ceramic.rawValue] = 30
        lifespanWarn[FloorType.WoodTile.rawValue] = 30
        lifespanWarn[FloorType.Carpet.rawValue] = 30
        lifespanWarn[FloorType.Hardwood.rawValue] = 30
        lifespanWarn[FloorType.EngineeredWood.rawValue] = 30
        lifespanWarn[FloorType.Bamboo.rawValue] = 35
        lifespanWarn[FloorType.Cork.rawValue] = 30
        lifespanWarn[FloorType.Stone.rawValue] = 30
        lifespanWarn[FloorType.Vinyl.rawValue] = 30
        
        lifespanAlarm[FloorType.Ceramic.rawValue] = 50
        lifespanAlarm[FloorType.WoodTile.rawValue] = 50
        lifespanAlarm[FloorType.Carpet.rawValue] = 50
        lifespanAlarm[FloorType.Hardwood.rawValue] = 50
        lifespanAlarm[FloorType.EngineeredWood.rawValue] = 50
        lifespanAlarm[FloorType.Bamboo.rawValue] = 50
        lifespanAlarm[FloorType.Cork.rawValue] = 50
        lifespanAlarm[FloorType.Stone.rawValue] = 50
        lifespanAlarm[FloorType.Vinyl.rawValue] = 50
        
        
        maintenanceWarn[FloorType.Ceramic.rawValue] = 60
        maintenanceWarn[FloorType.WoodTile.rawValue] = 60
        maintenanceWarn[FloorType.Carpet.rawValue] = 36
        maintenanceWarn[FloorType.Hardwood.rawValue] = 36
        maintenanceWarn[FloorType.EngineeredWood.rawValue] = 60
        maintenanceWarn[FloorType.Bamboo.rawValue] = 36
        maintenanceWarn[FloorType.Cork.rawValue] = 60
        maintenanceWarn[FloorType.Stone.rawValue] = 24
        maintenanceWarn[FloorType.Vinyl.rawValue] = 60
        
        maintenanceAlarm[FloorType.Ceramic.rawValue] = 84
        maintenanceAlarm[FloorType.WoodTile.rawValue] = 84
        maintenanceAlarm[FloorType.Carpet.rawValue] = 60
        maintenanceAlarm[FloorType.Hardwood.rawValue] = 60
        maintenanceAlarm[FloorType.EngineeredWood.rawValue] = 84
        maintenanceAlarm[FloorType.Bamboo.rawValue] = 60
        maintenanceAlarm[FloorType.Cork.rawValue] = 84
        maintenanceAlarm[FloorType.Stone.rawValue] = 48
        maintenanceAlarm[FloorType.Vinyl.rawValue] = 84
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let ceramic = ArticleInfo(desc : "Hard glazed squares typically made of ceramic or porcelain",
            dura : 5,
            cost : 2,
            mainte : 1,
            install : 4)
        let woodtile = ArticleInfo(desc : "Composed of synthetic material that simulates a wood appearance",
            dura : 2,
            cost : 2,
            mainte : 3,
            install : 2)
        let carpet = ArticleInfo(desc : "Made of polyester, nylon, ploypropylene or wool (nature carpet)",
            dura : 2,
            cost : 4,
            mainte : 5,
            install : 3)
        let hardwood = ArticleInfo(desc : "Milled from a single piece of timber",
            dura : 5,
            cost : 4,
            mainte : 1,
            install : 5)
        let engineeredwood = ArticleInfo(desc : "Composite wood, a veneer of hardwood on top of several wood layers",
            dura : 3,
            cost : 4,
            mainte : 2,
            install : 2)
        let bamboo = ArticleInfo(desc : "Hardwood, and ultra durable natural option",
            dura : 5,
            cost : 5,
            mainte : 3,
            install : 3)
        let cork = ArticleInfo(desc : "Made from the bark of cork oak for highly sustainable flooring option",
            dura : 5,
            cost : 5,
            mainte : 4,
            install : 3)
        let stone = ArticleInfo(desc : "Make use of different types of natural rock",
            dura : 4,
            cost : 5,
            mainte : 4,
            install : 5)
        let vinyl = ArticleInfo(desc : "Fully synthetic polymer flooring option",
            dura : 2,
            cost : 1,
            mainte : 1,
            install : 1)
        
        /*
        articleinfo.Add(Floor.FloorType.Ceramic.ToString(), ceramic)
        articleinfo.Add(Floor.FloorType.WoodTile.ToString(), woodtile)
        articleinfo.Add(Floor.FloorType.Carpet.ToString(), carpet)
        articleinfo.Add(Floor.FloorType.Hardwood.ToString(), hardwood)
        articleinfo.Add(Floor.FloorType.EngineeredWood.ToString(), engineeredwood)
        articleinfo.Add(Floor.FloorType.Bamboo.ToString(), bamboo)
        articleinfo.Add(Floor.FloorType.Cork.ToString(), cork)
        articleinfo.Add(Floor.FloorType.Stone.ToString(), stone)
        articleinfo.Add(Floor.FloorType.Vinyl.ToString(), vinyl)
        */
        
        articleinfo[FloorType.Ceramic.rawValue] = ceramic
        articleinfo[FloorType.WoodTile.rawValue] = woodtile
        articleinfo[FloorType.Carpet.rawValue] = carpet
        articleinfo[FloorType.Hardwood.rawValue] = hardwood
        articleinfo[FloorType.EngineeredWood.rawValue] = engineeredwood
        articleinfo[FloorType.Bamboo.rawValue] = bamboo
        articleinfo[FloorType.Cork.rawValue] = cork
        articleinfo[FloorType.Stone.rawValue] = stone
        articleinfo[FloorType.Vinyl.rawValue] = vinyl
        
        
    }
    
    
}
