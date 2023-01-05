//
//  GarageDoor.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum GarageDoorType: String {
    case Wood
    case Steel
    case Aluminum
    
    static let strings = [Wood.rawValue,Steel.rawValue,Aluminum.rawValue]
}

class GarageDoor: Article {
    
    var garagedoortype : GarageDoorType = .Aluminum

    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        garagedoortype <- map["garagedoortype"]
    }
    
    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        //power = ai.pt
        year = ai.year
        garagedoortype = ai.garagedoortype
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }

    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(GarageDoor.GarageDoorType.Wood.ToString(), 10)
        lifespanWarn.Add(GarageDoor.GarageDoorType.Steel.ToString(), 15)
        lifespanWarn.Add(GarageDoor.GarageDoorType.Aluminum.ToString(), 20)
        
        
        lifespanAlarm.Add(GarageDoor.GarageDoorType.Wood.ToString(), 15)
        lifespanAlarm.Add(GarageDoor.GarageDoorType.Steel.ToString(), 20)
        lifespanAlarm.Add(GarageDoor.GarageDoorType.Aluminum.ToString(), 30)
        */
        
        lifespanWarn[GarageDoorType.Wood.rawValue] = 10
        lifespanWarn[GarageDoorType.Steel.rawValue] = 15
        lifespanWarn[GarageDoorType.Aluminum.rawValue] = 20
        
        lifespanAlarm[GarageDoorType.Wood.rawValue] = 15
        lifespanAlarm[GarageDoorType.Steel.rawValue] = 20
        lifespanAlarm[GarageDoorType.Aluminum.rawValue] = 30
        
        maintenanceWarn[GarageDoorType.Wood.rawValue] = 24
        maintenanceWarn[GarageDoorType.Steel.rawValue] = 36
        maintenanceWarn[GarageDoorType.Aluminum.rawValue] = 36
        
        maintenanceAlarm[GarageDoorType.Wood.rawValue] = 48
        maintenanceAlarm[GarageDoorType.Steel.rawValue] = 60
        maintenanceAlarm[GarageDoorType.Aluminum.rawValue] = 60
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let wood = ArticleInfo(desc : "offers a charm and authenticity that other materials merely mimic. usually carry a short warranty",
            dura : 2,
            cost : 4,
            mainte : 5,
            install : 4)
        let steel = ArticleInfo(desc : "better choice than wood if you don’t want a lot of maintenance. Bare steel rusts and dents",
            dura : 3,
            cost : 3,
            mainte : 4,
            install : 3)
        let aluminum = ArticleInfo(desc : "less expensive aluminum doors have aluminum frames and panels made of other materials. Rugged and rust-proof ones are great but expensive",
            dura : 4,
            cost : 4,
            mainte : 2,
            install : 2)
        
        //articleinfo.Add(GarageDoor.GarageDoorType.Wood.ToString(), wood)
        //articleinfo.Add(GarageDoor.GarageDoorType.Steel.ToString(), steel)
        //articleinfo.Add(GarageDoor.GarageDoorType.Aluminum.ToString(), aluminum)
        
        articleinfo[GarageDoorType.Wood.rawValue] = wood
        articleinfo[GarageDoorType.Steel.rawValue] = steel
        articleinfo[GarageDoorType.Aluminum.rawValue] = aluminum
        
        
    }
}
