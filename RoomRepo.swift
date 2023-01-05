//
//  RoomRepo.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-03.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

typealias RoomRepoIndex = (
    id: Int,
    position: RoomPosition,
    type: RoomType
)

class RoomRepo: RepoBase {
    
    override init() {
        super.init()
        
        indexes = [RoomRepoIndex]()
        
        attic = [Attic]()
        bathroom = [Bathroom]()
        bedroom = [Bedroom]()
        cinema = [Cinema]()
        den = [Den]()
        diningroom = [Diningroom]()
        dressingroom = [Dressingroom]()
        equipmentroom = [Equipmentroom]()
        familyroom = [Familyroom]()
        hall = [Hall]()
        hallway = [Hallway]()
        kitchen = [Kitchen]()
        laundry = [Laundry]()
        livingroom = [Livingroom]()
        lounge = [Lounge]()
        office = [Office]()
        pantry = [Pantry]()
        recreationroom = [Recreationroom]()
        study = [Study]()
        sunroom = [Sunroom]()
        utilityroom = [Utilityroom]()
        workshop = [Workshop]()
        
        repotype = .room
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        
        super.mapping(map: map)
        
        attic <- map["attic"]
        bathroom <- map["bathroom"]
        bedroom <- map["bedroom"]
        cinema <- map["cinema"]
        den <- map["den"]
        diningroom <- map["diningroom"]
        dressingroom <- map["dressingroom"]
        equipmentroom <- map["equipmentroom"]
        familyroom <- map["familyroom"]
        hall <- map["hall"]
        hallway <- map["hallway"]
        kitchen <- map["kitchen"]
        laundry <- map["laundry"]
        livingroom <- map["livingroom"]
        lounge <- map["lounge"]
        office <- map["office"]
        pantry <- map["pantry"]
        recreationroom <- map["recreationroom"]
        study <- map["study"]
        sunroom <- map["sunroom"]
        utilityroom <- map["utilityroom"]
        workshop <- map["workshop"]
        
        indexes <- map["indexes"]
    }
    
    var indexes: [RoomRepoIndex]!
    
    var attic: [Attic]!
    var bathroom: [Bathroom]!
    var bedroom: [Bedroom]!
    var cinema: [Cinema]!
    var den: [Den]!
    var diningroom: [Diningroom]!
    var dressingroom: [Dressingroom]!
    var equipmentroom: [Equipmentroom]!
    var familyroom: [Familyroom]!
    var hall: [Hall]!
    var hallway: [Hallway]!
    var kitchen: [Kitchen]!
    var laundry: [Laundry]!
    var livingroom: [Livingroom]!
    var lounge: [Lounge]!
    var office: [Office]!
    var pantry: [Pantry]!
    var recreationroom: [Recreationroom]!
    var study: [Study]!
    var sunroom: [Sunroom]!
    var utilityroom: [Utilityroom]!
    var workshop: [Workshop]!
    
