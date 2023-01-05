//
//  WaterHeater.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum WaterHeaterType: String {
    case Tank
    case Tankless
    
    static let strings = [Tank.rawValue,Tankless.rawValue]
}

class WaterHeater: Appliance {
    
    var waterheatertype : WaterHeaterType = .Tank
    var capacity: Double = 50.0

    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        waterheatertype <- map["waterheatertype"]
        capacity <- map["capacity"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        powertype = ai.pt
        year = ai.year
        waterheatertype = ai.waterheatertype
        capacity = ai.capacity
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(WaterHeater.WaterHeaterType.Tank.ToString(), 10)
        lifespanWarn.Add(WaterHeater.WaterHeaterType.Tankless.ToString(), 15)
        
        lifespanAlarm.Add(WaterHeater.WaterHeaterType.Tank.ToString(), 15)
        lifespanAlarm.Add(WaterHeater.WaterHeaterType.Tankless.ToString(), 20)
        */
        
        lifespanWarn[WaterHeaterType.Tank.rawValue] = 10
        lifespanWarn[WaterHeaterType.Tankless.rawValue] = 15
        
        lifespanAlarm[WaterHeaterType.Tank.rawValue] = 15
        lifespanAlarm[WaterHeaterType.Tankless.rawValue] = 20
        
        maintenanceWarn[WaterHeaterType.Tank.rawValue] = 24
        maintenanceWarn[WaterHeaterType.Tankless.rawValue] = 36
        
        maintenanceAlarm[WaterHeaterType.Tank.rawValue] = 48
        maintenanceAlarm[WaterHeaterType.Tankless.rawValue] = 60
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let tank = ArticleInfo(desc : "offer a ready reservoir (storage tank) of hot water",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 4)
        let tankless = ArticleInfo(desc : "heat water directly without the use of a storage tank",
            dura : 5,
            cost : 5,
            mainte : 2,
            install : 3)
        
        //articleinfo.Add(WaterHeater.WaterHeaterType.Tank.ToString(), tank)
        //articleinfo.Add(WaterHeater.WaterHeaterType.Tankless.ToString(), tankless)
        
        articleinfo[WaterHeaterType.Tank.rawValue] = tank
        articleinfo[WaterHeaterType.Tankless.rawValue] = tankless
        
    }
    
}

