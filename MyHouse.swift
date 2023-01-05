//
//  MyHouse.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

typealias  NumberOfStoreys = (
    numberofstoreys: Int,
    numberofsplitstoreys: Int,
    numberofsplitstoreys0: Int,
    numberofsplitstoreys1: Int
)

class MyHouse: Base {
    
    /*-----------------------------------------
     Begin of Singleton
     
     have to initialize it in other class (Persistence)
     case 1: new app, no existing data model. will create a new instance
     case 2: old app, load existing data model from file system, and
     deserialize to data model object.
     SO, init() can NOT be private!!!!
     this class still singleton, but careful not call init()
     EXCEPT Persistance.
     
     ABOSOLETE(Most important, one line singleton implementation is not applicable
     in this case anymore. I have to make it object-C way, and use
     dispatch_once keyword)
     
     after some rearch, it looks dispatch once also not working, which can't handle
     the scenario if need to reload data model from disk when it was dirty.
     
     SO i implemented singleton like below:
     depends on nil or not of class var instance to decide if call persistance to
     load datamodel. And destroy method will force reload happening
     -------------------------------------------*/
    
    //One Line Singleton Implementaion
    /*
     static let instance = Persistance.loadMyHouse()
     */
    
    //dispatch once singleton implementation (OBJECT-C)
    /*
     class var instance: MyHouse {
     struct Static {
     static var onceToken: dispatch_once_t = 0
     static var theinstance: MyHousel? = nil
     }
     dispatch_once(&Static.onceToken) {
     Static.theinstance = Persistance.loadMyHouse()
     }
     
     return Static.theinstance!
     }
     */
    
    private static var theinstance: MyHouse?
    
    class func instance() -> MyHouse? {
        guard let thisinstance = theinstance else {
            //print("MyHouse initializing...")
            theinstance = Persistance.loadMyHouse()
            return theinstance
        }
        //print("MyHouse returning...")
        return thisinstance
    }
    
    class func destroy() {
        //print("MyHouse destroying...")
        theinstance = nil
    }
    
    //Has to be internal/public. If nil returned, caller can use it to initialize instance.
    override init() {
        super.init()
        
        repo = HouseRepo()
        
        MyHouse.theinstance = self
    }
    
    /*------------------------------------------------------
     End of Singleton
     --------------------------------------------------------*/
    
    var numberofstoreys: NumberOfStoreys = (2,3,3,3)
    var housearctype: HouseArcType = .storey
    
    var _isfirsttime: Bool = true
    var isfirsttime: Bool {
        get { return _isfirsttime }
        set(newvalue) {
            if newvalue != _isfirsttime {
                _isfirsttime = newvalue
                Persistance.save(myhouse: self)
            }
        }
    }
    
    var repo: HouseRepo!
    
    
    
    var hasattic: Bool = true
    var hassiding: Bool = true
    var hasbalcony: Bool = true
    var hasbasement: Bool = true
    var hasinsulation: Bool = true
    var isbasementwalkout: Bool = true
    
    /*----------------------------------------------------
     Begin of ObjectMapper
    ------------------------------------------------------*/
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        numberofstoreys <- map["numberofstoreys"]
        housearctype <- map["housearctype"]
        _isfirsttime <- map["_isfirsttime"]
        
        repo <- map["repo"]
        
        hasattic <- map["hasattic"]
        hassiding <- map["hassiding"]
        hasbalcony <- map["hasbalcony"]
        hasbasement <- map["hasbasement"]
        hasinsulation <- map["hasinsulation"]
        isbasementwalkout <- map["isbasementwalkout"]
    }
    /*----------------------------------------------------
     End of ObjectMapper
     ------------------------------------------------------*/
    
    /*----------------------------------------------------
     Begin of Repository Operations
     ------------------------------------------------------*/
    func add(index: HouseRepoIndex) {
        repo.add(index: index)
        if repo.isdirty {
            Persistance.save(myhouse: self)
        }
    }
    
    func remove(index: HouseRepoIndex) {
        repo.remove(index: index)
        if repo.isdirty {
            Persistance.save(myhouse: self)
        }
    }
    
    func get(index: HouseRepoIndex) -> Base? {
        return repo.get(index: index)
    }
    /*----------------------------------------------------
     Begin of Repository Operations
     ------------------------------------------------------*/
    
}