    /*---------------------------------------------------------
     id: unique id when create UI object
     type: room type
     position: position of room in storey
    -----------------------------------------------------------*/
    func add(index: RoomRepoIndex) {
        switch index.type {
        case .Attic:
            let room = Attic()
            room.id = index.id
            room.roomposition = index.position
            attic.append(room)
        case .Bathroom:
            let room = Bathroom()
            room.id = index.id
            room.roomposition = index.position
            bathroom.append(room)
        case .Bedroom:
            let room = Bedroom()
            room.id = index.id
            room.roomposition = index.position
            bedroom.append(room)
        case .Cinema:
            let room = Cinema()
            room.id = index.id
            room.roomposition = index.position
            cinema.append(room)
        case .Den:
            let room = Den()
            room.id = index.id
            room.roomposition = index.position
            den.append(room)
        case .Dressingroom:
            let room = Dressingroom()
            room.id = index.id
            room.roomposition = index.position
            dressingroom.append(room)
        case .Diningroom:
            let room = Diningroom()
            room.id = index.id
            room.roomposition = index.position
            diningroom.append(room)
        case .Equipmentroom:
            let room = Equipmentroom()
            room.id = index.id
            room.roomposition = index.position
            equipmentroom.append(room)
        case .Familyroom:
            let room = Familyroom()
            room.id = index.id
            room.roomposition = index.position
            familyroom.append(room)
        case .Hall:
            let room = Hall()
            room.id = index.id
            room.roomposition = index.position
            hall.append(room)
        case .Hallway:
            let room = Hallway()
            room.id = index.id
            room.roomposition = index.position
            hallway.append(room)
        case .Kitchen:
            let room = Kitchen()
            room.id = index.id
            room.roomposition = index.position
            kitchen.append(room)
        case .Laundry:
            let room = Laundry()
            room.id = index.id
            room.roomposition = index.position
            laundry.append(room)
        case .Livingroom:
            let room = Livingroom()
            room.id = index.id
            room.roomposition = index.position
            livingroom.append(room)
        case .Lounge:
            let room = Lounge()
            room.id = index.id
            room.roomposition = index.position
            lounge.append(room)
        case .Office:
            let room = Office()
            room.id = index.id
            room.roomposition = index.position
            office.append(room)
        case .Pantry:
            let room = Pantry()
            room.id = index.id
            room.roomposition = index.position
            pantry.append(room)
        case .Recreationroom:
            let room = Recreationroom()
            room.id = index.id
            room.roomposition = index.position
            recreationroom.append(room)
        case .Study:
            let room = Study()
            room.id = index.id
            room.roomposition = index.position
            study.append(room)
        case .Sunroom:
            let room = Sunroom()
            room.id = index.id
            room.roomposition = index.position
            sunroom.append(room)
        case .Utilityroom:
            let room = Utilityroom()
            room.id = index.id
            room.roomposition = index.position
            utilityroom.append(room)
        case .Workshop:
            let room = Workshop()
            room.id = index.id
            room.roomposition = index.position
            workshop.append(room)
        case .Unknown: break
        }
        
        indexes.append(index)
        
        isdirty = true
    }
    
