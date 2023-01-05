//
//  Car.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-07.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

enum CarType: String {
    case hatchback
    case sedan
    case MPV
    case SUV
    case crossover
    case coupe
    case convertible
}

//all lifespan and maintance will be aligned with carpowertype
enum CarPowerType: String {
    case petrol
    case diesel
    case hybrid
    case electric
}


class Car: Article {
    
    var brand: String = ""
    var cartype: CarType = .sedan
    var carpowertype: CarPowerType = .petrol
    
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        brand <- map["brand"]
        cartype <- map["cartype"]
        carpowertype <- map["carpowertype"]
        
    }
    
    override func initialize(ai: ArticleInitData) {
        
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        cartype = ai.cartype
        carpowertype = ai.carpowertype

        
        initializeLifespan()
        initializeArticleinfo()
        
    }
    
    override func initializeLifespan() {
        lifespanWarn[CarPowerType.petrol.rawValue] = 3
        lifespanWarn[CarPowerType.diesel.rawValue] = 3
        lifespanWarn[CarPowerType.hybrid.rawValue] = 6
        lifespanWarn[CarPowerType.electric.rawValue] = 24

        lifespanAlarm[CarPowerType.petrol.rawValue] = 6
        lifespanAlarm[CarPowerType.diesel.rawValue] = 6
        lifespanAlarm[CarPowerType.hybrid.rawValue] = 12
        lifespanAlarm[CarPowerType.electric.rawValue] = 60
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = true
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let petrol = ArticleInfo(desc : "it uses an internal combustion engine with spark-ignition, designed to run on petrol (gasoline) and similar volatile fuels",
                                     dura : 4,
                                     cost : 2,
                                     mainte : 2,
                                     install : 1)
        let diesel = ArticleInfo(desc : "it uses an internal combustion engine in which ignition of the fuel that has been injected into the combustion chamber is caused by the high temperature which a gas achieves",
                                    dura : 4,
                                    cost : 3,
                                    mainte : 3,
                                    install : 1)
        let hybrid = ArticleInfo(desc : "it uses two or more distinct types of power, such as internal combustion engine plus electric motor",
                               dura : 4,
                               cost : 4,
                               mainte : 4,
                               install : 1)
        let electric = ArticleInfo(desc : "it uses an electrical machine that converts electrical energy into mechanical energy",
                                   dura : 3,
                                   cost : 5,
                                   mainte : 2,
                                   install : 1)
        
        articleinfo[CarPowerType.petrol.rawValue] = petrol
        articleinfo[CarPowerType.diesel.rawValue] = diesel
        articleinfo[CarPowerType.hybrid.rawValue] = hybrid
        articleinfo[CarPowerType.electric.rawValue] = electric
        
    }

    
}
