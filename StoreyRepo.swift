//
//  StoreyRepo.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-03.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper

typealias StoreyRepoIndex = (
    id: Int,
    position: StoreyPostion
)

class StoreyRepo: RepoBase {
    
    override init() {
        super.init()
        
        indexes = [StoreyRepoIndex]()
        storeys = [Storey]()
        
        repotype = .storey
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        storeys <- map["storeys"]
        indexes <- map["indexes"]
    }
    
    var indexes: [StoreyRepoIndex]!
    var storeys: [Storey]!
    
    func add(index: StoreyRepoIndex) {
        let storey = Storey()
        storey.id = index.id
        storey.position = index.position
        storeys.append(storey)
        
        indexes.append(index)
        
        isdirty = true
    }
    
    func remove(index: StoreyRepoIndex) {
        let ind = getArrayIndex(index: index)
        if ind >= 0 {
            storeys.remove(at: ind)
            indexes.remove(at: ind)
            isdirty = true
        }
    }
    
    func get(index: StoreyRepoIndex) -> Storey? {
        for s in storeys {
            if s.id == index.id {
                return s
            }
        }
        return nil
    }
    
    private func getArrayIndex(index: StoreyRepoIndex) -> Int {
        var ind: Int = 0
        for s in storeys {
            if s.id == index.id {
                return ind
            }
            ind = ind + 1
        }
        return -1
    }
}
