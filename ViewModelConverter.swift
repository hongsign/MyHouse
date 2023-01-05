//
//  ViewModelConverter.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-08.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation

class ViewModelConverter {
    
    static let instance = ViewModelConverter()
    
    private init() {
        
    }
    
    func getRepoTypeFromHouseViewId(viewid: UIHouseViewId) -> HouseRepoType? {
        let articletype = getArticleTypeFromHouseViewId(viewid: viewid)
        if articletype != .Unknown {
            return .article
        }
        
        let roomtype = getRoomTypeFromHouseViewId(viewid: viewid)
        if roomtype != .Unknown {
            return .room
        }
        
        let placetype = getPlaceTypeFromHouseViewId(viewid: viewid)
        if placetype != .Unknown {
            return .place
        }
        
        return nil
    }
    
    func getArticleTypeFromHouseViewId(viewid: UIHouseViewId) -> ArticleType {
        
        switch viewid {
        case .gutter: return .Gutter
        case .downspout: return .Downspout
        case .chimney: return .Chimney
        case .window: return .HouseWindow
        case .door: return .Entrydoor
        case .fence: return .Fence
        case .car: return .Car
        case .garagedoor: return .GarageDoor
        //case .shutter:
        case .roof: return .Roof
        case .siding: return .Siding
        case .wall: return .ExteriorWall
        case .insulation: return .Insulation
        default: return .Unknown
        }
    }
        
    func getRoomTypeFromHouseViewId(viewid: UIHouseViewId) -> RoomType {
        
        switch viewid {
        //case .room
        case .bedroom: return .Bedroom
        case .bathroom: return .Bathroom
        case .attic: return .Attic
        case .cinema: return .Cinema
        case .den: return .Den
        case .laundry: return .Laundry
        case .kitchen: return .Kitchen
        case .familyroom: return .Familyroom
        case .equipmentroom: return .Equipmentroom
        case .sunroom: return .Sunroom
        case .hall: return .Hall
        case .study: return .Study
        case .diningroom: return .Diningroom
        case .pantry: return .Pantry
        case .office: return .Office
        case .hallway: return .Hallway
        case .recreationroom: return .Recreationroom
        case .workshop: return .Workshop
        case .utilityroom: return .Utilityroom
        case .lounge: return .Lounge
        case .livingroom: return .Livingroom
        case .dressingroom: return .Dressingroom
        default: return .Unknown
        }
    }
    
    func getPlaceTypeFromHouseViewId(viewid: UIHouseViewId) -> PlaceType {
        
        switch viewid {
        //case .place
        case .deck: return .Deck
        case .backyard: return .Backyard
        case .frontyard: return .Frontyard
        case .driveway: return .Driveway
        case .garage: return .Garage
        case .closet: return .Closet
        case .elevator: return .Elevator
        case .patio: return .Patio
        case .stair: return .Stair
        case .cellar: return .Cellar
        case .pool: return .Pool
        case .porch: return .Porch
        case .balcony: return .Balcony
        default: return .Unknown
        }
    }
    
    func getUIFenceTypeFromModel(type: FenceType) -> UIFenceType {
        switch type {
        case .Aluminum:
            return .iron
        case .Bamboo:
            return .wood
        case .ChainLink:
            return .wood
        case .Electric:
            return .wood
        case .Picket:
            return .wood
        case .Vinyl:
            return .wood
        case .Wood:
            return .wood
        case .WroughtIron:
            return .iron
        }
    }
    
}
