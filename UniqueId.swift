//
//  UniqueId.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class UniqueId: Base {
    
    
    private static var theinstance: UniqueId?
    
    class func instance() -> UniqueId? {
        guard let thisinstance = theinstance else {
            //print("MyHomeDataModel initializing...")
            theinstance = Persistance.loadUniqueId()
            return theinstance
        }
        //print("MyHomeDataModel returning...")
        return thisinstance
    }
    
    class func destroy() {
        //print("MyHomeDataModel destroying...")
        theinstance = nil
    }
    
    //Has to be internal/public. If nil returned, caller can use it to construct an instance.
    override init() {
        super.init()
        
        UniqueId.theinstance = self
    }
    
    var _sequenceid: Int = 0
    var sequenceid: Int {
        get {
            SystemUtils.synchronized(lock: self) {
                _sequenceid = _sequenceid + 1
                Persistance.save(uniqueid: self)
            }
            return _sequenceid
        }
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        _sequenceid <- map["_sequenceid"]
    }
    
}
