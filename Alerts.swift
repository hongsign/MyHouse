//
//  Alerts.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

class Alerts: Base {
    
    private static var theinstance: Alerts?
    
    class func instance() -> Alerts? {
        guard let thisinstance = theinstance else {
            //print("Alerts initializing...")
            theinstance = Persistance.loadAlerts()
            return theinstance
        }
        //print("Alerts returning...")
        return thisinstance
    }
    
    class func destroy() {
        //print("Alerts destroying...")
        theinstance = nil
    }
    
    override init() {
        super.init()
        
        alerts = [Alert]()
        
        Alerts.theinstance = self
    }
    
    required init?(map: Map) {
        fatalError("init(map:) has not been implemented")
    }
    
    var alerts: [Alert]!
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        alerts <- map["alerts"]
    }

    
}
