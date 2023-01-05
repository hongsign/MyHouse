//
//  UIDrawHelper.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-18.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIDrawHelper {
    
    static let instance = UIDrawHelper()
    
    private init() {
        
    }
    
    enum UIDrawType: String {
        case table
        case computer
        case game
        case number
        case tools
        case utility
        case cup
        case sofa
        case light
        case dressing
        case furniture
        case place
        case symbol
        case garden
    }
    
    let table = UIHelpersDrawTable()
    let computer = UIHelpersDrawComputer()
    let game = UIHelpersDrawGame()
    let number = UIHelpersDrawNumber()
    let tools = UIHelpersDrawTools()
    let utility = UIHelpersDrawUtilities()
    let cup = UIHelpersDrawCup()
    let sofa = UIHelpersDrawSofa()
    let light = UIHelpersDrawLight()
    let dressing = UIHelpersDrawDressing()
    let furniture = UIHelpersDrawFurniture()
    let place = UIHelpersDrawPlace()
    let symbol = UIHelpersDrawSymbol()
    let garden = UIHelpersDrawGarden()
    
    
}
