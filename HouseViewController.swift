//
//  HouseViewController.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-27.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class HouseViewController: UIViewController {
    
    /*---------------------------------------
     topbar UIViews
     -----------------------------------------*/
    private var topbarheight: CGFloat = 30
    
    var profileicon: UIUnicodeIcon!
    var articleicon: UIUnicodeIcon!
    var alarmicon: UIAlarmIcon!
    
    /*---------------------------------------
     popupMenu and focus management UIViews
     with definitions
     -----------------------------------------*/
    internal let tagofpopupmenu: Int = 1000000
    internal let tagofpopuplabel: Int = 1000001
    
    internal let sizeofpopuplabel: CGFloat = 10  //in pixels
    internal let paddingofpopuplabel: CGFloat = 3 //in pixels
    internal let textcolorofpopuplabel: UIColor = .black
    
    internal let widthofpopupmenu: CGFloat = 100 //in pixels
    internal let heightofpopupmenu: CGFloat = 100 //in pixels
    
    internal let popupmenuitemid_delete: Int = 1
    internal let popupmenuitemid_add: Int = 2
    
    //internal var popupmenu: UIPopupMenu!
    internal var popuplabel: UILabel!
    internal var focusedview: UIHouseViewBase?
    
    /*---------------------------------------
     backyard UIViews
    -----------------------------------------*/
    private var backyard: UIBackyard!
    private var backyardfence: UIFence!
    private var pool: UIPool!
    private var patio: UIPatio!
    private var deck: UIDeck!
    
    /*---------------------------------------
     frontyard UIViews
     -----------------------------------------*/
    private var frontyard: UIFrontyard!
    private var frontyardfence: UIFence!
    private var garage: UIGarage!
    private var garagedoor: UIGaragedoor!
    private var car: UICar!
    private var driveway: UIDriveway!
    
    /*---------------------------------------
     house UIViews
     -----------------------------------------*/
    internal var house: UIHouse!
    private var chimney: UIChimney!
    private var gutter: UIGutter!
    private var downspout: UIDownspout!
    
    /*---------------------------------------
     position and size statics
     -----------------------------------------*/
    private let positionoflandline: CGFloat = 25
    private let sizeofbackyardwidth: CGFloat = 25
    private let sizeoffrontyardwidth: CGFloat = 25
    private let sizeofhousewidth: CGFloat = 50
    private let sizeofhouseheight: CGFloat = 80
    private let sizeofhouseheightofhousewidth: CGFloat = 100
    
    private let sizeofroofheightofhouseheightabovelandline: CGFloat = 20
    private let sizeofroofextendofhousewidth: CGFloat = 12
    private let sizeofbasementwidthofhousewidth: CGFloat = 100
    private let sizeofbasementheightofhouseheight: CGFloat = 20
    
    private let sizeofdeckwidthofbackyardwidth: CGFloat = 30
    private let sizeofdeckheightofhouseheight: CGFloat = 10
    
    private let sizeoffencewidthofbackyardwidth: CGFloat = 60
    private let sizeoffenceheightofhouseheight: CGFloat = 15
    
    private let sizeofbackyardwidthofbackyardwidth: CGFloat = 60
    private let sizeofbackyardheightofhouseheight: CGFloat = 30
    
    private let sizeofgaragewidthoffrontyardwidth: CGFloat = 50
    private let sizeofgarageheightofhouseheight: CGFloat = 50
    
    private let sizeofdrivewaywidthoffrontyardwidth: CGFloat = 35
    private let sizeofdrivewayheightofgarageheight: CGFloat = 12.5
    
    private let sizeoffrontfencewidthoffrontyardwidth: CGFloat = 15
    private let sizeoffrontfenceheightofhouseheight: CGFloat = 8
    
    private let sizeoffrontyardwidthoffrontyardwidth: CGFloat = 40
    private let sizeoffrontyardheightofhouseheight: CGFloat = 30
    
    private let sizeofdownspoutwidthofhousewidth: CGFloat = 8
    //private let sizeofdownspoutheightofhouseheight: CGFloat ---- should be same with house storeys height
    
    private let sizeofgutterwidthofroofextend: CGFloat = 50
    private let sizeofgutterheightofroofheight: CGFloat = 10
    
    private let sizeofchimneywidthofchimneyheight: CGFloat = 100
    private let sizeofchimneyheightofroofheight: CGFloat = 100
    
    private let sizeofinsulationheightofroofheight: CGFloat = 8
    
    /*---------------------------------------
     position and size variables
     -----------------------------------------*/
    private var screenrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    
    private var landline: CGFloat = 0
    private var househeightabovelandline: CGFloat = 0
    private var backyardwidth: CGFloat = 0
    private var frontyardwidth: CGFloat = 0
    
    private var housesizeinfo: UIHouseSizeInfo = (landline: 0, housewidth: 0, househeight: 0, roofheight: 0, roofextend: 0, hasbasement: true, isbasementwalkout: true, basementwidth: 0, basementheight: 0, hasbalcony: true, hassiding: true, hasinsulation: true, insulationheight: 0, hasattic: true)
    
    private var houserect: UIRect =  (x: 0, y: 0, w: 0, h: 0)
    private var gutterrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    private var chimneyrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    private var downspoutrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    
    private var backfencerect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    private var deckrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    private var backyardrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    //from backyard innerrect
    private var patiorect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    //from backyard innerrect
    private var poolrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    
    private var garagerect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    //from garage innerrect
    private var garagedoorrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    //from garage carrect
    private var carrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    private var drivewayrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    private var frontfencerect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    private var frontyardrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    
    /*---------------------------------------
     model: repo indexes
     -----------------------------------------*/
    //var houserepoindex: HouseRepoIndex = (repotype: .storey, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: nil)
    
    /*---------------------------------------
     init
     -----------------------------------------*/
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreenRect()
        setupLandline()
        setupHouseSizeInfo()
        setupHouseViewRects()
        setupTopbarViews()
        setupHouseViews()
        setupPopupMenu()
    }
    
    private func setupScreenRect() {
        screenrect.x = UIDefinitions.paddingleft
        screenrect.y = UIDefinitions.paddingtop
        screenrect.w = UIDefinitions.screenwidth - UIDefinitions.paddingleft - UIDefinitions.paddingright
        screenrect.h = UIDefinitions.screenheight - UIDefinitions.paddingtop - UIDefinitions.paddingbottom
    }
    
    private func setupLandline() {
        landline = screenrect.y + screenrect.h - positionoflandline * screenrect.h / 100
    }
    
    private func setupHouseSizeInfo() {
        housesizeinfo.housewidth = screenrect.w * sizeofhousewidth / 100
        housesizeinfo.househeight = housesizeinfo.housewidth * sizeofhouseheightofhousewidth / 100 //screenrect.h * sizeofhouseheight / 100
        housesizeinfo.roofextend = housesizeinfo.housewidth * sizeofroofextendofhousewidth / 100
        housesizeinfo.basementheight = housesizeinfo.househeight * sizeofbasementheightofhouseheight / 100
        
        househeightabovelandline = housesizeinfo.househeight - housesizeinfo.basementheight
        
        housesizeinfo.roofheight = househeightabovelandline * sizeofroofheightofhouseheightabovelandline / 100
        housesizeinfo.basementwidth = housesizeinfo.housewidth - 2 * housesizeinfo.roofextend
        housesizeinfo.insulationheight = housesizeinfo.roofheight * sizeofinsulationheightofroofheight / 100
        
        housesizeinfo.landline = landline - (landline - househeightabovelandline)
        
        //read from datamodel
        
        guard let model = MyHouse.instance() else {
            housesizeinfo.hasattic = true
            housesizeinfo.hassiding = true
            housesizeinfo.hasbalcony = true
            housesizeinfo.hasbasement = true
            housesizeinfo.hasinsulation = true
            housesizeinfo.isbasementwalkout = true
            return
        }
        
        housesizeinfo.hasattic = model.hasattic
        housesizeinfo.hassiding = model.hassiding
        housesizeinfo.hasbalcony = model.hasbalcony
        housesizeinfo.hasbasement = model.hasbasement
        housesizeinfo.hasinsulation = model.hasinsulation
        housesizeinfo.isbasementwalkout = model.isbasementwalkout
    }
    
    private func setupHouseViewRects() {
        
        frontyardwidth = screenrect.w * sizeoffrontyardwidth / 100 + housesizeinfo.roofextend
        backyardwidth = screenrect.w * sizeofbackyardwidth / 100
        
        houserect.x = screenrect.x + backyardwidth
        houserect.y = landline - househeightabovelandline
        houserect.w = housesizeinfo.housewidth
        houserect.h = housesizeinfo.househeight
        
        gutterrect.x = houserect.x - housesizeinfo.roofextend * sizeofgutterwidthofroofextend / 100
        gutterrect.y = houserect.y + housesizeinfo.roofheight - housesizeinfo.roofheight * sizeofgutterheightofroofheight  / 100
        gutterrect.w = housesizeinfo.roofextend * sizeofgutterwidthofroofextend / 100
        gutterrect.h = housesizeinfo.roofheight * sizeofgutterheightofroofheight  / 100
        
        chimneyrect.x = houserect.x + houserect.w / 4
        chimneyrect.h = housesizeinfo.roofheight * sizeofchimneyheightofroofheight / 100
        chimneyrect.w = chimneyrect.h * sizeofchimneywidthofchimneyheight  / 100
        chimneyrect.y = houserect.y - 3 * chimneyrect.h / 4
        
        downspoutrect.x = houserect.x + housesizeinfo.roofextend - houserect.w * sizeofdownspoutwidthofhousewidth / 100
        downspoutrect.y = houserect.y + housesizeinfo.roofheight
        downspoutrect.w = housesizeinfo.housewidth * sizeofdownspoutwidthofhousewidth / 100
        downspoutrect.h = househeightabovelandline - housesizeinfo.roofheight
        
        backfencerect.x = screenrect.x + UIDefinitions.houseviewpadding
        backfencerect.y = landline - houserect.h * sizeoffenceheightofhouseheight / 100
        backfencerect.w = backyardwidth * sizeoffencewidthofbackyardwidth / 100
        backfencerect.h = houserect.h * sizeoffenceheightofhouseheight / 100
        
        deckrect.x = screenrect.x + 2 * UIDefinitions.houseviewpadding + backfencerect.w
        deckrect.y = landline - houserect.h * sizeofdeckheightofhouseheight / 100
        deckrect.w = backyardwidth * sizeofdeckwidthofbackyardwidth / 100
        deckrect.h = houserect.h * sizeofdeckheightofhouseheight / 100
        
        backyardrect.x = screenrect.x + UIDefinitions.houseviewpadding
        backyardrect.y = landline - backfencerect.h - UIDefinitions.houseviewpadding - houserect.h * sizeofbackyardheightofhouseheight / 100
        backyardrect.w = backyardwidth * sizeofbackyardwidthofbackyardwidth / 100
        backyardrect.h = houserect.h * sizeofbackyardheightofhouseheight / 100
        
        garagerect.x = houserect.x + houserect.w - housesizeinfo.roofextend + UIDefinitions.houseviewpadding
        garagerect.w = frontyardwidth * sizeofgaragewidthoffrontyardwidth / 100
        garagerect.h = househeightabovelandline * sizeofgarageheightofhouseheight / 100 //houserect.h * sizeofgarageheightofhouseheight / 100
        garagerect.y = landline - garagerect.h
        
        frontfencerect.w = frontyardwidth * sizeoffrontfencewidthoffrontyardwidth / 100
        frontfencerect.h = houserect.h * sizeoffrontfenceheightofhouseheight / 100
        //frontfencerect.x = screenrect.x + screenrect.w - UIDefinitions.houseviewpadding - frontyardwidth * sizeoffrontfencewidthoffrontyardwidth / 100
        frontfencerect.x = screenrect.x + screenrect.w - frontfencerect.w
        //frontfencerect.y = landline - drivewayrect.h - UIDefinitions.houseviewpadding - houserect.h * sizeoffrontfenceheightofhouseheight / 100
        frontfencerect.y = landline - frontfencerect.h
        
        frontyardrect.x = garagerect.x + garagerect.w + UIDefinitions.houseviewpadding
        frontyardrect.y = landline - drivewayrect.h - UIDefinitions.houseviewpadding - houserect.h * sizeoffrontyardheightofhouseheight / 100
        frontyardrect.w = frontyardwidth * sizeoffrontyardwidthoffrontyardwidth / 100
        frontyardrect.h = houserect.h * sizeoffrontyardheightofhouseheight / 100
        
        drivewayrect.x = garagerect.x + garagerect.w
        drivewayrect.y = landline - garagerect.h * sizeofdrivewayheightofgarageheight / 100
        //drivewayrect.w = frontyardwidth * sizeofdrivewaywidthoffrontyardwidth / 100
        drivewayrect.w = frontfencerect.x - garagerect.x - garagerect.w
        drivewayrect.h = garagerect.h * sizeofdrivewayheightofgarageheight / 100
        
    }
    
    private func setupTopbarViews() {
        
        var rect: CGRect = .zero
        var count: CGFloat = 0
        
        count += 1
        rect.origin.x = screenrect.x + screenrect.w - count * UIDefinitions.topbariconpadding - count * UIDefinitions.topbarheight
        rect.origin.y = screenrect.y
        rect.size.width = UIDefinitions.topbarheight
        rect.size.height = UIDefinitions.topbarheight
        
        articleicon = UIUnicodeIcon(frame: rect, key: .Setting1, size: UIDefinitions.topbarheight)
        articleicon.isUserInteractionEnabled = true
        articleicon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapArticleSetting(_:))))
        
        count += 1
        rect.origin.x = screenrect.x + screenrect.w - count * UIDefinitions.topbariconpadding - count * UIDefinitions.topbarheight
        profileicon = UIUnicodeIcon(frame: rect, key: .Setting, size: UIDefinitions.topbarheight)
        profileicon.isUserInteractionEnabled = true
        profileicon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapProfileSetting(_:))))
        
        count += 1
        rect.origin.x = screenrect.x + screenrect.w - count * UIDefinitions.topbariconpadding - count * UIDefinitions.topbarheight
        alarmicon = UIAlarmIcon(frame: rect)
        alarmicon.isUserInteractionEnabled = true
        alarmicon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapAlarmIcon(_:))))
        
        view.addSubview(articleicon)
        view.addSubview(profileicon)
        view.addSubview(alarmicon)
        
    }
    
    private func setupHouseViews() {
        
        guard let model = MyHouse.instance() else {
            return
        }
        guard let uniqueid = UniqueId.instance() else {
            return
        }
        
        var houserepoindex: HouseRepoIndex!
        var placerepoindex: PlaceRepoIndex!
        var articlerepoindex: ArticleRepoIndex!
        
        var count: Int = 0
        
        var ai: ArticleInitData = ArticleInitData()
        
        house = UIHouse(frame: CGRect(x: houserect.x, y: houserect.y, width: houserect.w, height: houserect.h), sizeinfo: housesizeinfo, delegate: self, celldelegate: self)
        setupViewsInUIHouse(model: model, uniqueid: uniqueid)
        view.addSubview(house)
        
        count = model.repo.article.chimney.count
        if count > 0 {
            chimney = UIChimney(frame: CGRect(x: chimneyrect.x, y: chimneyrect.y, width: chimneyrect.w, height: chimneyrect.h), delegate: self)
            chimney.containerid = model.repo.article.chimney[0].containerid
            for i in 0..<count {
                chimney.modelids.append(model.repo.article.chimney[i].id)
            }
            view.addSubview(chimney)
        }
        else {
            if model.isfirsttime {
                chimney = UIChimney(frame: CGRect(x: chimneyrect.x, y: chimneyrect.y, width: chimneyrect.w, height: chimneyrect.h), delegate: self)
                chimney.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                ai.at = .Chimney
                articlerepoindex = (id: id, containerid: chimney.containerid, type: .Chimney, ai: ai)
                houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                model.add(index: houserepoindex)
                chimney.modelids.append(id)
                view.addSubview(chimney)
            }
        }
        
        count = model.repo.article.gutter.count
        if count > 0 {
            gutter = UIGutter(frame: CGRect(x: gutterrect.x, y: gutterrect.y, width: gutterrect.w, height: gutterrect.h), delegate: self)
            gutter.containerid = model.repo.article.gutter[0].containerid
            for i in 0..<count {
                gutter.modelids.append(model.repo.article.gutter[i].id)
            }
            view.addSubview(gutter)
        }
        else {
            if model.isfirsttime {
                gutter = UIGutter(frame: CGRect(x: gutterrect.x, y: gutterrect.y, width: gutterrect.w, height: gutterrect.h), delegate: self)
                gutter.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                ai.at = .Gutter
                articlerepoindex = (id: id, containerid: gutter.containerid, type: .Gutter, ai: ai)
                houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                model.add(index: houserepoindex)
                gutter.modelids.append(id)
                view.addSubview(gutter)
            }
        }
        
        count = model.repo.article.downspout.count
        if count > 0 {
            downspout = UIDownspout(frame: CGRect(x: downspoutrect.x, y: downspoutrect.y, width: downspoutrect.w, height: downspoutrect.h), delegate: self)
            downspout.containerid = model.repo.article.downspout[0].containerid
            for i in 0..<count {
                downspout.modelids.append(model.repo.article.downspout[i].id)
            }
            view.addSubview(downspout)
        }
        else {
            if model.isfirsttime {
                downspout = UIDownspout(frame: CGRect(x: downspoutrect.x, y: downspoutrect.y, width: downspoutrect.w, height: downspoutrect.h), delegate: self)
                downspout.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                ai.at = .Downspout
                articlerepoindex = (id: id, containerid: downspout.containerid, type: .Downspout, ai: ai)
                houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                model.add(index: houserepoindex)
                downspout.modelids.append(id)
                view.addSubview(downspout)
            }

        }
        
        count = model.repo.place.backyard.count
        if count > 0 {
            backyard = UIBackyard(frame: CGRect(x: backyardrect.x, y: backyardrect.y, width: backyardrect.w, height: backyardrect.h), delegate: self)
            backyard.position.yardid = backyardid
            backyard.containerid = model.repo.place.backyard[0].containerid
            for i in 0..<count {
                backyard.modelids.append(model.repo.place.backyard[i].id)
            }
            view.addSubview(backyard)
        }
        else {
            if model.isfirsttime {
                backyard = UIBackyard(frame: CGRect(x: backyardrect.x, y: backyardrect.y, width: backyardrect.w, height: backyardrect.h), delegate: self)
                backyard.position.yardid = backyardid
                backyard.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                placerepoindex = (id: id, position: backyard.position, type: .Backyard)
                houserepoindex = (repotype: .place, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: placerepoindex, articlerepoindex: nil)
                model.add(index: houserepoindex)
                backyard.modelids.append(id)
                view.addSubview(backyard)
            }
        }
        
        count = model.repo.article.fence.count
        if count > 0 {
            for f in model.repo.article.fence {
                if f.yardid == backyardid {
                    backyardfence = UIFence(frame: CGRect(x: backfencerect.x, y: backfencerect.y, width: backfencerect.w, height: backfencerect.h), delegate: self)
                    backyardfence.fencetype = ViewModelConverter.instance.getUIFenceTypeFromModel(type: f.fencetype)
                    backyardfence.containerid = f.containerid
                    backyardfence.modelids.append(f.id)
                    view.addSubview(backyardfence)
                }
            }
        }
        else {
            if model.isfirsttime {
                backyardfence = UIFence(frame: CGRect(x: backfencerect.x, y: backfencerect.y, width: backfencerect.w, height: backfencerect.h), delegate: self)
                backyardfence.fencetype = .wood
                backyardfence.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                ai.at = .Fence
                ai.fencetype = .Wood
                ai.fenceyardid = backyardid
                articlerepoindex = (id: id, containerid: backyardfence.containerid, type: .Fence, ai: ai)
                houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                model.add(index: houserepoindex)
                backyardfence.modelids.append(id)
                view.addSubview(backyardfence)
            }
        }
        
        count = model.repo.place.backyard.count
        if count > 0 {
            let num = model.repo.place.pool.count
            if num > 0 {
                for p in model.repo.place.pool {
                    if p.position.yardid == backyardid {
                        let rectofpool = backyard.getInnerRects(number: 1)
                        poolrect.x = rectofpool.origin.x
                        poolrect.y = rectofpool.origin.y
                        poolrect.w = rectofpool.size.width
                        poolrect.h = rectofpool.size.height
                        pool = UIPool(frame: rectofpool, delegate: self)
                        pool.position.yardid = backyardid
                        pool.containerid = p.containerid
                        pool.modelids.append(p.id)
                        view.addSubview(pool)
                    }
                }
            }
            else {
                if model.isfirsttime {
                    let rectofpool = backyard.getInnerRects(number: 1)
                    poolrect.x = rectofpool.origin.x
                    poolrect.y = rectofpool.origin.y
                    poolrect.w = rectofpool.size.width
                    poolrect.h = rectofpool.size.height
                    pool = UIPool(frame: rectofpool, delegate: self)
                    pool.position.yardid = backyardid
                    pool.containerid = uniqueid.sequenceid
                    let id = uniqueid.sequenceid
                    placerepoindex = (id: id, position: pool.position, type: .Pool)
                    houserepoindex = (repotype: .place, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: placerepoindex, articlerepoindex: nil)
                    model.add(index: houserepoindex)
                    pool.modelids.append(id)
                    view.addSubview(pool)
                }
            }
            
        }
        
        count = model.repo.place.backyard.count
        if count > 0 {
            let num = model.repo.place.patio.count
            if num > 0 {
                for p in model.repo.place.patio {
                    if p.position.yardid == backyardid {
                        let rectofpatio = backyard.getInnerRects(number: 2)
                        patiorect.x = rectofpatio.origin.x
                        patiorect.y = rectofpatio.origin.y
                        patiorect.w = rectofpatio.size.width
                        patiorect.h = rectofpatio.size.height
                        patio = UIPatio(frame: rectofpatio, delegate: self)
                        patio.position.yardid = backyardid
                        patio.containerid = p.containerid
                        patio.modelids.append(p.id)
                        view.addSubview(patio)
                    }
                }
            }
            else {
                if model.isfirsttime {
                    let rectofpatio = backyard.getInnerRects(number: 2)
                    patiorect.x = rectofpatio.origin.x
                    patiorect.y = rectofpatio.origin.y
                    patiorect.w = rectofpatio.size.width
                    patiorect.h = rectofpatio.size.height
                    patio = UIPatio(frame: rectofpatio, delegate: self)
                    patio.position.yardid = backyardid
                    patio.containerid = uniqueid.sequenceid
                    let id = uniqueid.sequenceid
                    placerepoindex = (id: id, position: patio.position, type: .Patio)
                    houserepoindex = (repotype: .place, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: placerepoindex, articlerepoindex: nil)
                    model.add(index: houserepoindex)
                    patio.modelids.append(id)
                    view.addSubview(patio)
                }
            }
        }
        
        count = model.repo.place.deck.count
        if count > 0 {
            deck = UIDeck(frame: CGRect(x: deckrect.x, y: deckrect.y, width: deckrect.w, height: deckrect.h), delegate: self)
            deck.position.yardid = backyardid
            deck.containerid = model.repo.place.deck[0].containerid
            for d in model.repo.place.deck {
                deck.modelids.append(d.id)
            }
            for d in model.repo.article.deck {
                deck.modelids.append(d.id)
            }
            view.addSubview(deck)
        }
        else {
            if model.isfirsttime {
                deck = UIDeck(frame: CGRect(x: deckrect.x, y: deckrect.y, width: deckrect.w, height: deckrect.h), delegate: self)
                deck.position.yardid = backyardid
                deck.containerid = uniqueid.sequenceid
                let placeid = uniqueid.sequenceid
                placerepoindex = (id: placeid, position: deck.position, type: .Deck)
                houserepoindex = (repotype: .place, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: placerepoindex, articlerepoindex: nil)
                model.add(index: houserepoindex)
                deck.modelids.append(placeid)
                
                let articleid = uniqueid.sequenceid
                articlerepoindex = (id: articleid, containerid: deck.containerid, type: .Deck, ai: ai)
                houserepoindex.repotype = .article
                houserepoindex.storeyrepoindex = nil
                houserepoindex.roomrepoindex = nil
                houserepoindex.placerepoindex = nil
                houserepoindex.articlerepoindex = articlerepoindex
                model.add(index: houserepoindex)
                deck.modelids.append(articleid)
                view.addSubview(deck)
            }
        }
        
        count = model.repo.place.frontyard.count
        if count > 0 {
            frontyard = UIFrontyard(frame: CGRect(x: frontyardrect.x, y: frontyardrect.y, width: frontyardrect.w, height: frontyardrect.h), delegate: self)
            frontyard.position.yardid = frontyardid
            frontyard.containerid = model.repo.place.frontyard[0].containerid
            for i in 0..<count {
                frontyard.modelids.append(model.repo.place.frontyard[i].id)
            }
            view.addSubview(frontyard)
        }
        else {
            if model.isfirsttime {
                frontyard = UIFrontyard(frame: CGRect(x: frontyardrect.x, y: frontyardrect.y, width: frontyardrect.w, height: frontyardrect.h), delegate: self)
                frontyard.position.yardid = frontyardid
                frontyard.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                placerepoindex = (id: id, position: frontyard.position, type: .Frontyard)
                houserepoindex = (repotype: .place, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: placerepoindex, articlerepoindex: nil)
                model.add(index: houserepoindex)
                frontyard.modelids.append(id)
                view.addSubview(frontyard)
            }
        }
        
        var hasfrontfence: Bool = false
        for f in model.repo.article.fence {
            if f.yardid == frontyardid {
                frontyardfence = UIFence(frame: CGRect(x: frontfencerect.x, y: frontfencerect.y, width: frontfencerect.w, height: frontfencerect.h), delegate: self)
                frontyardfence.fencetype = ViewModelConverter.instance.getUIFenceTypeFromModel(type: f.fencetype)
                frontyardfence.containerid = f.containerid
                frontyardfence.modelids.append(f.id)
                view.addSubview(frontyardfence)
                hasfrontfence = true
            }
        }
        if hasfrontfence {
            
        }
        else {
            if model.isfirsttime {
                frontyardfence = UIFence(frame: CGRect(x: frontfencerect.x, y: frontfencerect.y, width: frontfencerect.w, height: frontfencerect.h), delegate: self)
                frontyardfence.fencetype = .iron
                frontyardfence.numberofinnerpoles = 3
                frontyardfence.numberofoutterpoles = 2
                frontyardfence.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                ai.at = .Fence
                ai.fencetype = .WroughtIron
                ai.fenceyardid = frontyardid
                articlerepoindex = (id: id, containerid: frontyardfence.containerid, type: .Fence, ai: ai)
                houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                model.add(index: houserepoindex)
                frontyardfence.modelids.append(id)
                view.addSubview(frontyardfence)
            }
        }
        
        count = model.repo.place.garage.count
        if count > 0 {
            garage = UIGarage(frame: CGRect(x: garagerect.x, y: garagerect.y, width: garagerect.w, height: garagerect.h), delegate: self)
            garage.containerid = model.repo.place.garage[0].containerid
            for g in model.repo.place.garage {
                garage.modelids.append(g.id)
            }
            view.addSubview(garage)
        }
        else {
            if model.isfirsttime {
                garage = UIGarage(frame: CGRect(x: garagerect.x, y: garagerect.y, width: garagerect.w, height: garagerect.h), delegate: self)
                garage.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                placerepoindex = (id: id, position: garage.position, type: .Garage)
                houserepoindex = (repotype: .place, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: placerepoindex, articlerepoindex: nil)
                model.add(index: houserepoindex)
                garage.modelids.append(id)
                view.addSubview(garage)
            }
        }
        
        count = model.repo.place.garage.count
        if count > 0 {
            let garagedoornum = model.repo.article.garagedoor.count
            if garagedoornum > 0 {
                let rectofgaragedoor = garage.getDoorRect()
                garagedoorrect.x = rectofgaragedoor.origin.x
                garagedoorrect.y = rectofgaragedoor.origin.y
                garagedoorrect.w = rectofgaragedoor.size.width
                garagedoorrect.h = rectofgaragedoor.size.height
                garagedoor = UIGaragedoor(frame: rectofgaragedoor, delegate: self)
                garagedoor.containerid = model.repo.article.garagedoor[0].containerid
                for g in model.repo.article.garagedoor {
                    garagedoor.modelids.append(g.id)
                }
                for g in model.repo.article.garagedooropener {
                    garagedoor.modelids.append(g.id)
                }
                view.addSubview(garagedoor)
            }
            else {
                if model.isfirsttime {
                    let rectofgaragedoor = garage.getDoorRect()
                    garagedoorrect.x = rectofgaragedoor.origin.x
                    garagedoorrect.y = rectofgaragedoor.origin.y
                    garagedoorrect.w = rectofgaragedoor.size.width
                    garagedoorrect.h = rectofgaragedoor.size.height
                    garagedoor = UIGaragedoor(frame: rectofgaragedoor, delegate: self)
                    garagedoor.containerid = uniqueid.sequenceid
                    //Garagedoor model
                    var id = uniqueid.sequenceid
                    ai.at = .GarageDoor
                    articlerepoindex = (id: id, containerid: garagedoor.containerid, type: .GarageDoor, ai: ai)
                    houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                    model.add(index: houserepoindex)
                    garagedoor.modelids.append(id)
                    //Garagedooropener model
                    id = uniqueid.sequenceid
                    ai.at = .GarageDoorOpener
                    articlerepoindex = (id: id, containerid: garagedoor.containerid, type: .GarageDoorOpener, ai: ai)
                    houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                    model.add(index: houserepoindex)
                    garagedoor.modelids.append(id)
                    view.addSubview(garagedoor)
                }
            }
            
            let carnum = model.repo.article.car.count
            if carnum > 0 {
                let rectofcar = garage.getCarRect()
                carrect.x = rectofcar.origin.x
                carrect.y = rectofcar.origin.y
                carrect.w = rectofcar.size.width
                carrect.h = rectofcar.size.height
                car = UICar(frame: rectofcar, delegate: self)
                car.containerid = model.repo.article.car[0].containerid
                for c in model.repo.article.car {
                    car.modelids.append(c.id)
                }
                view.addSubview(car)
            }
            else {
                if model.isfirsttime {
                    let rectofcar = garage.getCarRect()
                    carrect.x = rectofcar.origin.x
                    carrect.y = rectofcar.origin.y
                    carrect.w = rectofcar.size.width
                    carrect.h = rectofcar.size.height
                    car = UICar(frame: rectofcar, delegate: self)
                    car.containerid = uniqueid.sequenceid
                    let id = uniqueid.sequenceid
                    ai.at = .Car
                    articlerepoindex = (id: id, containerid: car.containerid, type: .Car, ai: ai)
                    houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                    model.add(index: houserepoindex)
                    car.modelids.append(id)
                    view.addSubview(car)
                }
            }

        }
        
        count = model.repo.place.driveway.count
        if count > 0 {
            driveway = UIDriveway(frame: CGRect(x: drivewayrect.x, y: drivewayrect.y, width: drivewayrect.w, height: drivewayrect.h), delegate: self)
            driveway.position.yardid = frontyardid
            driveway.containerid = model.repo.place.driveway[0].containerid
            for d in model.repo.place.driveway {
                driveway.modelids.append(d.id)
            }
            for d in model.repo.article.driveway {
                driveway.modelids.append(d.id)
            }
            view.addSubview(driveway)
        }
        else {
            if model.isfirsttime {
                driveway = UIDriveway(frame: CGRect(x: drivewayrect.x, y: drivewayrect.y, width: drivewayrect.w, height: drivewayrect.h), delegate: self)
                driveway.position.yardid = frontyardid
                driveway.containerid = uniqueid.sequenceid
                let placeid = uniqueid.sequenceid
                placerepoindex = (id: placeid, position: driveway.position, type: .Driveway)
                houserepoindex = (repotype: .place, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: placerepoindex, articlerepoindex: nil)
                model.add(index: houserepoindex)
                driveway.modelids.append(placeid)
                
                let articleid = uniqueid.sequenceid
                ai.at = .Driveway
                articlerepoindex = (id: articleid, containerid: driveway.containerid, type: .Driveway, ai: ai)
                houserepoindex.repotype = .article
                houserepoindex.storeyrepoindex = nil
                houserepoindex.roomrepoindex = nil
                houserepoindex.placerepoindex = nil
                houserepoindex.articlerepoindex = articlerepoindex
                model.add(index: houserepoindex)
                driveway.modelids.append(articleid)
                view.addSubview(driveway)
            }
        }
        
        if model.isfirsttime {
            model.isfirsttime = false
        }
        
    }

    private func setupPopupMenu() {
        focusedview = nil
        
        //popupmenu = UIPopupMenu(frame: .zero)
        
        popuplabel = UILabel(frame: .zero)
        popuplabel.tag = tagofpopuplabel
        popuplabel.textAlignment = .center
        popuplabel.adjustsFontSizeToFitWidth = true
        popuplabel.textColor = textcolorofpopuplabel
        
        /*-------------------------------------------------
         TapOnView will handle the case that NOT tap on focusable view.
         It will release the focus of existing focusedview, and disappear
         the popupmenu and popuplabel if applicable
         ---------------------------------------------------*/
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapOnView(_:))))
    }
    
    private func setupViewsInUIHouse(model: MyHouse, uniqueid: UniqueId) {
        //roof
        //wall, window, door, balcony, siding, basementdoor
        //attic, insulation (basementstorey, [storeys]) INTERIOR VIEW
        
        var count: Int = 0
        var articlerepoindex: ArticleRepoIndex!
        var placerepoindex: PlaceRepoIndex!
        var houserepoindex: HouseRepoIndex!
        var ai: ArticleInitData = ArticleInitData()
        
        count = model.repo.article.roof.count
        if count > 0 {
            house.roof.containerid = model.repo.article.roof[0].containerid
            for r in model.repo.article.roof {
                house.roof.modelids.append(r.id)
            }
        }
        else {
            if model.isfirsttime {
                house.roof.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                ai.at = .Roof
                articlerepoindex = (id: id, containerid: house.roof.containerid, type: .Roof, ai: ai)
                houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                model.add(index: houserepoindex)
                house.roof.modelids.append(id)
            }
        }
        
        count = model.repo.article.exteriorwall.count
        if count > 0 {
            house.wall.containerid = model.repo.article.exteriorwall[0].containerid
            for w in model.repo.article.exteriorwall {
                house.wall.modelids.append(w.id)
            }
        }
        else {
            if model.isfirsttime {
                house.wall.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                ai.at = .ExteriorWall
                articlerepoindex = (id: id, containerid: house.wall.containerid, type: .ExteriorWall, ai: ai)
                houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                model.add(index: houserepoindex)
                house.wall.modelids.append(id)
            }
        }
        
        count = model.repo.article.housewindow.count
        if count > 0 {
            house.housewindow.containerid = model.repo.article.housewindow[0].containerid
            for h in model.repo.article.housewindow {
                house.housewindow.modelids.append(h.id)
            }
        }
        else {
            if model.isfirsttime {
                house.housewindow.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                ai.at = .HouseWindow
                articlerepoindex = (id: id, containerid: house.housewindow.containerid, type: .HouseWindow, ai: ai)
                houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                model.add(index: houserepoindex)
                house.housewindow.modelids.append(id)
            }
        }
        
        var hasmaindoor: Bool = false
        for d in model.repo.article.entrydoor {
            if d.entrydoorposition == .main {
                house.door.containerid = d.containerid
                house.door.modelids.append(d.id)
                hasmaindoor = true
            }
        }
        if hasmaindoor {
            //nothing to do. work had been done in above code block
        }
        else {
            if model.isfirsttime {
                house.door.containerid = uniqueid.sequenceid
                let id = uniqueid.sequenceid
                ai.at = .Entrydoor
                ai.entrydoortype = .SolidWood
                ai.entrydoorposition = .main
                articlerepoindex = (id: id, containerid: house.door.containerid, type: .Entrydoor, ai: ai)
                houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                model.add(index: houserepoindex)
                house.door.modelids.append(id)
            }
        }
        
        if housesizeinfo.hasbalcony {
            count = model.repo.place.balcony.count
            if count > 0 {
                house.balcony.containerid = model.repo.place.balcony[0].containerid
                for b in model.repo.place.balcony {
                    house.balcony.modelids.append(b.id)
                }
            }
            else {
                if model.isfirsttime {
                    house.balcony.containerid = uniqueid.sequenceid
                    let id = uniqueid.sequenceid
                    placerepoindex = (id: id, position: house.balcony.position, type: .Balcony)
                    houserepoindex = (repotype: .place, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: placerepoindex, articlerepoindex: nil)
                    model.add(index: houserepoindex)
                    house.balcony.modelids.append(id)
                }
            }
        }
        
        if housesizeinfo.hassiding {
            count = model.repo.article.siding.count
            if count > 0 {
                house.siding.containerid = model.repo.article.siding[0].containerid
                for s in model.repo.article.siding {
                    house.siding.modelids.append(s.id)
                }
            }
            else {
                if model.isfirsttime {
                    house.siding.containerid = uniqueid.sequenceid
                    let id = uniqueid.sequenceid
                    ai.at = .Siding
                    articlerepoindex = (id: id, containerid: house.siding.containerid, type: .Siding, ai: ai)
                    houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                    model.add(index: houserepoindex)
                    house.siding.modelids.append(id)
                }
            }
        }
        
        if housesizeinfo.hasbasement && housesizeinfo.isbasementwalkout {
            
            var hasbasementdoor: Bool = false
            for d in model.repo.article.entrydoor {
                if d.entrydoorposition == .basement {
                    house.basementdoor.containerid = d.containerid
                    house.basementdoor.modelids.append(d.id)
                    hasbasementdoor = true
                }
            }
            
            if !hasbasementdoor {
                if model.isfirsttime {
                    house.basementdoor.containerid = uniqueid.sequenceid
                    let id = uniqueid.sequenceid
                    ai.at = .Entrydoor
                    ai.entrydoorposition = .basement
                    articlerepoindex = (id: id, containerid: house.basementdoor.containerid, type: .Entrydoor, ai: ai)
                    houserepoindex = (repotype: .article, storeyrepoindex: nil, roomrepoindex: nil, placerepoindex: nil, articlerepoindex: articlerepoindex)
                    model.add(index: houserepoindex)
                    house.basementdoor.modelids.append(id)
                }
            }
        }
        
    }
    
    /*---------------------------------------
     topbar callback actions
     -----------------------------------------*/
    func TapArticleSetting(_ sender: UITapGestureRecognizer) {
        
    }
    
    func TapProfileSetting(_ sender: UITapGestureRecognizer) {
        
    }
    
    func TapAlarmIcon(_ sender: UITapGestureRecognizer) {
        
    }
    
    /*---------------------------------------
     view callback action
     -----------------------------------------*/
    func TapOnView(_ sender: UITapGestureRecognizer) {
        guard let focused = focusedview else {
            return
        }
        focused.focusOut()
        focusedview = nil
        self.removeViewFromSubview(tag: self.tagofpopuplabel)
        self.removeViewFromSubview(tag: self.tagofpopupmenu)
    }
}



