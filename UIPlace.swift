//
//  UIPlace.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-18.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIPlace: UIHouseViewBase {
    
    var position: PlacePosition = (storeyid: 0, positionid: 0, yardid: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .place
        category = .place
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .place
        category = .place
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawLayers(rect: CGRect) {
        super.drawLayers(rect: rect)
    }

    
}
