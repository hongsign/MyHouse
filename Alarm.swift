//
//  Alarm.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-01.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum AlarmType: String {
    case Smoke
    case Monoxide
    case Security
    
    static let strings = [Smoke.rawValue,Monoxide.rawValue,Security.rawValue]
}

class Alarm : Appliance {
    
    var alarmtype : AlarmType = AlarmType.Smoke
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        alarmtype <- map["alarmtype"]
    }
    
    override func initialize(ai: ArticleInitData) {
        
        super.initialize(ai: ai)
        
        articletype = ai.at
        powertype = ai.pt
        alarmtype = ai.alarmtype
        year = ai.year
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        //lifespanWarn.Add(Alarm.AlarmType.Smoke.ToString(), 10)
        //lifespanWarn.Add(Alarm.AlarmType.Monoxide.ToString(), 10)
        //lifespanWarn.Add(Alarm.AlarmType.Security.ToString(), 15)
        
        
        //lifespanAlarm.Add(Alarm.AlarmType.Smoke.ToString(), 15)
        //lifespanAlarm.Add(Alarm.AlarmType.Monoxide.ToString(), 15)
        //lifespanAlarm.Add(Alarm.AlarmType.Security.ToString(), 20)
        
        lifespanWarn[AlarmType.Smoke.rawValue] = 10
        lifespanWarn[AlarmType.Monoxide.rawValue] = 10
        lifespanWarn[AlarmType.Security.rawValue] = 15
        
        lifespanAlarm[AlarmType.Smoke.rawValue] = 15
        lifespanAlarm[AlarmType.Monoxide.rawValue] = 15
        lifespanAlarm[AlarmType.Security.rawValue] = 20
        
        
        maintenanceWarn[AlarmType.Smoke.rawValue] = 12
        maintenanceWarn[AlarmType.Monoxide.rawValue] = 12
        maintenanceWarn[AlarmType.Security.rawValue] = 12
        
        maintenanceAlarm[AlarmType.Smoke.rawValue] = 24
        maintenanceAlarm[AlarmType.Monoxide.rawValue] = 24
        maintenanceAlarm[AlarmType.Security.rawValue] = 24
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let smoke = ArticleInfo(desc : "detects smoke that could be photoelectric or ionisation",
            dura : 3,
            cost : 2,
            mainte : 3,
            install : 3)
        let monoxide = ArticleInfo(desc : "not smoke alarms and do not satisfy the legislation. They may be used in addition to smoke alarms for increased warning",
            dura : 3,
            cost : 3,
            mainte : 3,
            install : 3)
        let security = ArticleInfo(desc : "a system designed to detect intrusion and unauthorized entry into a building or area",
            dura : 4,
            cost : 5, 
            mainte : 4, 
            install : 5)
        
        //articleinfo.Add(Alarm.AlarmType.Smoke.ToString(), smoke)
        //articleinfo.Add(Alarm.AlarmType.Monoxide.ToString(), monoxide)
        //articleinfo.Add(Alarm.AlarmType.Security.ToString(), security)
        
        articleinfo[AlarmType.Smoke.rawValue] = smoke
        articleinfo[AlarmType.Monoxide.rawValue] = monoxide
        articleinfo[AlarmType.Security.rawValue] = security
        
    }
    
    
}
