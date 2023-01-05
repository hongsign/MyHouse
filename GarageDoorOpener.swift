//
//  GarageDoorOpener.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum GarageDoorOpenerType: String {
    case Chain
    case Belt
    case Screw
    
    static let strings = [Chain.rawValue,Belt.rawValue,Screw.rawValue]
}

class GarageDoorOpener: Appliance {
    
    var garagedooropenertype : GarageDoorOpenerType = .Chain

    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        garagedooropenertype <- map["garagedooropenertype"]
    }

    override func initialize(ai:ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        powertype = ai.pt
        year = ai.year
        garagedooropenertype = ai.garagedooropenertype
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }

    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(GarageDoorOpener.GarageDoorOpenerType.Chain.ToString(), 10)
        lifespanWarn.Add(GarageDoorOpener.GarageDoorOpenerType.Belt.ToString(), 8)
        lifespanWarn.Add(GarageDoorOpener.GarageDoorOpenerType.Screw.ToString(), 10)
        
        
        lifespanAlarm.Add(GarageDoorOpener.GarageDoorOpenerType.Chain.ToString(), 15)
        lifespanAlarm.Add(GarageDoorOpener.GarageDoorOpenerType.Belt.ToString(), 12)
        lifespanAlarm.Add(GarageDoorOpener.GarageDoorOpenerType.Screw.ToString(), 15)
        */
        
        lifespanWarn[GarageDoorOpenerType.Chain.rawValue] = 10
        lifespanWarn[GarageDoorOpenerType.Belt.rawValue] = 8
        lifespanWarn[GarageDoorOpenerType.Screw.rawValue] = 10
        
        lifespanAlarm[GarageDoorOpenerType.Chain.rawValue] = 15
        lifespanAlarm[GarageDoorOpenerType.Belt.rawValue] = 12
        lifespanAlarm[GarageDoorOpenerType.Screw.rawValue] = 15
        
        maintenanceWarn[GarageDoorOpenerType.Chain.rawValue] = 36
        maintenanceWarn[GarageDoorOpenerType.Belt.rawValue] = 24
        maintenanceWarn[GarageDoorOpenerType.Screw.rawValue] = 36
        
        maintenanceAlarm[GarageDoorOpenerType.Chain.rawValue] = 60
        maintenanceAlarm[GarageDoorOpenerType.Belt.rawValue] = 36
        maintenanceAlarm[GarageDoorOpenerType.Screw.rawValue] = 60
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let chain = ArticleInfo(desc : "most common. It involves using a chain to pull (or push) a trolley that moves your door up and down",
            dura : 4,
            cost : 4,
            mainte : 3,
            install : 3)
        let belt = ArticleInfo(desc : "use a belt instead of a chain to move your door. Less noisy more expensive",
            dura : 2,
            cost : 5,
            mainte : 3,
            install : 4)
        let screw = ArticleInfo(desc : "rotates a threaded steel rod to move the trolley that opens or closes the door",
            dura : 3,
            cost : 3,
            mainte : 2,
            install : 2)
        
        /*
        articleinfo.Add(GarageDoorOpener.GarageDoorOpenerType.Chain.ToString(), chain)
        articleinfo.Add(GarageDoorOpener.GarageDoorOpenerType.Belt.ToString(), belt)
        articleinfo.Add(GarageDoorOpener.GarageDoorOpenerType.Screw.ToString(), screw)
        */
        
        articleinfo[GarageDoorOpenerType.Chain.rawValue] = chain
        articleinfo[GarageDoorOpenerType.Belt.rawValue] = belt
        articleinfo[GarageDoorOpenerType.Screw.rawValue] = screw
        
    }
    
    
}
