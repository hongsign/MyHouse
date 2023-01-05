//
//  SystemUtils.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-02.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation

class SystemUtils {
    
    class func synchronized(lock: AnyObject, closure:()->()) {
        objc_sync_enter(lock)
        closure()
        objc_sync_exit(lock);
    }
    
}
