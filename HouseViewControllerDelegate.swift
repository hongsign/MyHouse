//
//  HouseViewControllerDelegate.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-27.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

extension HouseViewController: UIHouseViewFocusDelegate {
    func focusIn(view: UIHouseViewBase, superview: UIView) {
        
        if let existingfocusedview = focusedview {
            if existingfocusedview.containerid == view.containerid {
                //view already got focus
                return
            }
        }

        view.foucsIn()
        
        let rect = superview.convert(view.frame, to: self.view)
        
        if view.islabelrequiredfordisplayname {
            //popuplabel.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y - sizeofpopuplabel - paddingofpopuplabel, width: view.frame.size.width, height: sizeofpopuplabel)
            popuplabel.frame = CGRect(x: rect.origin.x, y: rect.origin.y - sizeofpopuplabel - paddingofpopuplabel, width: rect.size.width, height: sizeofpopuplabel)
            popuplabel.text = view.displayname
            popuplabel.font = popuplabel.font.withSize(sizeofpopuplabel)
            self.view.addSubview(popuplabel)
        }
        
        removeViewFromSubview(tag: tagofpopupmenu)
        showPopupMenu(docker: view, superview: superview)
        
        var previousfocused: UIHouseViewBase?
        previousfocused = focusedview
        
        focusedview = view
    
        guard let focused = previousfocused else {
            return
        }
        focused.focusOut()

    }
    
    private func showPopupMenu(docker: UIHouseViewBase, superview: UIView) {
        
        var menuitems: [PopupMenuItemData]!
        var repoindex: HouseRepoIndex!
        var articleindex: ArticleRepoIndex!
        var roomindex: RoomRepoIndex!
        var placeindex: PlaceRepoIndex!
        
        var y: CGFloat = 0
        var listoficons: [String] = [String]()
        var listofmenuitemids: [Int] = [Int]()
        
        switch docker.category {
            case .article:
                articleindex = (id: docker.modelids[0], containerid: docker.containerid, type: ViewModelConverter.instance.getArticleTypeFromHouseViewId(viewid: docker.viewid), ai: ArticleInitData())
                repoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articleindex)
                menuitems = PopupMenuItemDictionary.instance.get(repoindex: repoindex)
            case .place:
                placeindex = (id: (docker as! UIPlace).modelids[0], position: (docker as! UIPlace).position, type: ViewModelConverter.instance.getPlaceTypeFromHouseViewId(viewid: (docker as! UIPlace).viewid))
                repoindex = (repotype: .place, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: placeindex, articlerepoindex: nil)
                menuitems = PopupMenuItemDictionary.instance.get(repoindex: repoindex)
            case .room:
                roomindex = (id: (docker as! UIRoom).modelids[0], position: (docker as! UIRoom).position, type: ViewModelConverter.instance.getRoomTypeFromHouseViewId(viewid: (docker as! UIRoom).viewid))
                repoindex = (repotype: .room, storeyrepoindex: nil, roomrepoindex: roomindex, placerepoindex: nil, articlerepoindex: nil)
                menuitems = PopupMenuItemDictionary.instance.get(repoindex: repoindex)
            default: break
        }
        
        let origin = superview.convert(docker.frame.origin, to: self.view)
        let center = superview.convert(docker.center, to: self.view)
        
        if docker.islabelrequiredfordisplayname {
            //y = docker.frame.origin.y - sizeofpopuplabel - 2 * paddingofpopuplabel - heightofpopupmenu / 2
            y = origin.y - sizeofpopuplabel - 2 * paddingofpopuplabel - heightofpopupmenu / 2
        }
        else {
            //y = docker.frame.origin.y - heightofpopupmenu / 2
            y = origin.y - heightofpopupmenu / 2
        }

        for item in menuitems {
            listoficons.append(item.icon)
            listofmenuitemids.append(item.id)
        }
        let popupmenu = UIPopupMenu(frame: .zero)
        //popupmenu.frame = CGRect(x: docker.center.x - widthofpopupmenu / 2 , y: y, width: widthofpopupmenu, height: heightofpopupmenu)
        popupmenu.frame = CGRect(x: center.x - widthofpopupmenu / 2 , y: y, width: widthofpopupmenu, height: heightofpopupmenu)
        popupmenu.radius = 100
        popupmenu.listoficons = listoficons
        popupmenu.listofmenuitemids = listofmenuitemids
        popupmenu.tag = tagofpopupmenu
        popupmenu.delegate = self
        view.addSubview(popupmenu)

    }
}

extension HouseViewController: UIStoreyCellDelegate {
    func tap(key: UnicodeIcon.UnicodeIconKey) {
        print("tapped:" + UnicodeIcon.getUnicodeIcon(key: key))
    }
}

extension HouseViewController: UIPopupMenuDelegate, UIPopupMenuItemDelegate {
    
    //UIPopupMenuDelegate
    func Tap() {
        self.removeViewFromSubview(tag: tagofpopupmenu)
    }
    
