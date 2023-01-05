//
//  ExteriorWall.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-07.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

enum ExteriorWallType: String {
    case ConcreteBlock
    case Stone
    case Brick
    case Log
    case Cob
    case Metal
    case Plastic
    case Vinyl
}

class ExteriorWall: Article {
    
    var exteriorwalltype: ExteriorWallType = .Brick
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        exteriorwalltype <- map["exteriorwalltype"]
    }
    
    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        exteriorwalltype = ai.exteriorwalltype
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        lifespanWarn[ExteriorWallType.ConcreteBlock.rawValue] = 70
        lifespanWarn[ExteriorWallType.Stone.rawValue] = 70
        lifespanWarn[ExteriorWallType.Brick.rawValue] = 70
        lifespanWarn[ExteriorWallType.Log.rawValue] = 50
        lifespanWarn[ExteriorWallType.Cob.rawValue] = 50
        lifespanWarn[ExteriorWallType.Metal.rawValue] = 25
        lifespanWarn[ExteriorWallType.Plastic.rawValue] = 20
        lifespanWarn[ExteriorWallType.Vinyl.rawValue] = 30
        
        lifespanAlarm[ExteriorWallType.ConcreteBlock.rawValue] = 100
        lifespanAlarm[ExteriorWallType.Stone.rawValue] = 100
        lifespanAlarm[ExteriorWallType.Brick.rawValue] = 100
        lifespanAlarm[ExteriorWallType.Log.rawValue] = 70
        lifespanAlarm[ExteriorWallType.Cob.rawValue] = 70
        lifespanAlarm[ExteriorWallType.Metal.rawValue] = 40
        lifespanAlarm[ExteriorWallType.Plastic.rawValue] = 30
        lifespanAlarm[ExteriorWallType.Vinyl.rawValue] = 50
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let concreteblock = ArticleInfo(desc : "Also commonly known as concrete masonry units, breeze blocks, foundation blocks or cinder blocks, besser blocks are a large type of brick made from concrete. The bricks are usually made with a series of hollow tubes running through them",
                                         dura : 4,
                                         cost : 4,
                                         mainte : 2,
                                         install : 4)
        let stone = ArticleInfo(desc : "A stone home has walls built from solid stone, using the techniques of stone and rubble masonry or dry stone. Stone cladding is often used to conceal a less appealing finish (like concrete), but can also serve as an alternative to weatherboard or other options in external cladding",
                                    dura : 5,
                                    cost : 5,
                                    mainte : 2,
                                    install : 5)
        let brick = ArticleInfo(desc : "Common house bricks are made up of clay and shale. Their colour depends on what kind of clay mix is used, the firing temperatures, various kiln settings and any additives used",
                                dura : 5,
                                cost : 4,
                                mainte : 2,
                                install : 5)
        let log = ArticleInfo(desc : "A log home or cabin is a wooden house that has been made from tree logs (as opposed to planks of timber). Some common types of wood used for log homes include white pine, yellow pine, fir and cedar",
                                     dura : 4,
                                     cost : 4,
                                     mainte : 2,
                                     install : 4)
        let cob = ArticleInfo(desc : "Cob walls are made from a mixture of mud, sand and/or clay, to which water and an organic matter like hay, straw or manure is added",
                                   dura : 4,
                                   cost : 3,
                                   mainte : 2,
                                   install : 3)
        let metal = ArticleInfo(desc : "Metal cladding (or siding) is an external wall finish, most commonly made from either aluminium or steel",
                                   dura : 3,
                                   cost : 3,
                                   mainte : 3,
                                   install : 3)
        let plastic = ArticleInfo(desc : "Plastic cladding is an external wall material that is often installed as an alternative to weatherboard planks",
                                   dura : 2,
                                   cost : 2,
                                   mainte : 1,
                                   install : 2)
        let vinyl = ArticleInfo(desc : "Vinyl cladding is an external wall material that is often installed as an alternative to weatherboard planks",
                                   dura : 3,
                                   cost : 3,
                                   mainte : 2,
                                   install : 3)
        
        articleinfo[ExteriorWallType.ConcreteBlock.rawValue] = concreteblock
        articleinfo[ExteriorWallType.Stone.rawValue] = stone
        articleinfo[ExteriorWallType.Brick.rawValue] = brick
        articleinfo[ExteriorWallType.Log.rawValue] = log
        articleinfo[ExteriorWallType.Cob.rawValue] = cob
        articleinfo[ExteriorWallType.Metal.rawValue] = metal
        articleinfo[ExteriorWallType.Plastic.rawValue] = plastic
        articleinfo[ExteriorWallType.Vinyl.rawValue] = vinyl
        
    }

    
}
