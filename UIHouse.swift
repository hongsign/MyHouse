//
//  UIHouse.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-03.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

typealias UIHouseSizeInfo = (
    landline: CGFloat,
    housewidth: CGFloat, househeight: CGFloat,
    roofheight: CGFloat, roofextend: CGFloat,
    hasbasement: Bool, isbasementwalkout: Bool, basementwidth: CGFloat, basementheight: CGFloat,
    hasbalcony: Bool,
    hassiding: Bool,
    hasinsulation: Bool, insulationheight: CGFloat,
    hasattic: Bool
)

typealias  UINumberOfStoreys = (
    numberofstoreys: Int,
    numberofsplitstoreys: Int,
    numberofsplitstoreys0: Int,
    numberofsplitstoreys1: Int
)

enum UIHouseViewType: String {
    case exterior
    case interior
}

enum UIHouseArcType: String {
    case backsplit
    case frontsplit
    case sidesplit
    case doublesidesplit
    case bangalore
    case storey
}

typealias UIHouseArcTypeWithStoreyNumbers = (
    housearctype: UIHouseArcType,
    numberofstoreys: UINumberOfStoreys
)

class UIHouse: UIView {
    
    internal var overridebgcolor: UIColor {
        get { return UIColor.clear }
    }
    
    var celldelegate: UIStoreyCellDelegate?
    var focusdelegate: UIHouseViewFocusDelegate?
    
    var _houseviewtype: UIHouseViewType = .exterior
    var houseviewtype: UIHouseViewType {
        get { return _houseviewtype }
        set(newvalue) {
            if newvalue != _houseviewtype {
                _houseviewtype = newvalue
                changeHouseViewType()
            }
        }
    }
    
    var info: UIHouseSizeInfo = (landline: 0, housewidth: 0, househeight: 0, roofheight: 0, roofextend: 0, hasbasement: true, isbasementwalkout: true, basementwidth: 0, basementheight: 0, hasbalcony: true, hassiding: true, hasinsulation: true, insulationheight: 0, hasattic: true)
    
    private let viewid: UIHouseViewId = .house
    
    private let sizeofbasementdoorwidth: CGFloat = 15
    private let sizeofbasementdoorheight: CGFloat = 70
    
    private var basementdoorwidth: CGFloat = 0
    private var basementdoorheight: CGFloat = 0
    
    private var roofrect: UIRect = UIRect(x: 0, y: 0, w: 0, h: 0)
    private var rect: UIRect = (x: 0,y: 0,w: 0,h: 0)
    private var basementrect: UIRect = UIRect(x: 0, y: 0, w: 0, h: 0)
    
    var roof: UIRoof!
    
    /*-------------------------------------------------------
     Exterior view
     statics and variables
    ---------------------------------------------------------*/
    let sizeofdoorheightofhouseheight: CGFloat = 35
    let sizeofdoorwidthofhousewidth: CGFloat = 20
    let sizeofdooroffsetfromright: CGFloat = 20
    
    let sizeofwindowheightofhouseheight: CGFloat = 18
    let sizeofwindowwidthofhousewidth: CGFloat = 20
    let sizeofwindowoffsetfromleft: CGFloat = 20
    
    let sizeofbalconyheightofhouseheight: CGFloat = 30
    let sizeofbalconyoffsetfromleft: CGFloat = 35
    
    //Door
    private var doorwidth: CGFloat = 0
    private var doorheight: CGFloat = 0
    private var dooroffset: CGFloat = 0
    //Window
    private var windowwidth: CGFloat = 0
    private var windowheight: CGFloat = 0
    private var windowoffset: CGFloat = 0
    //Balcony
    private var balconywidth: CGFloat = 0
    private var balconyheight: CGFloat = 0
    private var balconyoffset: CGFloat = 0
    
    var wall: UIWall!
    var housewindow: UIHouseWindow!
    var door: UIDoor!
    var balcony: UIBalcony!
    
    var siding: UISiding!
    
    //Just show a frame in exterior view with door if walkout
    var basement: UIView!
    var basementdoor: UIDoor!
    
    
    /*-------------------------------------------------------
     Interior view
     statics and variables
     ---------------------------------------------------------*/
    
    var _housearcwithstoreynumbers: UIHouseArcTypeWithStoreyNumbers = (
        housearctype: .storey,
        numberofstoreys: (
            numberofstoreys: 2,
            numberofsplitstoreys: 3,
            numberofsplitstoreys0: 3,
            numberofsplitstoreys1: 3
        )
    )
    var housearcwithstoreynumbers: UIHouseArcTypeWithStoreyNumbers {
        get { return _housearcwithstoreynumbers }
        set(newvalue) {
            if newvalue.housearctype != _housearcwithstoreynumbers.housearctype {
                _housearcwithstoreynumbers = newvalue
                changeHouseArcType()
            }
            else {
                if newvalue.numberofstoreys != _housearcwithstoreynumbers.numberofstoreys {
                    _housearcwithstoreynumbers = newvalue
                    changeHouseStoreyNumbers()
                }
            }
        }
    }
    
