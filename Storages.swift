//
//  Storage.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class Storages: Base {
    
    private static var theinstance: Storages?
    
    class func instance() -> Storages? {
        guard let thisinstance = theinstance else {
            //print("Storages initializing...")
            theinstance = Persistance.loadStorages()
            return theinstance
        }
        //print("Storages returning...")
        return thisinstance
    }
    
    class func destroy() {
        //print("Storages destroying...")
        theinstance = nil
    }
    
    override init() {
        super.init()
        
        items = [StorageItem]()
        
        Storages.theinstance = self
    }
    
    required init?(map: Map) {
        fatalError("init(map:) has not been implemented")
    }

    
    var items: [StorageItem]!
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        items <- map["items"]
    }
    
}
