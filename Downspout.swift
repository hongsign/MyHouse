//
//  Downspout.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum DownspoutType: String {
    case Aluminum
    case GalvanizedSteel
    case Copper
    case Plastic
    
    static let strings = [Aluminum.rawValue,GalvanizedSteel.rawValue,Copper.rawValue,Plastic.rawValue]
}

class Downspout: Article {

    var downspouttype : DownspoutType = .Aluminum
  
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        downspouttype <- map["downspouttype"]
    }

    override func initialize(ai: ArticleInitData) {
        
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        downspouttype = ai.downspouttype
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }

    
    override func initializeLifespan() {
        //lifespanWarn.Add(Downspout.DownspoutType.Aluminum.ToString(), 10)
        //lifespanWarn.Add(Downspout.DownspoutType.GalvanizedSteel.ToString(), 10)
        //lifespanWarn.Add(Downspout.DownspoutType.Copper.ToString(), 15)
        //lifespanWarn.Add(Downspout.DownspoutType.Plastic.ToString(), 10)
        
        //lifespanAlarm.Add(Downspout.DownspoutType.Aluminum.ToString(), 15)
        //lifespanAlarm.Add(Downspout.DownspoutType.GalvanizedSteel.ToString(), 15)
        //lifespanAlarm.Add(Downspout.DownspoutType.Copper.ToString(), 25)
        //lifespanAlarm.Add(Downspout.DownspoutType.Plastic.ToString(), 15)
        
        lifespanWarn[DownspoutType.Aluminum.rawValue] = 10
        lifespanWarn[DownspoutType.GalvanizedSteel.rawValue] = 10
        lifespanWarn[DownspoutType.Copper.rawValue] = 15
        lifespanWarn[DownspoutType.Plastic.rawValue] = 10
        
        lifespanAlarm[DownspoutType.Aluminum.rawValue] = 15
        lifespanAlarm[DownspoutType.GalvanizedSteel.rawValue] = 15
        lifespanAlarm[DownspoutType.Copper.rawValue] = 25
        lifespanAlarm[DownspoutType.Plastic.rawValue] = 15
        
        
        maintenanceWarn[DownspoutType.Aluminum.rawValue] = 18
        maintenanceWarn[DownspoutType.GalvanizedSteel.rawValue] = 18
        maintenanceWarn[DownspoutType.Copper.rawValue] = 18
        maintenanceWarn[DownspoutType.Plastic.rawValue] = 18
        
        maintenanceAlarm[DownspoutType.Aluminum.rawValue] = 36
        maintenanceAlarm[DownspoutType.GalvanizedSteel.rawValue] = 36
        maintenanceAlarm[DownspoutType.Copper.rawValue] = 36
        maintenanceAlarm[DownspoutType.Plastic.rawValue] = 36
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        
        let aluminum = ArticleInfo(desc : "never rust which makes them a better value than galvanized steel, but relatively weak and prone to denting",
            dura : 3,
            cost : 3,
            mainte : 2,
            install : 3)
        let steel = ArticleInfo(desc : "strong, and excellent choice of downspout material in areas that have very cold winters with snow and ice",
            dura : 3,
            cost : 2,
            mainte : 3,
            install : 3)
        let copper = ArticleInfo(desc : "expensive, but strong and durable",
            dura : 5,
            cost : 5,
            mainte : 1,
            install : 4)
        let plastic = ArticleInfo(desc : "surprisingly durable, and not vulnerable to snapping or breaking, but easy to bend and twist out of their original shape, reducing their functionality",
            dura : 3,
            cost : 1,
            mainte : 1,
            install : 2)
        
        
        //articleinfo.Add(Downspout.DownspoutType.Aluminum.ToString(), aluminum)
        //articleinfo.Add(Downspout.DownspoutType.GalvanizedSteel.ToString(), steel)
        //articleinfo.Add(Downspout.DownspoutType.Copper.ToString(), copper)
        //articleinfo.Add(Downspout.DownspoutType.Plastic.ToString(), plastic)
        
        articleinfo[DownspoutType.Aluminum.rawValue] = aluminum
        articleinfo[DownspoutType.GalvanizedSteel.rawValue] = steel
        articleinfo[DownspoutType.Copper.rawValue] = copper
        articleinfo[DownspoutType.Plastic.rawValue] = plastic
        
    }
    
}