    var _storeyborderwidth: CGFloat = 1
    var storeyborderwidth: CGFloat {
        get { return _storeyborderwidth }
        set(newvalue) {
            if newvalue != _storeyborderwidth {
                _storeyborderwidth = newvalue
                for s in storeys {
                    s.layer.borderWidth = _storeyborderwidth
                }
            }
        }
    }
    
    var _storeybordercolor: UIColor = .black
    var storeybordercolor: UIColor {
        get { return _storeybordercolor }
        set(newvalue) {
            if newvalue != _storeybordercolor {
                _storeybordercolor = newvalue
                for s in storeys {
                    s.layer.borderColor = _storeybordercolor.cgColor
                }
            }
        }
    }
    
    var _storeybgcolor: UIColor = .clear
    var storeybgcolor: UIColor {
        get { return _storeybgcolor }
        set(newvalue) {
            if newvalue != _storeybgcolor {
                _storeybgcolor = newvalue
                for s in storeys {
                    s.backgroundColor = _storeybgcolor
                }
            }
        }
    }
    
    let sizeofsplitwidth: CGFloat = 35
    let sizeofdoublesplitwidth: CGFloat = 25
    let sizeofstoreytoppadding: CGFloat = 5
    let sizeofstoreyleftpadding: CGFloat = 3
    let sizeofstoreycellwidthofheight: CGFloat = 80
    
    private var splitwidth: CGFloat = 0
    private var doublesplitwidth: CGFloat = 0
    private var storeywidth: CGFloat = 0
    
    private var storeyrects: [UIRect] = [UIRect]()
    
