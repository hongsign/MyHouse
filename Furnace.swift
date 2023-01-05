//
//  Furnace.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum FurnaceType: String {
    case CentralAir
    case SteamOrHotwater
    case HeatPump
    
    static let strings = [CentralAir.rawValue,SteamOrHotwater.rawValue,HeatPump.rawValue]
}

class Furnace: Appliance {
    
    var furnacetype : FurnaceType = FurnaceType.CentralAir
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        furnacetype <- map["furnacetype"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        powertype = ai.pt
        year = ai.year
        furnacetype = ai.furnacetype
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }

    
    override func initializeLifespan() {
        //lifespanWarn.Add(Furnace.FurnaceType.CentralAir.ToString(), 15)
        //lifespanWarn.Add(Furnace.FurnaceType.SteamOrHotwater.ToString(), 15)
        //lifespanWarn.Add(Furnace.FurnaceType.HeatPump.ToString(), 15)
        
        //lifespanAlarm.Add(Furnace.FurnaceType.CentralAir.ToString(), 20)
        //lifespanAlarm.Add(Furnace.FurnaceType.SteamOrHotwater.ToString(), 20)
        //lifespanAlarm.Add(Furnace.FurnaceType.HeatPump.ToString(), 20)
        
        
        lifespanWarn[FurnaceType.CentralAir.rawValue] = 15
        lifespanWarn[FurnaceType.SteamOrHotwater.rawValue] = 15
        lifespanWarn[FurnaceType.HeatPump.rawValue] = 15
        
        lifespanAlarm[FurnaceType.CentralAir.rawValue] = 20
        lifespanAlarm[FurnaceType.SteamOrHotwater.rawValue] = 20
        lifespanAlarm[FurnaceType.HeatPump.rawValue] = 20
        
        maintenanceWarn[FurnaceType.CentralAir.rawValue] = 36
        maintenanceWarn[FurnaceType.SteamOrHotwater.rawValue] = 12
        maintenanceWarn[FurnaceType.HeatPump.rawValue] = 24
        
        maintenanceAlarm[FurnaceType.CentralAir.rawValue] = 60
        maintenanceAlarm[FurnaceType.SteamOrHotwater.rawValue] = 24
        maintenanceAlarm[FurnaceType.HeatPump.rawValue] = 36
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        
        let centralair = ArticleInfo(desc : "a central combustor or resistance unit--generally using gas, fuel oil, or electricity--provides warm air that circulates through ducts leading to the various rooms",
            dura : 3,
            cost : 3,
            mainte : 2,
            install : 3)
        
        let steamorhotwater = ArticleInfo(desc : "supplies steam or hot water to radiators, convectors, or pipes",
            dura : 3,
            cost : 2,
            mainte : 3,
            install : 3)
        
        let heatpump = ArticleInfo(desc : "refrigeration equipment supplies both heating and cooling through ducts leading to individual rooms",
            dura : 3,
            cost : 2,
            mainte : 3,
            install : 3)
        
        
        //articleinfo.Add(Furnace.FurnaceType.CentralAir.ToString(), centralair)
        //articleinfo.Add(Furnace.FurnaceType.SteamOrHotwater.ToString(), steamorhotwater)
        //articleinfo.Add(Furnace.FurnaceType.HeatPump.ToString(), heatpump)
        
        
        articleinfo[FurnaceType.CentralAir.rawValue] = centralair
        articleinfo[FurnaceType.SteamOrHotwater.rawValue] = steamorhotwater
        articleinfo[FurnaceType.HeatPump.rawValue] = heatpump
        
    }
}
