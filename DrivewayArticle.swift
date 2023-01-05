//
//  DrivewayArticle.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-08.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

enum DrivewayType: String {
    case Concrete
    case Asphalt
    case Gravel
    case Pavers
    case Brick
    case Cobblestone
}

class DrivewayArticle: Article {
    
    var drivewaytype: DrivewayType = .Asphalt
    var isheated: Bool = false
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        drivewaytype <- map["drivewaytype"]
    }
    
    override func initialize(ai: ArticleInitData) {
        
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        drivewaytype = ai.drivewaytype
        isheated = ai.isheated
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    
    override func initializeLifespan() {
        lifespanWarn[DrivewayType.Concrete.rawValue] = 30
        lifespanWarn[DrivewayType.Asphalt.rawValue] = 15
        lifespanWarn[DrivewayType.Gravel.rawValue] = 50
        lifespanWarn[DrivewayType.Pavers.rawValue] = 25
        lifespanWarn[DrivewayType.Brick.rawValue] = 25
        lifespanWarn[DrivewayType.Cobblestone.rawValue] = 25
        
        lifespanAlarm[DrivewayType.Concrete.rawValue] = 40
        lifespanAlarm[DrivewayType.Asphalt.rawValue] = 20
        lifespanAlarm[DrivewayType.Gravel.rawValue] = 100
        lifespanAlarm[DrivewayType.Pavers.rawValue] = 35
        lifespanAlarm[DrivewayType.Brick.rawValue] = 35
        lifespanAlarm[DrivewayType.Cobblestone.rawValue] = 35
        
        maintenanceWarn[DrivewayType.Concrete.rawValue] = 60
        maintenanceWarn[DrivewayType.Asphalt.rawValue] = 24
        maintenanceWarn[DrivewayType.Gravel.rawValue] = 12
        maintenanceWarn[DrivewayType.Pavers.rawValue] = 24
        maintenanceWarn[DrivewayType.Brick.rawValue] = 12
        maintenanceWarn[DrivewayType.Cobblestone.rawValue] = 12
        
        maintenanceAlarm[DrivewayType.Concrete.rawValue] = 84
        maintenanceAlarm[DrivewayType.Asphalt.rawValue] = 36
        maintenanceAlarm[DrivewayType.Gravel.rawValue] = 18
        maintenanceAlarm[DrivewayType.Pavers.rawValue] = 36
        maintenanceAlarm[DrivewayType.Brick.rawValue] = 18
        maintenanceAlarm[DrivewayType.Cobblestone.rawValue] = 18
    }
    
    override func initializeArticleinfo() {
        
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        
        let concrete = ArticleInfo(desc : "popular driveway material and for good reason. It's extremely durable and lasts a long time with little need for maintenance save for repairing cracks or stains from oil and gas, but cracks in freezing weather and difficult to repair",
                                   dura : 4,
                                   cost : 3,
                                   mainte : 2,
                                   install : 4)
        let asphalt = ArticleInfo(desc : "affordable option that can help keep driveway installation costs down, and easy repair. However, only comes in black, less durable, requires resealing every 3-5 years and resurfacing regularly",
                                dura : 2,
                                cost : 2,
                                mainte : 3,
                                install : 3)
        let gravel = ArticleInfo(desc : "popular in rural areas and often lead to concrete floors. They can be made from various items like rock, sand and clay. While laying rocks or a mixture is easy for installation, it will require regular maintenance. Gravel driveways can last around a century with maintenance because it doesn't crack, sink or soften",
                                 dura : 5,
                                 cost : 1,
                                 mainte : 1,
                                 install : 2)
        let pavers = ArticleInfo(desc : "have to be installed by hand. offer a really attractive option and will increase your curb appeal, and come in a variety of materials, including concrete, brick and cobblestone, but most expensive",
                                  dura : 4,
                                  cost : 5,
                                  mainte : 4,
                                  install : 5)
        let brick = ArticleInfo(desc : "beautiful, enduring options, easy maintenance. However, need to be sealed or washed, and labor intensive",
                                  dura : 3,
                                  cost : 4,
                                  mainte : 2,
                                  install : 4)
        let cobblestone = ArticleInfo(desc : "beautiful, enduring options, easy maintenance. However, need to be sealed or washed, and labor intensive",
                                  dura : 3,
                                  cost : 4,
                                  mainte : 2,
                                  install : 4)
        
        
        
        articleinfo[DrivewayType.Concrete.rawValue] = concrete
        articleinfo[DrivewayType.Asphalt.rawValue] = asphalt
        articleinfo[DrivewayType.Gravel.rawValue] = gravel
        articleinfo[DrivewayType.Pavers.rawValue] = pavers
        articleinfo[DrivewayType.Brick.rawValue] = brick
        articleinfo[DrivewayType.Cobblestone.rawValue] = cobblestone
        
    }

    
}