    //Please note: 
    //basement will be showed as a normal storey in interior view without door
    var basementstorey: UIStorey!
    var storeys: [UIStorey] = [UIStorey]()
    var attic: UIAttic!
    var insulation: UIInsulation!
    
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        wall = UIWall(frame: .zero)
        door = UIDoor(frame: .zero)
    }
    */
    
    init(frame: CGRect, sizeinfo: UIHouseSizeInfo, delegate: UIHouseViewFocusDelegate, celldelegate: UIStoreyCellDelegate) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        //viewid = .house
        self.focusdelegate = delegate
        self.celldelegate = celldelegate
        self.info = sizeinfo
        
        setSizeValues()
        drawHouse()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //STEP 1
    private func setSizeValues() {
        
        translateToUIRect()
        
        switch houseviewtype {
        case .exterior:
            doorwidth = rect.w * sizeofdoorwidthofhousewidth / 100
            doorheight = rect.h * sizeofdoorheightofhouseheight / 100
            dooroffset = rect.w * sizeofdooroffsetfromright / 100
            windowwidth = rect.w * sizeofwindowwidthofhousewidth / 100
            windowheight = rect.h * sizeofwindowheightofhouseheight / 100
            windowoffset = rect.w * sizeofwindowoffsetfromleft / 100
            balconyheight = rect.h * sizeofbalconyheightofhouseheight / 100
            balconywidth = balconyheight
            balconyoffset = rect.w * sizeofbalconyoffsetfromleft / 100
        case .interior:
            setRectsOfStoreys()
        }
        
    }
    //STEP 1.1
    private func setRectsOfStoreys() {
        
        storeyrects.removeAll()
        
        splitwidth = rect.w * sizeofsplitwidth / 100
        doublesplitwidth = rect.w * sizeofsplitwidth / 100
        
        var height: CGFloat = 0
        var splitheight: CGFloat = 0
        var splitheight0: CGFloat = 0
        var splitheight1: CGFloat = 0
        
        switch housearcwithstoreynumbers.housearctype {
        case .storey:
            storeywidth = rect.w
            let n = CGFloat(housearcwithstoreynumbers.numberofstoreys.numberofstoreys)
            height = rect.h / n
            for i in 0..<housearcwithstoreynumbers.numberofstoreys.numberofstoreys {
                let x = CGFloat(i)
                storeyrects.append(UIRect(x: rect.x, y: rect.y + x * height, w: storeywidth, h: height))
            }
        case .sidesplit, .backsplit:
            storeywidth = rect.w - splitwidth
            let m = CGFloat(housearcwithstoreynumbers.numberofstoreys.numberofsplitstoreys)
            let n = CGFloat(housearcwithstoreynumbers.numberofstoreys.numberofstoreys)
            height = rect.h / n
            splitheight = rect.h / m
            for i in 0..<housearcwithstoreynumbers.numberofstoreys.numberofstoreys {
                let x = CGFloat(i)
                storeyrects.append(UIRect(x: rect.x + splitwidth, y: rect.y + x * height, w: storeywidth, h: height))
            }
            for i in 0..<housearcwithstoreynumbers.numberofstoreys.numberofsplitstoreys {
                let x = CGFloat(i)
                storeyrects.append(UIRect(x: rect.x, y: rect.y + x * splitheight, w: splitwidth, h: splitheight))
            }
        case .frontsplit:
            storeywidth = rect.w - splitwidth
            let m = CGFloat(housearcwithstoreynumbers.numberofstoreys.numberofsplitstoreys)
            let n = CGFloat(housearcwithstoreynumbers.numberofstoreys.numberofstoreys)
            height = rect.h / n
            splitheight = rect.h / m
            for i in 0..<housearcwithstoreynumbers.numberofstoreys.numberofstoreys {
                let x = CGFloat(i)
                storeyrects.append(UIRect(x: rect.x, y: rect.y + x * height, w: storeywidth, h: height))
            }
            for i in 0..<housearcwithstoreynumbers.numberofstoreys.numberofsplitstoreys {
                let x = CGFloat(i)
                storeyrects.append(UIRect(x: rect.x + storeywidth, y: rect.y + x * splitheight, w: splitwidth, h: splitheight))
            }
        case .doublesidesplit:
            storeywidth = rect.w - 2 * doublesplitwidth
            let n = CGFloat(housearcwithstoreynumbers.numberofstoreys.numberofstoreys)
            let m0 = CGFloat(housearcwithstoreynumbers.numberofstoreys.numberofsplitstoreys0)
            let m1 = CGFloat(housearcwithstoreynumbers.numberofstoreys.numberofsplitstoreys1)
            height = rect.h / n
            splitheight0 = rect.h / m0
            splitheight1 = rect.h / m1
            for i in 0..<housearcwithstoreynumbers.numberofstoreys.numberofstoreys {
                let x = CGFloat(i)
                storeyrects.append(UIRect(x: rect.x + doublesplitwidth, y: rect.y + x * height, w: storeywidth, h: height))
            }
            for i in 0..<housearcwithstoreynumbers.numberofstoreys.numberofsplitstoreys0 {
                let x = CGFloat(i)
                storeyrects.append(UIRect(x: rect.x, y: rect.y + x * splitheight0, w: doublesplitwidth, h: splitheight0))
            }
            for i in 0..<housearcwithstoreynumbers.numberofstoreys.numberofsplitstoreys1 {
                let x = CGFloat(i)
                storeyrects.append(UIRect(x: rect.x + doublesplitwidth + storeywidth, y: rect.y + x * splitheight1, w: doublesplitwidth, h: splitheight1))
            }
        case .bangalore:
            //put one storey in the middle of house area
            storeywidth = rect.w
            storeyrects.append(UIRect(x: rect.x, y: rect.y + rect.w / 4, w: storeywidth, h: rect.h / 2))
        } //end of switch
        
    }
    
    //STEP 2
    private func drawHouse() {
        
        //removeSubview()
        
        roof = UIRoof(frame: CGRect(x: roofrect.x, y: roofrect.y, width: roofrect.w, height: roofrect.h))
        roof.delegate = focusdelegate
        addSubview(roof)
        
        switch houseviewtype {
        case .exterior:
            
            wall = UIWall(frame: CGRect(x: rect.x, y: rect.y, width: rect.w, height: rect.h))
            wall.delegate = focusdelegate
            
            door = UIDoor(frame: CGRect(x: rect.x + rect.w - dooroffset - doorwidth, y: rect.y + rect.h - doorheight, width: doorwidth, height: doorheight))
            door.delegate = focusdelegate
            door.backgroundColor = overridebgcolor
            
            housewindow = UIHouseWindow(frame: CGRect(x: rect.x + windowoffset, y: rect.y + rect.h - doorheight, width: windowwidth, height: windowheight))
            housewindow.delegate = focusdelegate
            housewindow.backgroundColor = overridebgcolor
            
            addSubview(wall)
            addSubview(door)
            addSubview(housewindow)
            
            if info.hasbalcony {
                balcony = UIBalcony(frame: CGRect(x: rect.x + balconyoffset, y: rect.y, width: balconywidth, height: balconyheight))
                balcony.delegate = focusdelegate
                balcony.backgroundColor = overridebgcolor
                addSubview(balcony)
            }
            if info.hassiding {
                siding = UISiding(frame: roof.getInnerRect())
                siding.delegate = focusdelegate
                addSubview(siding)
            }
            if info.hasbasement {
                basement = UIView(frame: CGRect(x: basementrect.x, y: basementrect.y, width: basementrect.w, height: basementrect.h))
                basement.backgroundColor = storeybgcolor
                basement.layer.borderColor = storeybordercolor.cgColor
                basement.layer.borderWidth = storeyborderwidth
                addSubview(basement)
                if info.isbasementwalkout {
                    let width = basementrect.w * sizeofbasementdoorwidth / 100
                    let height = basementrect.h * sizeofbasementdoorheight / 100
                    basementdoor = UIDoor(frame: CGRect(x: basementrect.x, y: basementrect.y + (basementrect.h - height) / 2, width: width, height: height))
                    basementdoor.doortype = .easy
                    basementdoor.backgroundColor = overridebgcolor
                    basementdoor.delegate = focusdelegate
                    addSubview(basementdoor)
                    
                }
            }
            
        case .interior:
            
            storeys.removeAll()
            
            var toppadding: CGFloat = 0
            var leftpadding: CGFloat = 0
            var height: CGFloat = 0
            var width: CGFloat = 0
            
            var edgeinsets = UIEdgeInsets()
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            for r in storeyrects {
                toppadding = r.h * sizeofstoreytoppadding / 100
                leftpadding = r.w * sizeofstoreytoppadding / 100
                height = r.h - 2 * toppadding
                width = height * sizeofstoreycellwidthofheight / 100
                edgeinsets.top = toppadding
                edgeinsets.bottom = toppadding
                edgeinsets.left = leftpadding
                edgeinsets.right = leftpadding
                layout.sectionInset = edgeinsets
                layout.itemSize = CGSize(width: width, height: height)
                let s = UIStorey(frame: CGRect(x: r.x, y: r.y, width: r.w, height: r.h), collectionViewLayout: layout, focusdelegate: focusdelegate!, celldelegate: celldelegate)
                s.layer.borderColor = storeybordercolor.cgColor
                s.layer.borderWidth = storeyborderwidth
                s.backgroundColor = storeybgcolor
                storeys.append(s)
                addSubview(s)
            }
            
            if info.hasinsulation {
                insulation = UIInsulation(frame: CGRect(x: rect.x, y: rect.y - info.insulationheight, width: rect.w, height: info.insulationheight))
                insulation.delegate = focusdelegate
                addSubview(insulation)
            }
            if info.hasattic {
                attic = UIAttic(frame: roof.getInnerRect())
                attic.delegate = focusdelegate
                addSubview(attic)
            }
            if info.hasbasement {
                /*---------------------------------------------------
                 Just add basement as a normal storey
                 No basement door in interiror view
                -----------------------------------------------------*/
                toppadding = basementrect.h * sizeofstoreytoppadding / 100
                leftpadding = basementrect.w * sizeofstoreytoppadding / 100
                height = basementrect.h - 2 * toppadding
                width = height * sizeofstoreycellwidthofheight / 100
                edgeinsets.top = toppadding
                edgeinsets.bottom = toppadding
                edgeinsets.left = leftpadding
                edgeinsets.right = leftpadding
                layout.sectionInset = edgeinsets
                layout.itemSize = CGSize(width: width, height: height)
                basementstorey = UIStorey(frame: CGRect(x: basementrect.x, y: basementrect.y, width: basementrect.w, height: basementrect.h), collectionViewLayout: layout, focusdelegate: focusdelegate!, celldelegate: celldelegate)
                basementstorey.layer.borderColor = storeybordercolor.cgColor
                basementstorey.layer.borderWidth = storeyborderwidth
                basementstorey.backgroundColor = storeybgcolor
                addSubview(basementstorey)

            }
        }// end of switch
    }

    
    private func changeHouseViewType() {
        switch houseviewtype {
        case .exterior:
            //remove all interior subview
            for s in storeys {
                s.removeFromSuperview()
            }
        case .interior:
            //remove all exterior sbuview
            wall.removeFromSuperview()
            door.removeFromSuperview()
            housewindow.removeFromSuperview()
            balcony.removeFromSuperview()
        }
        
        setSizeValues()
        drawHouse()
    }
    
    private func changeHouseArcType() {
        if houseviewtype == .interior {
            setSizeValues()
            drawHouse()
        }
    }
    
    private func changeHouseStoreyNumbers() {
        if houseviewtype == .interior {
            setSizeValues()
            drawHouse()
        }
    }
    
    
    private func translateToUIRect() {
        
        roofrect.x = 0
        roofrect.y = 0
        roofrect.w = frame.size.width
        roofrect.h = info.roofheight
        
        rect.x = info.roofextend
        rect.y = info.roofheight
        rect.w = info.housewidth - 2 * info.roofextend
        rect.h = info.househeight - info.roofheight - info.basementheight
        
        basementrect.x = rect.x
        basementrect.y = info.landline
        basementrect.w = info.basementwidth
        basementrect.h = info.basementheight
    }

}
