//
//  AirFilter.swift
//  MyHome
//
//  Created by YU HONG on 2016-09-30.
//  Copyright © 2016 homesoft. All rights reserved.
//

import Foundation
import ObjectMapper

enum AirfilterType: String {
    case Fiberglass
    case PolyesterPleated
    case HEPA
    case Washable
    
    static let strings = [Fiberglass.rawValue,PolyesterPleated.rawValue,HEPA.rawValue,Washable.rawValue]
}

class Airfilter: Article {

    var airfiltertype: AirfilterType = AirfilterType.Fiberglass
    
    var sizeWidth : Int = 25
    var sizeHeight : Int = 16
    
    override init(ai: ArticleInitData) {
        super.init(ai: ai)
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        airfiltertype <- map["airfiltertype"]
        sizeWidth <- map["sizeWidth"]
        sizeHeight <- map["sizeHeight"]
    }
    
    override func initialize(ai: ArticleInitData) {
        
        super.initialize(ai: ai)
        
        articletype = ai.at
        airfiltertype = ai.airfiltertype
        year = ai.year
        month = ai.month
        sizeWidth = ai.sizewidth
        sizeHeight = ai.sizeheight
        
        initializeLifespan()
        initializeArticleinfo()
        
    }
    
    override func initializeLifespan() {
        //3 month clean warning
        //lifespanWarn.Add(Article.ArticleType.Airfilter.ToString(), 3)
        lifespanWarn[AirfilterType.Fiberglass.rawValue] = 3
        lifespanWarn[AirfilterType.PolyesterPleated.rawValue] = 3
        lifespanWarn[AirfilterType.HEPA.rawValue] = 6
        lifespanWarn[AirfilterType.Washable.rawValue] = 24
        //6 month clean alarm
        //lifespanAlarm.Add(Article.ArticleType.Airfilter.ToString(), 6)
        lifespanAlarm[AirfilterType.Fiberglass.rawValue] = 6
        lifespanAlarm[AirfilterType.PolyesterPleated.rawValue] = 6
        lifespanAlarm[AirfilterType.HEPA.rawValue] = 12
        lifespanAlarm[AirfilterType.Washable.rawValue] = 60
    }
    
    override func initializeArticleinfo() {
        
        hasowntype1 = true
        hasowntype2 = false
        
        //desc : String, dura : Int, cost : Int, mainte : Int, install : Int
        let fiberglass = ArticleInfo(desc : "throwaway air filter is the most common type. Layered fiberglass fibers are laid over each other to form the filter media and typically are reinforced with a metal grating that supports the fiberglass to prevent failure and collapse",
            dura : 3,
            cost : 2,
            mainte : 1,
            install : 2)
        let polyester = ArticleInfo(desc : "similar to fiberglass filters but typically have a higher resistance to airflow and a superior dust-stopping ability",
            dura : 3,
            cost : 3,
            mainte : 1,
            install : 2)
        let hepa = ArticleInfo(desc : "air passing through them at a very fine scale. By DOE standard, it filters filter 99.97 percent of all particles 0.3 microns or larger",
            dura : 4,
            cost : 5,
            mainte : 1,
            install : 2)
        let washable = ArticleInfo(desc : "not as common and rely on the build-up of dust along the cloth to improve the efficiency of the filter. Industrial processes involving high volumes of coarse dust are typical applications.",
            dura : 5,
            cost : 2,
            mainte : 5,
            install : 3)
        //see design-04 (update design-04)
        //airfilter.isDescOnly = true
        
        //articleinfo.Add(Article.ArticleType.Airfilter.ToString(), airfilter)
        articleinfo[AirfilterType.Fiberglass.rawValue] = fiberglass
        articleinfo[AirfilterType.PolyesterPleated.rawValue] = polyester
        articleinfo[AirfilterType.HEPA.rawValue] = hepa
        articleinfo[AirfilterType.Washable.rawValue] = washable
        
    }
    
}
