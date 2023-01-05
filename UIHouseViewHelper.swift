//
//  UIHouseViewHelper.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-22.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIHouseViewHelper {
    
    class func getHouseViewInstance(viewid: UIHouseViewId, rect: CGRect, delegate: UIHouseViewFocusDelegate) -> UIHouseViewBase {
        switch viewid {
        case .gutter: return UIGutter(frame: rect, delegate: delegate)
        case .downspout: return UIDownspout(frame: rect, delegate: delegate)
        case .chimney: return UIChimney(frame: rect, delegate: delegate)
        case .window: return UIHouseWindow(frame: rect, delegate: delegate)
        case .door: return UIDoor(frame: rect, delegate: delegate)
        case .fence: return UIFence(frame: rect, delegate: delegate)
        case .car: return UICar(frame: rect, delegate: delegate)
        case .garagedoor: return UIGaragedoor(frame: rect, delegate: delegate)
        case .shutter: return UIShutter(frame: rect, delegate: delegate)
        case .roof: return UIRoof(frame: rect, delegate: delegate)
        case .siding: return UISiding(frame: rect, delegate: delegate)
        case .wall: return UIWall(frame: rect, delegate: delegate)
        case .insulation: return UIInsulation(frame: rect, delegate: delegate)
            
        case .room: return UIRoom(frame: rect, delegate: delegate)
        case .bedroom: return UIBedroom(frame: rect, delegate: delegate)
        case .bathroom: return UIBathroom(frame: rect, delegate: delegate)
        case .attic: return UIAttic(frame: rect, delegate: delegate)
        case .cinema: return UICinema(frame: rect, delegate: delegate)
        case .den: return UIDen(frame: rect, delegate: delegate)
        case .laundry: return UILaundry(frame: rect, delegate: delegate)
        case .kitchen: return UIKitchen(frame: rect, delegate: delegate)
        case .familyroom: return UIFamilyroom(frame: rect, delegate: delegate)
        case .equipmentroom: return UIEquipmentroom(frame: rect, delegate: delegate)
        case .sunroom: return UISunroom(frame: rect, delegate: delegate)
        case .hall: return UIHall(frame: rect, delegate: delegate)
        case .study: return UIStudy(frame: rect, delegate: delegate)
        case .diningroom: return UIDiningroom(frame: rect, delegate: delegate)
        case .pantry: return UIPantry(frame: rect, delegate: delegate)
        case .office: return UIOffice(frame: rect, delegate: delegate)
        case .hallway: return UIHallway(frame: rect, delegate: delegate)
        case .recreationroom: return UIRecreationroom(frame: rect, delegate: delegate)
        case .workshop: return UIWorkshop(frame: rect, delegate: delegate)
        case .utilityroom: return UIUtilityroom(frame: rect, delegate: delegate)
        case .lounge: return UILounge(frame: rect, delegate: delegate)
        case .livingroom: return UILivingroom(frame: rect, delegate: delegate)
        case .dressingroom: return UIDressingroom(frame: rect, delegate: delegate)
            
        case .place: return UIPlace(frame: rect, delegate: delegate)
        case .deck: return UIDeck(frame: rect, delegate: delegate)
        case .backyard: return UIBackyard(frame: rect, delegate: delegate)
        case .frontyard: return UIFrontyard(frame: rect, delegate: delegate)
        case .driveway: return UIDriveway(frame: rect, delegate: delegate)
        case .garage: return UIGarage(frame: rect, delegate: delegate)
        case .closet: return UICloset(frame: rect, delegate: delegate)
        case .elevator: return UIElevator(frame: rect, delegate: delegate)
        case .patio: return UIPatio(frame: rect, delegate: delegate)
        case .stair: return UIStair(frame: rect, delegate: delegate)
        case .cellar: return UICellar(frame: rect, delegate: delegate)
        case .pool: return UIPool(frame: rect, delegate: delegate)
        case .porch: return UIPorch(frame: rect, delegate: delegate)
        case .balcony: return UIBalcony(frame: rect, delegate: delegate)
            
        //case .house: return UIHouse(frame: rect, sizeinfo: UIHouseSizeInfo(0,0,0,0,0,true,true,0,0), delegate: delegate, celldelegate: nil)
        default:
            return UIHouseViewBase(frame: rect, delegate: delegate)
        }
    }
    
}
