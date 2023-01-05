//
//  Duct.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum DuctType: String {
    case GalvanizedMildSteel
    case Aluminium
    case Flex
    
    static let strings = [GalvanizedMildSteel.rawValue,Aluminium.rawValue,Flex.rawValue]
}

class Duct: Article {

    var ducttype: DuctType = .GalvanizedMildSteel
    var numberOfVents : Int = 18
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        ducttype <- map["ducttype"]
        numberOfVents <- map["numberOfVents"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        numberOfVents = ai.numberofvents
        ducttype = ai.ducttype
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        //lifespanWarn.Add(Duct.DuctType.GalvanizedMildSteel.ToString(), 50)
        //lifespanWarn.Add(Duct.DuctType.Aluminium.ToString(), 50)
        //lifespanWarn.Add(Duct.DuctType.Flex.ToString(), 50)
        
        //lifespanAlarm.Add(Duct.DuctType.GalvanizedMildSteel.ToString(), 70)
        //lifespanAlarm.Add(Duct.DuctType.Aluminium.ToString(), 70)
        //lifespanAlarm.Add(Duct.DuctType.Flex.ToString(), 70)
        
        lifespanWarn[DuctType.GalvanizedMildSteel.rawValue] = 50
        lifespanWarn[DuctType.Flex.rawValue] = 50
        lifespanWarn[DuctType.Aluminium.rawValue] = 50
        
        lifespanAlarm[DuctType.GalvanizedMildSteel.rawValue] = 70
        lifespanAlarm[DuctType.Flex.rawValue] = 70
        lifespanAlarm[DuctType.Aluminium.rawValue] = 70
        
        maintenanceWarn[DuctType.GalvanizedMildSteel.rawValue] = 12
        maintenanceWarn[DuctType.Flex.rawValue] = 12
        maintenanceWarn[DuctType.Aluminium.rawValue] = 12
        
        maintenanceAlarm[DuctType.GalvanizedMildSteel.rawValue] = 24
        maintenanceAlarm[DuctType.Flex.rawValue] = 24
        maintenanceAlarm[DuctType.Aluminium.rawValue] = 24
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let galvanizedmildsteel = ArticleInfo(desc : "standard and most common material used in fabricating ductwork. usually have an inner perforated liner",
            dura : 5,
            cost : 3,
            mainte : 4,
            install : 4)
        let aluminium = ArticleInfo(desc : "lightweight and quick to install",
            dura : 5,
            cost : 3,
            mainte : 4,
            install : 2)
        let flex = ArticleInfo(desc : "made of flexible plastic over a metal wire coil to shape a tube. And have variety of insulation configurations",
            dura : 5,
            cost : 3,
            mainte : 4,
            install : 3)
        
        //articleinfo.Add(Duct.DuctType.GalvanizedMildSteel.ToString(), galvanizedmildsteel)
        //articleinfo.Add(Duct.DuctType.Aluminium.ToString(), aluminium)
        //articleinfo.Add(Duct.DuctType.Flex.ToString(), flex)
        
        
        articleinfo[DuctType.GalvanizedMildSteel.rawValue] = galvanizedmildsteel
        articleinfo[DuctType.Aluminium.rawValue] = aluminium
        articleinfo[DuctType.Flex.rawValue] = flex
        
    }
    
}
