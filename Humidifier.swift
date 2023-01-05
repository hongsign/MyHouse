//
//  Humidifier.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum HumidifierType: String {
    case Tabletop
    case Console
    case InDuct
    
    static let strings = [Tabletop.rawValue,Console.rawValue,InDuct.rawValue]
}

class Humidifier: Appliance {
    
    var humidifiertype : HumidifierType = .InDuct
    var isFilterFree : Bool = false
    var isultrasonic: Bool = false
    var ultrasonic: String = ""

    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        humidifiertype <- map["humidifiertype"]
        isFilterFree <- map["isFilterFree"]
        isultrasonic <- map["isultrasonic"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        powertype = ai.pt
        year = ai.year
        humidifiertype = ai.humidifiertype
        isFilterFree = ai.isfilterfree
        isultrasonic = ai.isultrasonic
        
        if isFilterFree == false {
            isMaintenanceRequired = true
        }
        
        ultrasonic = "Ultrasonic humidifiers use a vibrating nebulizer to emit water. Evaporative tabletops use a fan to blow air over a wet wick. Warm-mist models use a heating unit to boil water before cooling the steam. Impeller models produce mist using a rotating disk. Performance varies widely by type"
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(Humidifier.HumidifierType.Tabletop.ToString(), 5)
        lifespanWarn.Add(Humidifier.HumidifierType.Console.ToString(), 5)
        lifespanWarn.Add(Humidifier.HumidifierType.InDuct.ToString(), 8)
        
        
        lifespanAlarm.Add(Humidifier.HumidifierType.Tabletop.ToString(), 10)
        lifespanAlarm.Add(Humidifier.HumidifierType.Console.ToString(), 10)
        lifespanAlarm.Add(Humidifier.HumidifierType.InDuct.ToString(), 15)
        */
        
        lifespanWarn[HumidifierType.Tabletop.rawValue] = 5
        lifespanWarn[HumidifierType.Console.rawValue] = 5
        lifespanWarn[HumidifierType.InDuct.rawValue] = 8
        
        lifespanAlarm[HumidifierType.Tabletop.rawValue] = 10
        lifespanAlarm[HumidifierType.Console.rawValue] = 10
        lifespanAlarm[HumidifierType.InDuct.rawValue] = 15
        
        if isMaintenanceRequired {
            maintenanceWarn[HumidifierType.Tabletop.rawValue] = 12
            maintenanceWarn[HumidifierType.Console.rawValue] = 12
            maintenanceWarn[HumidifierType.InDuct.rawValue] = 12
            
            maintenanceAlarm[HumidifierType.Tabletop.rawValue] = 24
            maintenanceAlarm[HumidifierType.Console.rawValue] = 24
            maintenanceAlarm[HumidifierType.InDuct.rawValue] = 24
        }
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let tabletop = ArticleInfo(desc : "portable models cost the least and are fine for humidifying a single room, but their small tank requires frequent refills",
            dura : 3,
            cost : 5,
            mainte : 4,
            install : 1)
        let console = ArticleInfo(desc : "larger than tabletops, they can still be moved from room to room",
            dura : 3,
            cost : 4,
            mainte : 4,
            install : 2)
        let induct = ArticleInfo(desc : "ideal choice if you have a forced-air heating system and want to humidify the whole house",
            dura : 4,
            cost : 3,
            mainte : 3,
            install : 5)
        
        /*
        articleinfo.Add(Humidifier.HumidifierType.Tabletop.ToString(), tabletop)
        articleinfo.Add(Humidifier.HumidifierType.Console.ToString(), console)
        articleinfo.Add(Humidifier.HumidifierType.InDuct.ToString(), induct)
        */
        
        articleinfo[HumidifierType.Tabletop.rawValue] = tabletop
        articleinfo[HumidifierType.Console.rawValue] = console
        articleinfo[HumidifierType.InDuct.rawValue] = induct
        
    }
}
