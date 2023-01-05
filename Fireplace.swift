//
//  Fireplace.swift
//  MyHome
//
//  Created by YU HONG on 2016-10-04.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum FireplaceType: String {
    case Masonry
    case Prefabricated
    case WoodBurningStove
    
    static let strings = [Masonry.rawValue,Prefabricated.rawValue,WoodBurningStove.rawValue]
}

class Fireplace : Appliance {

    var fireplacetype : FireplaceType = FireplaceType.Masonry
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        fireplacetype <- map["fireplacetype"]
    }

    override func initialize(ai: ArticleInitData) {
        
        super.initialize(ai: ai)
        
        articletype = ai.at
        powertype = ai.pt
        year = ai.year
        fireplacetype = ai.fireplacetype
        
        initializeLifespan()
        initializeArticleinfo()
    }
    
    override func initializeLifespan() {
        /*
        lifespanWarn.Add(Fireplace.FireplaceType.Masonry.ToString(), 50)
        lifespanWarn.Add(Fireplace.FireplaceType.Prefabricated.ToString(), 30)
        lifespanWarn.Add(Fireplace.FireplaceType.WoodBurningStove.ToString(), 30)
        
        lifespanAlarm.Add(Fireplace.FireplaceType.Masonry.ToString(), 70)
        lifespanAlarm.Add(Fireplace.FireplaceType.Prefabricated.ToString(), 50)
        lifespanAlarm.Add(Fireplace.FireplaceType.WoodBurningStove.ToString(), 50)
        */
        
        lifespanWarn[FireplaceType.Masonry.rawValue] = 50
        lifespanWarn[FireplaceType.Prefabricated.rawValue] = 30
        lifespanWarn[FireplaceType.WoodBurningStove.rawValue] = 30
        
        lifespanAlarm[FireplaceType.Masonry.rawValue] = 70
        lifespanAlarm[FireplaceType.Prefabricated.rawValue] = 50
        lifespanAlarm[FireplaceType.WoodBurningStove.rawValue] = 50
        
        
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let masonry = ArticleInfo(desc : " built from bricks, blocks, or stone and mortar",
            dura : 5,
            cost : 5,
            mainte : 4,
            install : 5)
        let prefabricated = ArticleInfo(desc : "consist of fireboxes made from sheet metal",
            dura : 4,
            cost : 3,
            mainte : 3,
            install : 3)
        let woodburningstove = ArticleInfo(desc : "contain a stovepipe that rises from the base",
            dura : 4,
            cost : 5,
            mainte : 5,
            install : 5)
        
        /*
        articleinfo.Add(Fireplace.FireplaceType.Masonry.ToString(), masonry)
        articleinfo.Add(Fireplace.FireplaceType.Prefabricated.ToString(), prefabricated)
        articleinfo.Add(Fireplace.FireplaceType.WoodBurningStove.ToString(), woodburningstove)
        */
        
        articleinfo[FireplaceType.Masonry.rawValue] = masonry
        articleinfo[FireplaceType.Prefabricated.rawValue] = prefabricated
        articleinfo[FireplaceType.WoodBurningStove.rawValue] = woodburningstove
        
        
    }
    
}

