//
//  DeckArticle.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-07.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

enum DeckType: String {
    case PressureTreatedLumber
    case Softwood
    case Hardwood
    case Composites
    case Aluminum
}

class DeckArticle: Article {
    
    var decktype: DeckType = .Softwood
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        decktype <- map["decktype"]
    }
    
    override func initialize(ai: ArticleInitData) {
        
        super.initialize(ai: ai)
        
        articletype = ai.at
        year = ai.year
        decktype = ai.decktype
        isMaintenanceRequired = true
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    
    override func initializeLifespan() {
        
        lifespanWarn[DeckType.PressureTreatedLumber.rawValue] = 10
        lifespanWarn[DeckType.Softwood.rawValue] = 10
        lifespanWarn[DeckType.Hardwood.rawValue] = 15
        lifespanWarn[DeckType.Composites.rawValue] = 10
        lifespanWarn[DeckType.Aluminum.rawValue] = 10
        
        lifespanAlarm[DeckType.PressureTreatedLumber.rawValue] = 15
        lifespanAlarm[DeckType.Softwood.rawValue] = 15
        lifespanAlarm[DeckType.Hardwood.rawValue] = 25
        lifespanAlarm[DeckType.Composites.rawValue] = 15
        lifespanAlarm[DeckType.Aluminum.rawValue] = 15
        
        maintenanceWarn[DeckType.PressureTreatedLumber.rawValue] = 18
        maintenanceWarn[DeckType.Softwood.rawValue] = 18
        maintenanceWarn[DeckType.Hardwood.rawValue] = 18
        maintenanceWarn[DeckType.Composites.rawValue] = 18
        maintenanceWarn[DeckType.Aluminum.rawValue] = 18
        
        maintenanceAlarm[DeckType.PressureTreatedLumber.rawValue] = 36
        maintenanceAlarm[DeckType.Softwood.rawValue] = 36
        maintenanceAlarm[DeckType.Hardwood.rawValue] = 36
        maintenanceAlarm[DeckType.Composites.rawValue] = 36
        maintenanceAlarm[DeckType.Aluminum.rawValue] = 36
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        
        let ptl = ArticleInfo(desc : "It's most popular, affordable, readily available coast-to-coast, and easy to cut and fasten with nails or screws. Most PT decking is milled from southern yellow pine, and then chemically treated to resist rot, fungus and wood-boring bugs",
                                   dura : 3,
                                   cost : 3,
                                   mainte : 2,
                                   install : 3)
        let softwood = ArticleInfo(desc : "Redwood and cedar - western softwoods are prized for their rich color and natural beauty, and because they aren't pumped full of chemicals or preservatives. Both species contain tannins and oils that make them naturally resistant to rot, decay and voracious insects",
                                dura : 3,
                                cost : 2,
                                mainte : 3,
                                install : 3)
        let hardwood = ArticleInfo(desc : "The exotic, rich-grained woods are extremely hard, very durable and naturally resistant to rot and insects. E.g. Massaranduba, cumaru, red tauari, tigerwood, ipe, and Philippine mahogany",
                                 dura : 5,
                                 cost : 5,
                                 mainte : 1,
                                 install : 4)
        let composites = ArticleInfo(desc : "Most products are made from polyethylene or polyvinyl chloride, and come in a wide range of colors",
                                  dura : 3,
                                  cost : 1,
                                  mainte : 1,
                                  install : 2)
        let aluminum = ArticleInfo(desc : "it's an ideal decking material. It is three to four times lighter, yet two to three times stronger compared with wood and composite",
                                  dura : 3,
                                  cost : 1,
                                  mainte : 1,
                                  install : 2)
        
        articleinfo[DeckType.PressureTreatedLumber.rawValue] = ptl
        articleinfo[DeckType.Softwood.rawValue] = softwood
        articleinfo[DeckType.Hardwood.rawValue] = hardwood
        articleinfo[DeckType.Composites.rawValue] = composites
        articleinfo[DeckType.Aluminum.rawValue] = aluminum
        
    }

    
}
