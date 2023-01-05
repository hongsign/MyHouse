//
//  ArticleRepo.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-03.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

typealias ArticleRepoIndex = (
    id: Int,
    containerid: Int,
    type: ArticleType,
    ai: ArticleInitData
)

class ArticleRepo: RepoBase {
    
    override init() {
        super.init()
        
        indexes = [ArticleRepoIndex]()
        
        airconiditioner = [Airconditioner]()
        airfilter = [Airfilter]()
        airpurifier = [AirPurifier]()
        alarm = [Alarm]()
        atticfan = [AtticFan]()
        bbq = [BBQ]()
        blower = [Blower]()
        blowervac = [BlowerVac]()
        car = [Car]()
        centralairconditioner = [CentralAirconditioner]()
        centralvacuum = [CentralVacuum]()
        chimney = [Chimney]()
        deck = [DeckArticle]()
        dehumidifier = [Dehumidifier]()
        dishwasher = [DishWasher]()
        doorbell = [Doorbell]()
        downspout = [Downspout]()
        driveway = [DrivewayArticle]()
        dryer = [Dryer]()
        duct = [Duct]()
        electrostatic = [Electrostatic]()
        entrydoor = [EntryDoor]()
        exteriorwall = [ExteriorWall]()
        fence = [Fence]()
        fireplace = [Fireplace]()
        floor = [Floor]()
        floordiffuser = [FloorDiffuser]()
        freezer = [Freezer]()
        furnace = [Furnace]()
        garagedoor = [GarageDoor]()
        garagedooropener = [GarageDoorOpener]()
        gutter = [Gutter]()
        heater = [Heater]()
        housewindow = [HouseWindow]()
        humidifier = [Humidifier]()
        insulation = [Insulation]()
        interiordoor = [InteriorDoor]()
        kitchencabinet = [KitchenCabinet]()
        mower = [Mower]()
        oven = [Oven]()
        playset = [PlaySet]()
        pond = [Pond]()
        pool = [PoolArticle]()
        rangehood = [RangeHood]()
        refrigerator = [Refrigerator]()
        roof = [Roof]()
        siding = [Siding]()
        stove = [Stove]()
        trimmer = [Trimmer]()
        washer = [Washer]()
        waterheater = [WaterHeater]()
        
        repotype = .article
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        indexes <- map["indexes"]
        
        airconiditioner <- map["airconditioner"]
        airfilter <- map["airfilter"]
        airpurifier <- map["airpurifier"]
        alarm <- map["alarm"]
        atticfan <- map["atticfan"]
        bbq <- map["bbq"]
        blower <- map["blower"]
        blowervac <- map["blowervac"]
        car <- map["car"]
        centralairconditioner <- map["centralairconditioner"]
        centralvacuum <- map["centralvacuum"]
        chimney <- map["chimney"]
        deck <- map["deck"]
        dehumidifier <- map["dehumidifier"]
        dishwasher <- map["dishwasher"]
        doorbell <- map["doorbell"]
        downspout <- map["downspout"]
        driveway <- map["driveway"]
        dryer <- map["dryer"]
        duct <- map["duct"]
        electrostatic <- map["electrostatic"]
        entrydoor <- map["entrydoor"]
        exteriorwall <- map["exteriorwall"]
        fence <- map["fence"]
        fireplace <- map["fireplace"]
        floor <- map["floor"]
        floordiffuser <- map["floordiffuser"]
        freezer <- map["freezer"]
        furnace <- map["furnace"]
        garagedoor <- map["garagedoor"]
        garagedooropener <- map["garagedooropener"]
        gutter <- map["gutter"]
        heater <- map["heater"]
        housewindow <- map["housewindow"]
        humidifier <- map["humidifier"]
        insulation <- map["insulation"]
        interiordoor <- map["interiordoor"]
        kitchencabinet <- map["kitchencabinet"]
        mower <- map["mower"]
        oven <- map["oven"]
        playset <- map["playset"]
        pond <- map["pond"]
        pool <- map["pool"]
        rangehood <- map["rangehood"]
        refrigerator <- map["refrigerator"]
        roof <- map["roof"]
        siding <- map["siding"]
        stove <- map["stove"]
        trimmer <- map["trimmer"]
        washer <- map["washer"]
        waterheater <- map["waterheater"]
    }
    
    var indexes: [ArticleRepoIndex]!
    
