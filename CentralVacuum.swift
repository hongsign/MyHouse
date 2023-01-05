//
//  CentralVacuum.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-01.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum CentralVacuumType: String {
    case Bag
    case Bagless
    case FilteredCyclonic
    case AllCyclonic
    
    static let strings = [Bag.rawValue,Bagless.rawValue,FilteredCyclonic.rawValue,AllCyclonic.rawValue]
}


class CentralVacuum : Appliance {
    
    var cvtype : CentralVacuumType = CentralVacuumType.Bagless
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        cvtype <- map["cvtype"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        powertype = ai.pt
        year = ai.year
        cvtype = ai.centralvaccumtype
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    

    
    override func initializeLifespan() {
        //lifespanWarn.Add(CentralVacuum.CentralVacuumType.Bag.ToString(), 15)
        //lifespanWarn.Add(CentralVacuum.CentralVacuumType.Bagless.ToString(), 15)
        //lifespanWarn.Add(CentralVacuum.CentralVacuumType.FilteredCyclonic.ToString(), 15)
        //lifespanWarn.Add(CentralVacuum.CentralVacuumType.AllCyclonic.ToString(), 15)
        
        
        //lifespanAlarm.Add(CentralVacuum.CentralVacuumType.Bag.ToString(), 20)
        //lifespanAlarm.Add(CentralVacuum.CentralVacuumType.Bagless.ToString(), 20)
        //lifespanAlarm.Add(CentralVacuum.CentralVacuumType.FilteredCyclonic.ToString(), 20)
        //lifespanAlarm.Add(CentralVacuum.CentralVacuumType.AllCyclonic.ToString(), 20)
        
        lifespanWarn[CentralVacuumType.Bag.rawValue] = 15
        lifespanWarn[CentralVacuumType.Bagless.rawValue] = 15
        lifespanWarn[CentralVacuumType.FilteredCyclonic.rawValue] = 15
        lifespanWarn[CentralVacuumType.AllCyclonic.rawValue] = 15
        
        lifespanAlarm[CentralVacuumType.Bag.rawValue] = 20
        lifespanAlarm[CentralVacuumType.Bagless.rawValue] = 20
        lifespanAlarm[CentralVacuumType.FilteredCyclonic.rawValue] = 20
        lifespanAlarm[CentralVacuumType.AllCyclonic.rawValue] = 20
        
        
        maintenanceWarn[CentralVacuumType.Bag.rawValue] = 6
        maintenanceWarn[CentralVacuumType.Bagless.rawValue] = 6
        maintenanceWarn[CentralVacuumType.FilteredCyclonic.rawValue] = 3
        maintenanceWarn[CentralVacuumType.AllCyclonic.rawValue] = 6
        
        maintenanceAlarm[CentralVacuumType.Bag.rawValue] = 12
        maintenanceAlarm[CentralVacuumType.Bagless.rawValue] = 12
        maintenanceAlarm[CentralVacuumType.FilteredCyclonic.rawValue] = 6
        maintenanceAlarm[CentralVacuumType.AllCyclonic.rawValue] = 12
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let bag = ArticleInfo(desc : "for homes when outside venting is not possible or desired.  Bags are typically changed 1-2 times a year",
            dura : 3,
            cost : 3,
            mainte : 2,
            install : 3)
        let bagless = ArticleInfo(desc : "dirt is funneled in around the filter so that it does not cling to the filter.  Needs to be emptied every 3-6 months",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        let filteredcyclonic = ArticleInfo(desc : "small particles are filtered out.  Needs to empted every two months",
            dura : 3,
            cost : 3,
            mainte : 4,
            install : 3)
        let allcyclonic = ArticleInfo(desc : "dirt is tossed about so heavier particles fall to the bottom of the canister and smaller particles are vented outside. Needs to be empted every 3 months depending upon usage",
            dura : 3,
            cost : 3,
            mainte : 4,
            install : 3)
        
        //articleinfo.Add(CentralVacuum.CentralVacuumType.Bag.ToString(), bag)
        //articleinfo.Add(CentralVacuum.CentralVacuumType.Bagless.ToString(), bagless)
        //articleinfo.Add(CentralVacuum.CentralVacuumType.FilteredCyclonic.ToString(), filteredcyclonic)
        //articleinfo.Add(CentralVacuum.CentralVacuumType.AllCyclonic.ToString(), allcyclonic)
        
        articleinfo[CentralVacuumType.Bag.rawValue] = bag
        articleinfo[CentralVacuumType.Bagless.rawValue] = bagless
        articleinfo[CentralVacuumType.FilteredCyclonic.rawValue] = filteredcyclonic
        articleinfo[CentralVacuumType.AllCyclonic.rawValue] = allcyclonic
        
    }
    
}