    func remove(index: RoomRepoIndex) {
        
        let repoindex = getRepoIndex(index: index)
        
        switch index.type {
        case .Attic:
            let ind = getArrayIndex(roomarray: attic, index: index)
            if ind >= 0 {
                attic.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Bathroom:
            let ind = getArrayIndex(roomarray: bathroom, index: index)
            if ind >= 0 {
                bathroom.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Bedroom:
            let ind = getArrayIndex(roomarray: bedroom, index: index)
            if ind >= 0 {
                bedroom.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Cinema:
            let ind = getArrayIndex(roomarray: cinema, index: index)
            if ind >= 0 {
                cinema.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Den:
            let ind = getArrayIndex(roomarray: den, index: index)
            if ind >= 0 {
                den.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Dressingroom:
            let ind = getArrayIndex(roomarray: dressingroom, index: index)
            if ind >= 0 {
                dressingroom.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Diningroom:
            let ind = getArrayIndex(roomarray: diningroom, index: index)
            if ind >= 0 {
                diningroom.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Equipmentroom:
            let ind = getArrayIndex(roomarray: equipmentroom, index: index)
            if ind >= 0 {
                equipmentroom.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Familyroom:
            let ind = getArrayIndex(roomarray: familyroom, index: index)
            if ind >= 0 {
                familyroom.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Hall:
            let ind = getArrayIndex(roomarray: hall, index: index)
            if ind >= 0 {
                hall.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Hallway:
            let ind = getArrayIndex(roomarray: hallway, index: index)
            if ind >= 0 {
                hallway.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Kitchen:
            let ind = getArrayIndex(roomarray: kitchen, index: index)
            if ind >= 0 {
                kitchen.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Laundry:
            let ind = getArrayIndex(roomarray: laundry, index: index)
            if ind >= 0 {
                laundry.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Livingroom:
            let ind = getArrayIndex(roomarray: livingroom, index: index)
            if ind >= 0 {
                livingroom.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Lounge:
            let ind = getArrayIndex(roomarray: lounge, index: index)
            if ind >= 0 {
                lounge.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Office:
            let ind = getArrayIndex(roomarray: office, index: index)
            if ind >= 0 {
                office.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Pantry:
            let ind = getArrayIndex(roomarray: pantry, index: index)
            if ind >= 0 {
                pantry.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Recreationroom:
            let ind = getArrayIndex(roomarray: recreationroom, index: index)
            if ind >= 0 {
                recreationroom.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Study:
            let ind = getArrayIndex(roomarray: study, index: index)
            if ind >= 0 {
                study.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Sunroom:
            let ind = getArrayIndex(roomarray: sunroom, index: index)
            if ind >= 0 {
                sunroom.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Utilityroom:
            let ind = getArrayIndex(roomarray: utilityroom, index: index)
            if ind >= 0 {
                utilityroom.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Workshop:
            let ind = getArrayIndex(roomarray: workshop, index: index)
            if ind >= 0 {
                workshop.remove(at: ind)
                indexes.remove(at: repoindex)
                isdirty = true
            }
        case .Unknown: break
        }
    }
    
    func get(index: RoomRepoIndex) -> Room? {
        
        switch index.type {
        case .Attic:
            return getRoom(rooms: attic, index: index)
        case .Bathroom:
            return getRoom(rooms: bathroom, index: index)
        case .Bedroom:
            return getRoom(rooms: bedroom, index: index)
        case .Cinema:
            return getRoom(rooms: cinema, index: index)
        case .Den:
            return getRoom(rooms: den, index: index)
        case .Dressingroom:
            return getRoom(rooms: dressingroom, index: index)
        case .Diningroom:
            return getRoom(rooms: diningroom, index: index)
        case .Equipmentroom:
            return getRoom(rooms: equipmentroom, index: index)
        case .Familyroom:
            return getRoom(rooms: familyroom, index: index)
        case .Hall:
            return getRoom(rooms: hall, index: index)
        case .Hallway:
            return getRoom(rooms: hallway, index: index)
        case .Kitchen:
            return getRoom(rooms: kitchen, index: index)
        case .Laundry:
            return getRoom(rooms: laundry, index: index)
        case .Livingroom:
            return getRoom(rooms: livingroom, index: index)
        case .Lounge:
            return getRoom(rooms: lounge, index: index)
        case .Office:
            return getRoom(rooms: office, index: index)
        case .Pantry:
            return getRoom(rooms: pantry, index: index)
        case .Recreationroom:
            return getRoom(rooms: recreationroom, index: index)
        case .Study:
            return getRoom(rooms: study, index: index)
        case .Sunroom:
            return getRoom(rooms: sunroom, index: index)
        case .Utilityroom:
            return getRoom(rooms: utilityroom, index: index)
        case .Workshop:
            return getRoom(rooms: workshop, index: index)
        case .Unknown:
            return nil
        }
        
    }
    
    private func getArrayIndex(roomarray: [Room], index: RoomRepoIndex) -> Int {
        var ind: Int = 0
        for r in roomarray {
            if r.id == index.id {
                return ind
            }
            ind = ind + 1
        }
        return -1
    }
    
    private func getRepoIndex(index: RoomRepoIndex) -> Int {
        var ind: Int = 0
        for i in indexes {
            if i.id == index.id {
                return ind
            }
            ind = ind + 1
        }
        return -1
    }
    
    private func getRoom(rooms: [Room], index: RoomRepoIndex) -> Room? {
        for r in rooms {
            if r.id == index.id {
                return r
            }
        }
        return nil
    }
    
}
