//
//  Article.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-01.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

struct ArticleInitData {
    var at: ArticleType = ArticleType.Chimney
    var pt: PowerType = PowerType.Electric
    var year: Int = 2015
    var month: Int = 1
    
    var airfiltertype: AirfilterType = AirfilterType.Fiberglass
    var sizewidth: Int = 25
    var sizeheight: Int = 16
    
    var airconditionertype: AirconditionerType = AirconditionerType.Portable
    var alarmtype: AlarmType = AlarmType.Smoke
    var centralvaccumtype: CentralVacuumType = CentralVacuumType.FilteredCyclonic
    var fireplacetype: FireplaceType = FireplaceType.Masonry
    var chimneytype: ChimneyType = ChimneyType.Masonry
    var chimeylinertype: ChimneyLinerType = ChimneyLinerType.ClayTile
    var downspouttype: DownspoutType = DownspoutType.Aluminum
    
    var ducttype: DuctType = DuctType.GalvanizedMildSteel
    var numberofvents: Int = 18
    
    var entrydoortype: EntryDoorType = EntryDoorType.SolidWood
    var entrydoorposition: EntryDoorPosition = .main
    
    var fencetype: FenceType = FenceType.Wood
    var fenceyardid: Int = backyardid
    
    var floortype: FloorType = FloorType.Hardwood
    var floordiffusertype: FloorDiffuserType = FloorDiffuserType.Metal
    var furnacetype: FurnaceType = FurnaceType.CentralAir
    var garagedoortype: GarageDoorType = GarageDoorType.Aluminum
    var garagedooropenertype: GarageDoorOpenerType = GarageDoorOpenerType.Chain
    var guttertype: GutterType = GutterType.Aluminum
    var housewindowtype: HouseWindowType = HouseWindowType.Fiberglass
    
    var humidifiertype: HumidifierType = HumidifierType.InDuct
    var isfilterfree: Bool = true
    var isultrasonic: Bool = false
    
    var interiordoortype: InteriorDoorType = InteriorDoorType.HollowCore
    var kitchencabinettype: KitchenCabinetType = KitchenCabinetType.Hardwood
    var oventype: OvenType = OvenType.Convection
    var playsettype: PlaySetType = PlaySetType.Wood
    var pondtype: PondType = PondType.FlexiblePondLiner
    
    //rangehood
    var isductless: Bool = false
    var ductsize: Int = 6
    
    //fridge, waterheatertank, washer
    var capacity: Double = 15.0
    
    
    var rooftype: RoofType = .AsphaltShingles
    var sidingtype: SidingType = SidingType.Aluminum
    var waterheatertype: WaterHeaterType = WaterHeaterType.Tank
    var insulationtype: InsulationType = InsulationType.SprayFoam
    
    var cartype: CarType = .sedan
    var carpowertype: CarPowerType = .petrol
    
    var exteriorwalltype: ExteriorWallType = .Brick
    
    var decktype: DeckType = .Softwood
    
    var drivewaytype: DrivewayType = .Asphalt
    var isheated: Bool = false
    
    var pooltype: PoolType = .Concrete
}

protocol ArticleInitProtocol {
    func initialize(ai: ArticleInitData)
    func initializeLifespan()
    func initializeArticleinfo()
}


class Article: Base, ArticleInitProtocol {
    
    var _articletype: ArticleType = ArticleType.Airconditioner
    var articletype: ArticleType {
        get { return _articletype }
        set(newvalue) {
            if newvalue != _articletype {
                _articletype = newvalue
            }
        }
    }
    
    override var isarticle: Bool {
        return true
    }
    
    //date of made or date of installation
    var year : Int = 2015
    var month : Int = 1
    var day : Int = 1
    
    //article info panel
    var articleinfo: Dictionary<String, ArticleInfo> = Dictionary<String, ArticleInfo>()
    
    //lifespan
    var lifespanWarn = Dictionary<String,Int>()
    var lifespanAlarm = Dictionary<String, Int>()
    
    //maintenance option
    var isMaintenanceRequired : Bool = false
    var maintenanceDate: String = Date().toDateString()
    //maintenance alert system
    //maintenance period
    var maintenanceWarn: [String : Int] = Dictionary<String,Int>()
    var maintenanceAlarm: [String : Int] = Dictionary<String,Int>()
    
    var isappliance: Bool = false
    
    /*-----------------------------------------
     
     indicates if there is internal type of article
     initializeArticleInfo() method must set value
     of this property

     -------------------------------------------*/
    var hasowntype1: Bool = true
    
    /*-----------------------------------------
     
     indicates if there is another internal type of article
     initializeArticleInfo() method must set value
     of this property
     
     -------------------------------------------*/
    var hasowntype2: Bool = false
    
    required init?(map: Map) {
        super.init(map: map)
        
    }
    
    internal init(ai: ArticleInitData) {
        super.init()
        initialize(ai: ai)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        _articletype <- map["_articletype"]
        year <- map["year"]
        month <- map["month"]
        day <- map["day"]
        articleinfo <- map["articleinfo"]
        lifespanWarn <- map["lifespanWarn"]
        lifespanAlarm <- map["lifespanAlarm"]
        isMaintenanceRequired <- map["isMaintenanceRequired"]
        maintenanceDate <- map["maintenanceDate"]
        maintenanceWarn <- map["maintenanceWarn"]
        maintenanceAlarm <- map["maintenanceAlarm"]
        isappliance <- map["isappliance"]
        hasowntype1 <- map["hasOwnType1"]
        hasowntype2 <- map["hasOwnType2"]
    }
    
    //ArticleInit protocol
    func initialize(ai: ArticleInitData) {
        //only can handle year
        //the other two should be handled by subclasses
        
    }
    
    func initializeLifespan() {
        //doing nothing,, but subclass must override
    }
    
    func initializeArticleinfo() {
        //doing nothing, but subclass must override
    }
    
    func initializeAlert() {
        //doing nothing, but subclass must override
    }
    
    func initializeMaintenance() {
        //doing nothing, but subclass with cleaning optin must override
    }
    
    func initializeMaintenanceAlert() {
        //doing nothing, but subclass with cleaning option must override
    }
}
