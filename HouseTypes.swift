//
//  HouseTypes.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-01.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation

enum HouseArcType: String {
    case backsplit
    case frontsplit
    case sidesplit
    case doublesidesplit
    case bangalore
    case storey
}

enum ArticleType: String {
    
    case Unknown
    
    //articles belong to House
    case Roof, Insulation, Entrydoor, Gutter, Downspout, Chimney, Fireplace, Duct, Siding, CentralVacuum, CentralAirconditioner, KitchenCabinet
    //articles belong to Room
    case Floor, InteriorDoor, HouseWindow, FloorDiffuser
    //articles belong to Garage
    case GarageDoor, GarageDoorOpener
    //articles belong to yards
    case Fence, PlaySet, Pond, BBQ, Blower, BlowerVac, Mower, Trimmer
    //articles to be selected
    case Airfilter, Electrostatic
    //Applicance below
    case Alarm //security, smoke, monoxide
    case Airconditioner //Portableairconditioner, Windowairconditioner, Split
    case AtticFan, Dryer, DishWasher, WaterHeater, Humidifier
    case Dehumidifier, Refrigerator, Furnace, Doorbell, Stove, Washer, RangeHood, AirPurifier
    case Freezer
    case Heater
    case Oven
    
    case ExteriorWall
    case Car
    
    case Deck, Driveway, Pool
    
    static let strings = [
        Roof.rawValue,Insulation.rawValue,Entrydoor.rawValue,Gutter.rawValue,Downspout.rawValue,Chimney.rawValue,
        Fireplace.rawValue,Duct.rawValue,Siding.rawValue,CentralVacuum.rawValue,CentralAirconditioner.rawValue,
        KitchenCabinet.rawValue,Floor.rawValue,InteriorDoor.rawValue,HouseWindow.rawValue,FloorDiffuser.rawValue,
        GarageDoor.rawValue,GarageDoorOpener.rawValue,Fence.rawValue,PlaySet.rawValue,Pond.rawValue,BBQ.rawValue,
        Blower.rawValue,BlowerVac.rawValue,Mower.rawValue,Trimmer.rawValue,Airfilter.rawValue,Electrostatic.rawValue,
        Alarm.rawValue,Airconditioner.rawValue,AtticFan.rawValue,Dryer.rawValue,DishWasher.rawValue,WaterHeater.rawValue,
        Humidifier.rawValue,Dehumidifier.rawValue,Refrigerator.rawValue,Furnace.rawValue,Doorbell.rawValue,
        Stove.rawValue,Washer.rawValue,RangeHood.rawValue,AirPurifier.rawValue,Freezer.rawValue,Heater.rawValue,Oven.rawValue,
        Car.rawValue, ExteriorWall.rawValue, Deck.rawValue, Driveway.rawValue, Pool.rawValue
    ]
}

enum PowerType: String {
    case Electric
    case Battery
    case Gas
    case Propane
    case Oil
    case Coal
    case Charcoal
    case Wood
    case Kerosene
    case Manual
    
    static let strings = [Electric.rawValue,Battery.rawValue,Gas.rawValue,Propane.rawValue,Oil.rawValue,
                          Coal.rawValue,Charcoal.rawValue,Wood.rawValue,Kerosene.rawValue,Manual.rawValue]
}

enum RoomType: String {
    
    case Unknown
    
    case Attic
    case Bathroom
    case Bedroom
    case Cinema
    //case Closet
    case Den
    case Diningroom
    case Dressingroom
    case Equipmentroom
    case Familyroom
    case Hall
    case Hallway
    case Kitchen
    case Laundry
    case Livingroom
    case Lounge
    case Office
    case Pantry
    case Recreationroom
    //case Toilet
    case Study
    case Sunroom
    case Utilityroom
    //case Walkincloset
    case Workshop
}

enum PlaceType: String {
    
    case Unknown
    
    case Backyard
    case Balcony
    case Cellar
    case Closet
    case Deck
    case Driveway
    case Elevator
    case Frontyard
    case Garage
    case Patio
    case Pool
    case Porch
    case Stair
}

enum AlertType: String {
    case Warning
    case Alarm
    
    static let strings = [Warning.rawValue,Alarm.rawValue]
}

enum AlertTypeOfArticle: String {
    case Lifespan
    case Maintenance
    
    static let strings = [Lifespan.rawValue,Maintenance.rawValue]
}

enum AlertStatus: String {
    case New
    case InProgress
    case Acknowledged
    case Closed
    
    static let strings = [New.rawValue,InProgress.rawValue,Acknowledged.rawValue,Closed.rawValue]
}

class HouseTypes {
    
}
