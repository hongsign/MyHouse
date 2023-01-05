//
//  AirConditioner.swift
//  MyHome
//
//  Created by YU HONG on 2016-09-30.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum AirconditionerType: String {
    case Portable
    case Window
    case Split
    
    static var strings = ["Portable","Window","Split"]
}

class Airconditioner : Appliance {
    
    var actype : AirconditionerType = AirconditionerType.Portable
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
        
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        actype <- map["actype"]
    }
    
    override func initialize(ai: ArticleInitData) {
        
        super.initialize(ai: ai)
        
        self.articletype = ai.at
        self.actype = ai.airconditionertype
        self.powertype = ai.pt
        self.year = ai.year
        self.isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(Airconditioner.AirconditionerType.Portable.ToString(), 15)
        lifespanWarn.Add(Airconditioner.AirconditionerType.Window.ToString(), 15)
        lifespanWarn.Add(Airconditioner.AirconditionerType.Split.ToString(), 15)
        //lifespanWarn.Add(Airconditioner.AirconditionerType.Central.ToString(), 15)
        
        
        lifespanAlarm.Add(Airconditioner.AirconditionerType.Portable.ToString(), 20)
        lifespanAlarm.Add(Airconditioner.AirconditionerType.Window.ToString(), 20)
        lifespanAlarm.Add(Airconditioner.AirconditionerType.Split.ToString(), 20)
        //lifespanAlarm.Add(Airconditioner.AirconditionerType.Central.ToString(), 20)
        */
        
        lifespanWarn[AirconditionerType.Portable.rawValue] = 15
        lifespanWarn[AirconditionerType.Window.rawValue] = 15
        lifespanWarn[AirconditionerType.Split.rawValue] = 15
        
        lifespanAlarm[AirconditionerType.Portable.rawValue] = 20
        lifespanAlarm[AirconditionerType.Window.rawValue] = 20
        lifespanAlarm[AirconditionerType.Split.rawValue] = 20
        
        maintenanceWarn[AirconditionerType.Portable.rawValue] = 12
        maintenanceWarn[AirconditionerType.Window.rawValue] = 12
        maintenanceWarn[AirconditionerType.Split.rawValue] = 12
        
        maintenanceAlarm[AirconditionerType.Portable.rawValue] = 24
        maintenanceAlarm[AirconditionerType.Window.rawValue] = 24
        maintenanceAlarm[AirconditionerType.Split.rawValue] = 24
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let portable = ArticleInfo(desc : "consists of a mobile self contained air conditioning unit that is placed on the floor inside a room and discharges exhaust heat using a hose vent through an exterior wall",
            dura : 3,
            cost : 4,
            mainte : 4,
            install : 2)
        let win = ArticleInfo(desc : "consists of a self contained air conditioning unit that is placed in a window or through a hole in an exterior wall",
            dura : 3,
            cost : 2,
            mainte : 3,
            install : 3)
        let split = ArticleInfo(desc : "breaks the air conditioning system into two packages or terminal units and refrigerant tubing passes through the wall connecting both package units",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 4)
        //var central = ArticleInfo(desc : "the premium cooling solution for your home. It is the quietest, best performing and most comfortable",
        //dura : 4,
        //cost : 5,
        //mainte : 3,
        //install : 5)
        
        //articleinfo.Add(Airconditioner.AirconditionerType.Portable.ToString(), portable)
        //articleinfo.Add(Airconditioner.AirconditionerType.Window.ToString(), win)
        //articleinfo.Add(Airconditioner.AirconditionerType.Split.ToString(), split)
        //articleinfo.Add(Airconditioner.AirconditionerType.Central.ToString(), central)
        
        articleinfo[AirconditionerType.Portable.rawValue] = portable
        articleinfo[AirconditionerType.Window.rawValue] = win
        articleinfo[AirconditionerType.Split.rawValue] = split
        
    }
    
}
