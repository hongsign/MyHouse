//
//  HouseWindow.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum HouseWindowType: String {
    case Fiberglass
    case Hardwood
    case Softwood
    case Vinyl
    case Aluminum
    
    static let strings = [Fiberglass.rawValue,Hardwood.rawValue,Softwood.rawValue,Vinyl.rawValue,Aluminum.rawValue]
    
    //public static var count: Int { return self.Aluminum.GetHashCode() + 1 }
}


class HouseWindow: Article {
    
    var housewindowtype : HouseWindowType = .Fiberglass

    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        housewindowtype <- map["housewindowtype"]
    }
    
    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        housewindowtype = ai.housewindowtype
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }

    override func initializeLifespan() {
        
        //lifespanWarn.Add(HouseWindow.HouseWindowType.Fiberglass.ToString(), 20)
        //lifespanWarn.Add(HouseWindow.HouseWindowType.Hardwood.ToString(), 20)
        //lifespanWarn.Add(HouseWindow.HouseWindowType.Softwood.ToString(), 10)
        //lifespanWarn.Add(HouseWindow.HouseWindowType.Vinyl.ToString(), 15)
        //lifespanWarn.Add(HouseWindow.HouseWindowType.Aluminum.ToString(), 10)
        //lifespanAlarm.Add(HouseWindow.HouseWindowType.Fiberglass.ToString(), 30)
        //lifespanAlarm.Add(HouseWindow.HouseWindowType.Hardwood.ToString(), 30)
        //lifespanAlarm.Add(HouseWindow.HouseWindowType.Softwood.ToString(), 15)
        //lifespanAlarm.Add(HouseWindow.HouseWindowType.Vinyl.ToString(), 30)
        //lifespanAlarm.Add(HouseWindow.HouseWindowType.Aluminum.ToString(), 20)
        
        
        lifespanWarn[HouseWindowType.Fiberglass.rawValue] = 20
        lifespanWarn[HouseWindowType.Hardwood.rawValue] = 20
        lifespanWarn[HouseWindowType.Softwood.rawValue] = 10
        lifespanWarn[HouseWindowType.Vinyl.rawValue] = 15
        lifespanWarn[HouseWindowType.Aluminum.rawValue] = 10
        
        lifespanAlarm[HouseWindowType.Fiberglass.rawValue] = 30
        lifespanAlarm[HouseWindowType.Hardwood.rawValue] = 30
        lifespanAlarm[HouseWindowType.Softwood.rawValue] = 15
        lifespanAlarm[HouseWindowType.Vinyl.rawValue] = 30
        lifespanAlarm[HouseWindowType.Aluminum.rawValue] = 20
        
        maintenanceWarn[HouseWindowType.Fiberglass.rawValue] = 36
        maintenanceWarn[HouseWindowType.Hardwood.rawValue] = 36
        maintenanceWarn[HouseWindowType.Softwood.rawValue] = 24
        maintenanceWarn[HouseWindowType.Vinyl.rawValue] = 48
        maintenanceWarn[HouseWindowType.Aluminum.rawValue] = 36
        
        maintenanceAlarm[HouseWindowType.Fiberglass.rawValue] = 60
        maintenanceAlarm[HouseWindowType.Hardwood.rawValue] = 60
        maintenanceAlarm[HouseWindowType.Softwood.rawValue] = 36
        maintenanceAlarm[HouseWindowType.Vinyl.rawValue] = 72
        maintenanceAlarm[HouseWindowType.Aluminum.rawValue] = 60
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        
        
        let fiberglass = ArticleInfo(desc : "Fiberglass window frames are dimensionally stable and have air cavities that can be filled with insulation",
            dura : 4,
            cost : 4,
            mainte : 2,
            install : 3)
        let hardwood = ArticleInfo(desc : "Hardwood is expensive, but is durable and only needs the protection of oil",
            dura : 4,
            cost : 4,
            mainte : 3,
            install : 3)
        let softwood = ArticleInfo(desc : "Softwood windows need to be protected by paint or a natural wood finish, and regularly maintained",
            dura : 2,
            cost : 3,
            mainte : 4,
            install : 3)
        let vinyl = ArticleInfo(desc : "Double-glazed, vinyl windows offer excellent heat and sound insulation",
            dura : 4,
            cost : 2,
            mainte : 2,
            install : 3)
        let aluminum = ArticleInfo(desc : "aluminum windows can be an excellent option-the strength of aluminum means a thin frame can support a large expanse of glass",
            dura : 3,
            cost : 2,
            mainte : 2,
            install : 2)
        
        /*
        articleinfo.Add(HouseWindow.HouseWindowType.Fiberglass.ToString(), fiberglass)
        articleinfo.Add(HouseWindow.HouseWindowType.Hardwood.ToString(), hardwood)
        articleinfo.Add(HouseWindow.HouseWindowType.Softwood.ToString(), softwood)
        articleinfo.Add(HouseWindow.HouseWindowType.Vinyl.ToString(), vinyl)
        articleinfo.Add(HouseWindow.HouseWindowType.Aluminum.ToString(), aluminum)
        */
        
        articleinfo[HouseWindowType.Fiberglass.rawValue] = fiberglass
        articleinfo[HouseWindowType.Hardwood.rawValue] = hardwood
        articleinfo[HouseWindowType.Softwood.rawValue] = softwood
        articleinfo[HouseWindowType.Vinyl.rawValue] = vinyl
        articleinfo[HouseWindowType.Aluminum.rawValue] = aluminum
        
    }
}