    var airconiditioner: [Airconditioner]!
    var airfilter: [Airfilter]!
    var airpurifier: [AirPurifier]!
    var alarm: [Alarm]!
    var atticfan: [AtticFan]!
    var bbq: [BBQ]!
    var blower: [Blower]!
    var blowervac: [BlowerVac]!
    var car: [Car]!
    var centralairconditioner: [CentralAirconditioner]!
    var centralvacuum: [CentralVacuum]!
    var chimney: [Chimney]!
    var deck: [DeckArticle]!
    var dehumidifier: [Dehumidifier]!
    var dishwasher: [DishWasher]!
    var doorbell: [Doorbell]!
    var downspout: [Downspout]!
    var driveway: [DrivewayArticle]!
    var dryer: [Dryer]!
    var duct: [Duct]!
    var electrostatic: [Electrostatic]!
    var entrydoor: [EntryDoor]!
    var exteriorwall: [ExteriorWall]!
    var fence: [Fence]!
    var fireplace: [Fireplace]!
    var floor: [Floor]!
    var floordiffuser: [FloorDiffuser]!
    var freezer: [Freezer]!
    var furnace: [Furnace]!
    var garagedoor: [GarageDoor]!
    var garagedooropener: [GarageDoorOpener]!
    var gutter: [Gutter]!
    var heater: [Heater]!
    var housewindow: [HouseWindow]!
    var humidifier: [Humidifier]!
    var insulation: [Insulation]!
    var interiordoor: [InteriorDoor]!
    var kitchencabinet: [KitchenCabinet]!
    var mower: [Mower]!
    var oven: [Oven]!
    var playset: [PlaySet]!
    var pond: [Pond]!
    var pool: [PoolArticle]!
    var rangehood: [RangeHood]!
    var refrigerator: [Refrigerator]!
    var roof: [Roof]!
    var siding: [Siding]!
    var stove: [Stove]!
    var trimmer: [Trimmer]!
    var washer: [Washer]!
    var waterheater: [WaterHeater]!
    