    //UIPopupMenuItemDelegate
    func Tap(itemid: Int) {
        self.actionsOfPopupMenu(itemid: itemid)
    }
    
    internal func removeViewFromSubview(tag: Int) {
        if let viewwithtag = view.viewWithTag(tag) {
            viewwithtag.removeFromSuperview()
        }
    }
    
    internal func actionsOfPopupMenu(itemid: Int) {
        print("delegate called with id: " + String(itemid))
        guard let view = focusedview else {
            return
        }
        
        switch view.viewid {
        case .attic: break
        case .backyard:
            switch itemid {
            case PopupMenuItemId.add.rawValue:
                //TBD
                break
            case PopupMenuItemId.storage.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .balcony:
            switch itemid {
            case PopupMenuItemId.storage.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .bathroom: break
        case .bedroom: break
        case .car:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.maintenance.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .cellar: break
        case .chimney:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .cinema: break
        case .closet: break
        case .deck:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.maintenance.rawValue:
                //TBD
                break
            case PopupMenuItemId.storage.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .den: break
        case .diningroom: break
        case .door:
            if (view as! UIDoor).doortype == .normal { //main entry door
                switch itemid {
                case PopupMenuItemId.setting.rawValue:
                    //TBD
                    break
                case PopupMenuItemId.open.rawValue:
                    enterHouse()
                case PopupMenuItemId.delete.rawValue:
                    deleteHouseView(view: view)
                default: break
                }
            }
            else { //basement door (doortype: .easy)
                switch itemid {
                case PopupMenuItemId.setting.rawValue:
                    //TBD
                    break
                case PopupMenuItemId.delete.rawValue:
                    deleteHouseView(view: view)
                default: break
                }
            }
        case .downspout:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .dressingroom: break
        case .driveway:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.maintenance.rawValue:
                //TBD
                break
            case PopupMenuItemId.storage.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .elevator: break
        case .equipmentroom: break
        case .familyroom: break
        case .fence:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .frontyard:
            switch itemid {
            case PopupMenuItemId.add.rawValue:
                //TBD
                break
            case PopupMenuItemId.storage.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .garage:
            switch itemid {
            case PopupMenuItemId.storage.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .garagedoor:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .gutter:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .hall: break
        case .hallway: break
        case .house: break
        case .insulation: break
        case .kitchen: break
        case .laundry: break
        case .livingroom: break
        case .lounge: break
        case .office: break
        case .pantry: break
        case .patio:
            switch itemid {
            case PopupMenuItemId.storage.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .place: break
        case .pool:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.maintenance.rawValue:
                //TBD
                break
            case PopupMenuItemId.storage.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .porch: break
        case .recreationroom: break
        case .room: break
        case .roof:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .shutter: break
        case .siding:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .stair: break
        case .study: break
        case .sunroom: break
        case .utilityroom: break
        case .wall:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .window:
            switch itemid {
            case PopupMenuItemId.setting.rawValue:
                //TBD
                break
            case PopupMenuItemId.delete.rawValue:
                deleteHouseView(view: view)
            default: break
            }
        case .workshop: break
        }
    }
    
    private func deleteHouseView(view: UIHouseViewBase) {
        guard let repotype = ViewModelConverter.instance.getRepoTypeFromHouseViewId(viewid: view.viewid) else {
            return
        }
        
        let repo = MyHouse.instance()?.repo
        
        var houserepoindex: HouseRepoIndex!
        var articlerepoindex: ArticleRepoIndex!
        var placerepoindex: PlaceRepoIndex!
        var roomrepoindex: RoomRepoIndex!
        
        let ai = ArticleInitData()
        
        switch repotype {
        case .article:
            for id in view.modelids {
                articlerepoindex = (id: id, containerid: view.containerid, type: ViewModelConverter.instance.getArticleTypeFromHouseViewId(viewid: view.viewid), ai: ai)
                houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                repo?.remove(index: houserepoindex)
            }
            removeViewFromSubview(tag: view.containerid)
        case .place:
            for id in view.modelids {
                placerepoindex = (id: id, position: (0,0,0), type: ViewModelConverter.instance.getPlaceTypeFromHouseViewId(viewid: view.viewid))
                houserepoindex = (repotype: .place, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: placerepoindex, articlerepoindex: nil)
                repo?.remove(index: houserepoindex)
            }
            removeViewFromSubview(tag: view.containerid)
        case .room:
            for id in view.modelids {
                roomrepoindex = (id: id, position: (0,0), type: ViewModelConverter.instance.getRoomTypeFromHouseViewId(viewid: view.viewid))
                houserepoindex = (repotype: .room, storeyrepoindex: nil, roomrepoindex: roomrepoindex, placerepoindex: nil, articlerepoindex: nil)
                repo?.remove(index: houserepoindex)
            }
            removeViewFromSubview(tag: view.containerid)
        default: break
        }
    }
    
    private func enterHouse() {
        //from popupmenu - main door open
        house.houseviewtype = .interior
    }
}
