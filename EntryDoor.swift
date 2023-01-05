//
//  EntryDoor.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum EntryDoorType: String {
    case EngineeredWood
    case SolidWood
    case Steel
    case FiberglassComposite
    case Aluminum
    
    static let strings = [EngineeredWood.rawValue,SolidWood.rawValue,Steel.rawValue,FiberglassComposite.rawValue,Aluminum.rawValue]
}

enum EntryDoorPosition: String {
    case main
    case basement
}

class EntryDoor: Door {

    var entrydoortype : EntryDoorType = .SolidWood
    var entrydoorposition: EntryDoorPosition = .main
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        entrydoortype <- map["entrydoortype"]
        entrydoorposition <- map["entrydoorposition"]
    }

    override func initialize(ai: ArticleInitData) {
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        entrydoortype = ai.entrydoortype
        entrydoorposition = ai.entrydoorposition
        
        initializeLifespan()
        initializeArticleinfo()
    }

    override func initializeLifespan() {
        //lifespanWarn.Add(EntryDoor.EntryDoorType.EngineeredWood.ToString(), 30)
        //lifespanWarn.Add(EntryDoor.EntryDoorType.SolidWood.ToString(), 30)
        //lifespanWarn.Add(EntryDoor.EntryDoorType.Steel.ToString(), 15)
        //lifespanWarn.Add(EntryDoor.EntryDoorType.FiberglassComposite.ToString(), 30)
        //lifespanWarn.Add(EntryDoor.EntryDoorType.Aluminum.ToString(), 20)
        
        //lifespanAlarm.Add(EntryDoor.EntryDoorType.EngineeredWood.ToString(), 50)
        //lifespanAlarm.Add(EntryDoor.EntryDoorType.SolidWood.ToString(), 50)
        //lifespanAlarm.Add(EntryDoor.EntryDoorType.Steel.ToString(), 25)
        //lifespanAlarm.Add(EntryDoor.EntryDoorType.FiberglassComposite.ToString(), 50)
        //lifespanAlarm.Add(EntryDoor.EntryDoorType.Aluminum.ToString(), 50)
        
        lifespanWarn[EntryDoorType.EngineeredWood.rawValue] = 30
        lifespanWarn[EntryDoorType.SolidWood.rawValue] = 30
        lifespanWarn[EntryDoorType.Steel.rawValue] = 15
        lifespanWarn[EntryDoorType.FiberglassComposite.rawValue] = 30
        lifespanWarn[EntryDoorType.Aluminum.rawValue] = 20
        
        lifespanAlarm[EntryDoorType.EngineeredWood.rawValue] = 50
        lifespanAlarm[EntryDoorType.SolidWood.rawValue] = 50
        lifespanAlarm[EntryDoorType.Steel.rawValue] = 25
        lifespanAlarm[EntryDoorType.FiberglassComposite.rawValue] = 50
        lifespanAlarm[EntryDoorType.Aluminum.rawValue] = 50
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let engineeredwood = ArticleInfo(desc : "a sandwich of wood-veneer skins over an engineered-wood core",
            dura : 4,
            cost : 3,
            mainte : 3,
            install : 3)
        let solidwood = ArticleInfo(desc : "Made of wood, even hardwood",
            dura : 4,
            cost : 5,
            mainte : 4,
            install : 4)
        let steel = ArticleInfo(desc : "an inner frame made of wood or, for greater strength, steel. The cavities within the frame are filled with high-density foam insulation",
            dura : 3,
            cost : 1,
            mainte : 5,
            install : 3)
        let fiberglass = ArticleInfo(desc : " tough and maintenance-free. Voids in the framework are filled with polyurethane-foam insulation",
            dura : 4,
            cost : 2,
            mainte : 1,
            install : 3)
        let aluminum = ArticleInfo(desc : "use an insulation core covered by a metal skin",
            dura : 4,
            cost : 4,
            mainte : 1,
            install : 3)
        
        //articleinfo.Add(EntryDoor.EntryDoorType.EngineeredWood.ToString(), engineeredwood)
        //articleinfo.Add(EntryDoor.EntryDoorType.SolidWood.ToString(), solidwood)
        //articleinfo.Add(EntryDoor.EntryDoorType.Steel.ToString(), steel)
        //articleinfo.Add(EntryDoor.EntryDoorType.FiberglassComposite.ToString(), fiberglass)
        //articleinfo.Add(EntryDoor.EntryDoorType.Aluminum.ToString(), aluminum)
        
        articleinfo[EntryDoorType.EngineeredWood.rawValue] = engineeredwood
        articleinfo[EntryDoorType.SolidWood.rawValue] = solidwood
        articleinfo[EntryDoorType.Steel.rawValue] = steel
        articleinfo[EntryDoorType.FiberglassComposite.rawValue] = fiberglass
        articleinfo[EntryDoorType.Aluminum.rawValue] = aluminum
        
    }
    
}