    func add(index: ArticleRepoIndex) {
        switch index.type {
        case .Airconditioner:
            let arti = Airconditioner(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            airconiditioner.append(arti)
        case .Airfilter:
            let arti = Airfilter(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            airfilter.append(arti)
        case .AirPurifier:
            let arti = AirPurifier(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            airpurifier.append(arti)
        case .Alarm:
            let arti = Alarm(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            alarm.append(arti)
        case .AtticFan:
            let arti = AtticFan(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            atticfan.append(arti)
        case .BBQ:
            let arti = BBQ(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            bbq.append(arti)
        case .Blower:
            let arti = Blower(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            blower.append(arti)
        case .BlowerVac:
            let arti = BlowerVac(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            blowervac.append(arti)
        case .Car:
            let arti = Car(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            car.append(arti)
        case .CentralAirconditioner:
            let arti = CentralAirconditioner(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            centralairconditioner.append(arti)
        case .CentralVacuum:
            let arti = CentralVacuum(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            centralvacuum.append(arti)
        case .Chimney:
            let arti = Chimney(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            chimney.append(arti)
        case .Deck:
            let arti = DeckArticle(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            deck.append(arti)
        case .Dehumidifier:
            let arti = Dehumidifier(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            dehumidifier.append(arti)
        case .DishWasher:
            let arti = DishWasher(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            dishwasher.append(arti)
        case .Doorbell:
            let arti = Doorbell(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            doorbell.append(arti)
        case .Downspout:
            let arti = Downspout(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            downspout.append(arti)
        case .Driveway:
            let arti = DrivewayArticle(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            driveway.append(arti)
        case .Dryer:
            let arti = Dryer(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            dryer.append(arti)
        case .Duct:
            let arti = Duct(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            duct.append(arti)
        case .Electrostatic:
            let arti = Electrostatic(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            electrostatic.append(arti)
        case .Entrydoor:
            let arti = EntryDoor(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            entrydoor.append(arti)
        case .ExteriorWall:
            let arti = ExteriorWall(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            exteriorwall.append(arti)
        case .Fence:
            let arti = Fence(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            fence.append(arti)
        case .Fireplace:
            let arti = Fireplace(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            fireplace.append(arti)
        case .Floor:
            let arti = Floor(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            floor.append(arti)
        case .FloorDiffuser:
            let arti = FloorDiffuser(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            floordiffuser.append(arti)
        case .Freezer:
            let arti = Freezer(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            freezer.append(arti)
        case .Furnace:
            let arti = Furnace(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            furnace.append(arti)
        case .GarageDoor:
            let arti = GarageDoor(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            garagedoor.append(arti)
        case .GarageDoorOpener:
            let arti = GarageDoorOpener(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            garagedooropener.append(arti)
        case .Gutter:
            let arti = Gutter(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            gutter.append(arti)
        case .Heater:
            let arti = Heater(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            heater.append(arti)
        case .HouseWindow:
            let arti = HouseWindow(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            housewindow.append(arti)
        case .Humidifier:
            let arti = Humidifier(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            humidifier.append(arti)
        case .Insulation:
            let arti = Insulation(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            insulation.append(arti)
        case .InteriorDoor:
            let arti = InteriorDoor(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            interiordoor.append(arti)
        case .KitchenCabinet:
            let arti = KitchenCabinet(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            kitchencabinet.append(arti)
        case .Mower:
            let arti = Mower(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            mower.append(arti)
        case .Oven:
            let arti = Oven(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            oven.append(arti)
        case .PlaySet:
            let arti = PlaySet(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            playset.append(arti)
        case .Pond:
            let arti = Pond(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            pond.append(arti)
        case .Pool:
            let arti = PoolArticle(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            pool.append(arti)
        case .RangeHood:
            let arti = RangeHood(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            rangehood.append(arti)
        case .Refrigerator:
            let arti = Refrigerator(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            refrigerator.append(arti)
        case .Roof:
            let arti = Roof(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            roof.append(arti)
        case .Siding:
            let arti = Siding(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            siding.append(arti)
        case .Stove:
            let arti = Stove(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            stove.append(arti)
        case .Trimmer:
            let arti = Trimmer(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            trimmer.append(arti)
        case .Washer:
            let arti = Washer(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            washer.append(arti)
        case .WaterHeater:
            let arti = WaterHeater(ai: index.ai)
            arti.id = index.id
            arti.containerid = index.containerid
            waterheater.append(arti)
        case .Unknown: break
        }
        
        indexes.append(index)
        
        isdirty = true
    }
    
    func remove(index: ArticleRepoIndex) {
        let repoind = getRepoIndex(index: index)
        
        switch index.type {
        case .Airconditioner:
            let ind = getArrayIndex(array: airconiditioner, index: index)
            if ind >= 0 {
                airconiditioner.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Airfilter:
            let ind = getArrayIndex(array: airfilter, index: index)
            if ind >= 0 {
                airfilter.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .AirPurifier:
            let ind = getArrayIndex(array: airpurifier, index: index)
            if ind >= 0 {
                airpurifier.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Alarm:
            let ind = getArrayIndex(array: alarm, index: index)
            if ind >= 0 {
                alarm.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .AtticFan:
            let ind = getArrayIndex(array: atticfan, index: index)
            if ind >= 0 {
                atticfan.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .BBQ:
            let ind = getArrayIndex(array: bbq, index: index)
            if ind >= 0 {
                bbq.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Blower:
            let ind = getArrayIndex(array: blower, index: index)
            if ind >= 0 {
                blower.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .BlowerVac:
            let ind = getArrayIndex(array: blowervac, index: index)
            if ind >= 0 {
                blowervac.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Car:
            let ind = getArrayIndex(array: car, index: index)
            if ind >= 0 {
                car.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .CentralAirconditioner:
            let ind = getArrayIndex(array: centralairconditioner, index: index)
            if ind >= 0 {
                centralairconditioner.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .CentralVacuum:
            let ind = getArrayIndex(array: centralvacuum, index: index)
            if ind >= 0 {
                centralvacuum.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Chimney:
            let ind = getArrayIndex(array: chimney, index: index)
            if ind >= 0 {
                chimney.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Deck:
            let ind = getArrayIndex(array: deck, index: index)
            if ind >= 0 {
                deck.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Dehumidifier:
            let ind = getArrayIndex(array: dehumidifier, index: index)
            if ind >= 0 {
                dehumidifier.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .DishWasher:
            let ind = getArrayIndex(array: dishwasher, index: index)
            if ind >= 0 {
                dishwasher.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Doorbell:
            let ind = getArrayIndex(array: doorbell, index: index)
            if ind >= 0 {
                doorbell.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Downspout:
            let ind = getArrayIndex(array: downspout, index: index)
            if ind >= 0 {
                downspout.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Driveway:
            let ind = getArrayIndex(array: driveway, index: index)
            if ind >= 0 {
                driveway.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Dryer:
            let ind = getArrayIndex(array: dryer, index: index)
            if ind >= 0 {
                dryer.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Duct:
            let ind = getArrayIndex(array: duct, index: index)
            if ind >= 0 {
                duct.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Electrostatic:
            let ind = getArrayIndex(array: electrostatic, index: index)
            if ind >= 0 {
                electrostatic.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Entrydoor:
            let ind = getArrayIndex(array: entrydoor, index: index)
            if ind >= 0 {
                entrydoor.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .ExteriorWall:
            let ind = getArrayIndex(array: exteriorwall, index: index)
            if ind >= 0 {
                exteriorwall.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Fence:
            let ind = getArrayIndex(array: fence, index: index)
            if ind >= 0 {
                fence.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Fireplace:
            let ind = getArrayIndex(array: fireplace, index: index)
            if ind >= 0 {
                fireplace.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Floor:
            let ind = getArrayIndex(array: floor, index: index)
            if ind >= 0 {
                floor.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .FloorDiffuser:
            let ind = getArrayIndex(array: floordiffuser, index: index)
            if ind >= 0 {
                floordiffuser.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Freezer:
            let ind = getArrayIndex(array: freezer, index: index)
            if ind >= 0 {
                freezer.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Furnace:
            let ind = getArrayIndex(array: furnace, index: index)
            if ind >= 0 {
                furnace.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .GarageDoor:
            let ind = getArrayIndex(array: garagedoor, index: index)
            if ind >= 0 {
                garagedoor.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .GarageDoorOpener:
            let ind = getArrayIndex(array: garagedooropener, index: index)
            if ind >= 0 {
                garagedooropener.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Gutter:
            let ind = getArrayIndex(array: gutter, index: index)
            if ind >= 0 {
                gutter.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Heater:
            let ind = getArrayIndex(array: heater, index: index)
            if ind >= 0 {
                heater.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .HouseWindow:
            let ind = getArrayIndex(array: housewindow, index: index)
            if ind >= 0 {
                housewindow.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Humidifier:
            let ind = getArrayIndex(array: humidifier, index: index)
            if ind >= 0 {
                humidifier.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Insulation:
            let ind = getArrayIndex(array: insulation, index: index)
            if ind >= 0 {
                insulation.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .InteriorDoor:
            let ind = getArrayIndex(array: interiordoor, index: index)
            if ind >= 0 {
                interiordoor.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .KitchenCabinet:
            let ind = getArrayIndex(array: kitchencabinet, index: index)
            if ind >= 0 {
                kitchencabinet.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Mower:
            let ind = getArrayIndex(array: mower, index: index)
            if ind >= 0 {
                mower.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Oven:
            let ind = getArrayIndex(array: oven, index: index)
            if ind >= 0 {
                oven.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .PlaySet:
            let ind = getArrayIndex(array: playset, index: index)
            if ind >= 0 {
                playset.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Pond:
            let ind = getArrayIndex(array: pond, index: index)
            if ind >= 0 {
                pond.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Pool:
            let ind = getArrayIndex(array: pool, index: index)
            if ind >= 0 {
                pool.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .RangeHood:
            let ind = getArrayIndex(array: rangehood, index: index)
            if ind >= 0 {
                rangehood.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Refrigerator:
            let ind = getArrayIndex(array: refrigerator, index: index)
            if ind >= 0 {
                refrigerator.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Roof:
            let ind = getArrayIndex(array: roof, index: index)
            if ind >= 0 {
                roof.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Siding:
            let ind = getArrayIndex(array: siding, index: index)
            if ind >= 0 {
                siding.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Stove:
            let ind = getArrayIndex(array: stove, index: index)
            if ind >= 0 {
                stove.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Trimmer:
            let ind = getArrayIndex(array: trimmer, index: index)
            if ind >= 0 {
                trimmer.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Washer:
            let ind = getArrayIndex(array: washer, index: index)
            if ind >= 0 {
                washer.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .WaterHeater:
            let ind = getArrayIndex(array: waterheater, index: index)
            if ind >= 0 {
                waterheater.remove(at: ind)
                indexes.remove(at: repoind)
                isdirty = true
            }
        case .Unknown: break
        }
    }
    
    func get(index: ArticleRepoIndex) -> Article? {
        switch index.type {
        case .Airconditioner: return getArticle(articles: airconiditioner, index: index)
        case .Airfilter: return getArticle(articles: airfilter, index: index)
        case .AirPurifier: return getArticle(articles: airpurifier, index: index)
        case .Alarm: return getArticle(articles: alarm, index: index)
        case .AtticFan: return getArticle(articles: atticfan, index: index)
        case .BBQ: return getArticle(articles: bbq, index: index)
        case .Blower: return getArticle(articles: blower, index: index)
        case .BlowerVac: return getArticle(articles: blowervac, index: index)
        case .Car: return getArticle(articles: car, index: index)
        case .CentralAirconditioner: return getArticle(articles: centralairconditioner, index: index)
        case .CentralVacuum: return getArticle(articles: centralvacuum, index: index)
        case .Chimney: return getArticle(articles: chimney, index: index)
        case .Deck: return getArticle(articles: deck, index: index)
        case .Dehumidifier: return getArticle(articles: dehumidifier, index: index)
        case .DishWasher: return getArticle(articles: dishwasher, index: index)
        case .Doorbell: return getArticle(articles: doorbell, index: index)
        case .Downspout: return getArticle(articles: downspout, index: index)
        case .Driveway: return getArticle(articles: driveway, index: index)
        case .Dryer: return getArticle(articles: dryer, index: index)
        case .Duct: return getArticle(articles: duct, index: index)
        case .Electrostatic: return getArticle(articles: electrostatic, index: index)
        case .Entrydoor: return getArticle(articles: entrydoor, index: index)
        case .ExteriorWall: return getArticle(articles: exteriorwall, index: index)
        case .Fence: return getArticle(articles: fence, index: index)
        case .Fireplace: return getArticle(articles: fireplace, index: index)
        case .Floor: return getArticle(articles: floor, index: index)
        case .FloorDiffuser: return getArticle(articles: floordiffuser, index: index)
        case .Freezer: return getArticle(articles: freezer, index: index)
        case .Furnace: return getArticle(articles: furnace, index: index)
        case .GarageDoor: return getArticle(articles: garagedoor, index: index)
        case .GarageDoorOpener: return getArticle(articles: garagedooropener, index: index)
        case .Gutter: return getArticle(articles: gutter, index: index)
        case .Heater: return getArticle(articles: heater, index: index)
        case .HouseWindow: return getArticle(articles: housewindow, index: index)
        case .Humidifier: return getArticle(articles: humidifier, index: index)
        case .Insulation: return getArticle(articles: insulation, index: index)
        case .InteriorDoor: return getArticle(articles: interiordoor, index: index)
        case .KitchenCabinet: return getArticle(articles: kitchencabinet, index: index)
        case .Mower: return getArticle(articles: mower, index: index)
        case .Oven: return getArticle(articles: oven, index: index)
        case .PlaySet: return getArticle(articles: playset, index: index)
        case .Pond: return getArticle(articles: pond, index: index)
        case .Pool: return getArticle(articles: pool, index: index)
        case .RangeHood: return getArticle(articles: rangehood, index: index)
        case .Refrigerator: return getArticle(articles: refrigerator, index: index)
        case .Roof: return getArticle(articles: roof, index: index)
        case .Siding: return getArticle(articles: siding, index: index)
        case .Stove: return getArticle(articles: stove, index: index)
        case .Trimmer: return getArticle(articles: trimmer, index: index)
        case .Washer: return getArticle(articles: washer, index: index)
        case .WaterHeater: return getArticle(articles: waterheater, index: index)
        case .Unknown: return nil
        }
    }
    
    private func getArrayIndex(array: [Article], index: ArticleRepoIndex) -> Int {
        var ind: Int = 0
        for a in array {
            if a.id == index.id && a.containerid == index.containerid {
                return ind
            }
            ind = ind + 1
        }
        return -1
    }
    
    private func getRepoIndex(index: ArticleRepoIndex) -> Int {
        var ind: Int = 0
        for i in indexes {
            if i.id == index.id {
                return ind
            }
            ind = ind + 1
        }
        return -1
    }
    
    private func getArticle(articles: [Article], index: ArticleRepoIndex) -> Article? {
        
        for a in articles {
            if a.id == index.id && a.containerid == index.containerid {
                return a
            }
        }
        return nil
        
    }

    
}
