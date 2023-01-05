//
//  Gutter.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum GutterType: String {
    case Aluminum
    case GalvanizedSteel
    case Vinyl
    case Copper
    case Wood
    
    static let strings = [Aluminum.rawValue,GalvanizedSteel.rawValue,Vinyl.rawValue,Copper.rawValue,Wood.rawValue]
}

class Gutter: Article {
    
    var guttertype : GutterType = .Aluminum
  
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        guttertype <- map["guttertype"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        guttertype = ai.guttertype
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(Gutter.GutterType.Aluminum.ToString(), 10)
        lifespanWarn.Add(Gutter.GutterType.GalvanizedSteel.ToString(), 10)
        lifespanWarn.Add(Gutter.GutterType.Vinyl.ToString(), 10)
        lifespanWarn.Add(Gutter.GutterType.Copper.ToString(), 15)
        lifespanWarn.Add(Gutter.GutterType.Wood.ToString(), 10)
        
        lifespanAlarm.Add(Gutter.GutterType.Aluminum.ToString(), 15)
        lifespanAlarm.Add(Gutter.GutterType.GalvanizedSteel.ToString(), 15)
        lifespanAlarm.Add(Gutter.GutterType.Vinyl.ToString(), 15)
        lifespanAlarm.Add(Gutter.GutterType.Copper.ToString(), 25)
        lifespanAlarm.Add(Gutter.GutterType.Wood.ToString(), 15)
        */
        
        lifespanWarn[GutterType.Aluminum.rawValue] = 10
        lifespanWarn[GutterType.GalvanizedSteel.rawValue] = 10
        lifespanWarn[GutterType.Vinyl.rawValue] = 10
        lifespanWarn[GutterType.Copper.rawValue] = 15
        lifespanWarn[GutterType.Wood.rawValue] = 10
        
        lifespanAlarm[GutterType.Aluminum.rawValue] = 15
        lifespanAlarm[GutterType.GalvanizedSteel.rawValue] = 15
        lifespanAlarm[GutterType.Vinyl.rawValue] = 15
        lifespanAlarm[GutterType.Copper.rawValue] = 25
        lifespanAlarm[GutterType.Wood.rawValue] = 15
        
        maintenanceWarn[GutterType.Aluminum.rawValue] = 18
        maintenanceWarn[GutterType.GalvanizedSteel.rawValue] = 18
        maintenanceWarn[GutterType.Vinyl.rawValue] = 18
        maintenanceWarn[GutterType.Copper.rawValue] = 18
        maintenanceWarn[GutterType.Wood.rawValue] = 18
        
        maintenanceAlarm[GutterType.Aluminum.rawValue] = 36
        maintenanceAlarm[GutterType.GalvanizedSteel.rawValue] = 36
        maintenanceAlarm[GutterType.Vinyl.rawValue] = 36
        maintenanceAlarm[GutterType.Copper.rawValue] = 36
        maintenanceAlarm[GutterType.Wood.rawValue] = 36
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        
        let aluminum = ArticleInfo(desc : "never rust which makes them a better value than galvanized steel",
            dura : 3,
            cost : 3,
            mainte : 2,
            install : 3)
        let steel = ArticleInfo(desc : "the most economical",
            dura : 3,
            cost : 2,
            mainte : 3,
            install : 3)
        let vinyl = ArticleInfo(desc : "esay to install, but can get brittle in extreme cold or with age",
            dura : 3,
            cost : 1,
            mainte : 2,
            install : 1)
        let copper = ArticleInfo(desc : "doesn't require any finish and doesn’t rust, but expensive",
            dura : 5,
            cost : 5,
            mainte : 1,
            install : 4)
        let wood = ArticleInfo(desc : "expensive and requiring a lot of maintenance, wood gutters are rarely installed",
            dura : 3,
            cost : 4,
            mainte : 4,
            install : 4)
        
        
        /*
        articleinfo.Add(Gutter.GutterType.Aluminum.ToString(), aluminum)
        articleinfo.Add(Gutter.GutterType.GalvanizedSteel.ToString(), steel)
        articleinfo.Add(Gutter.GutterType.Vinyl.ToString(), vinyl)
        articleinfo.Add(Gutter.GutterType.Copper.ToString(), copper)
        articleinfo.Add(Gutter.GutterType.Wood.ToString(), wood)
        */
        
        articleinfo[GutterType.Aluminum.rawValue] = aluminum
        articleinfo[GutterType.GalvanizedSteel.rawValue] = steel
        articleinfo[GutterType.Vinyl.rawValue] = vinyl
        articleinfo[GutterType.Copper.rawValue] = copper
        articleinfo[GutterType.Wood.rawValue] = wood
        
    }
    
}

