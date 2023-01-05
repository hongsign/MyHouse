//
//  Chimney.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-03.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum ChimneyType: String {
    case Masonry
    case Metal
    
    //case count
    static var strings = [Masonry.rawValue,Metal.rawValue]
}

enum ChimneyLinerType: String {
    case ClayTile
    case Metal
    case CastInPlace
    case None
    
    //case count
    static var strings = [ClayTile.rawValue,Metal.rawValue,CastInPlace.rawValue,None.rawValue]
}


class Chimney: Article {
    
    
    var chimneytype : ChimneyType = ChimneyType.Masonry
    var chimneylinertype : ChimneyLinerType = ChimneyLinerType.ClayTile
    
    //var fireplace : Fireplace?
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        chimneytype <- map["chimneytype"]
        chimneylinertype <- map["chimneylinertype"]
        //fireplace <- map["fireplace"]
    }

    
    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        chimneytype = ai.chimneytype
        chimneylinertype = ai.chimeylinertype
        
        //fireplace = Fireplace(ai: ai)
        
        initializeLifespan()
        initializeArticleinfo()
    }

    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(Chimney.ChimneyType.Masonry.ToString(), 50)
        lifespanWarn.Add(Chimney.ChimneyType.Metal.ToString(), 50)
        
        lifespanAlarm.Add(Chimney.ChimneyType.Masonry.ToString(), 70)
        lifespanAlarm.Add(Chimney.ChimneyType.Metal.ToString(), 70)
        */
        
        lifespanWarn[ChimneyType.Masonry.rawValue] = 50
        lifespanWarn[ChimneyType.Metal.rawValue] = 50
        
        lifespanAlarm[ChimneyType.Masonry.rawValue] = 70
        lifespanAlarm[ChimneyType.Metal.rawValue] = 70
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = true
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let masonry = ArticleInfo(desc : "constructed from bricks, blocks, or stone and mortar",
            dura : 5,
            cost : 5,
            mainte : 3,
            install : 5)
        let metal = ArticleInfo(desc : "either double- or triple-walled, metal chimneys can be enclosed within a masonry chimney chase, wooden structure, or sided frame for aesthetic purposes",
            dura : 5, 
            cost : 4, 
            mainte : 3, 
            install : 5)
        
        //articleinfo.Add(Chimney.ChimneyType.Masonry.ToString(), masonry)
        //articleinfo.Add(Chimney.ChimneyType.Metal.ToString(), metal)
        
        articleinfo[ChimneyType.Masonry.rawValue] = masonry
        articleinfo[ChimneyType.Metal.rawValue] = metal
        
    }
    
}
