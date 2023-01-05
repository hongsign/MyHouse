//
//  HouseRepo.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-01.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import ObjectMapper



typealias HouseRepoIndex = (
    repotype: HouseRepoType,
    storeyrepoindex: StoreyRepoIndex?,
    roomrepoindex: RoomRepoIndex?,
    placerepoindex: PlaceRepoIndex?,
    articlerepoindex: ArticleRepoIndex?
)

class HouseRepo: RepoBase {
    
    override var isdirty: Bool {
        get {
            if storey.isdirty || room.isdirty || place.isdirty || article.isdirty {
                return true
            }
            else {
                return false
            }
        }
        set(newvalue) {
            self.isdirty = newvalue
        }
    }
    
    override init() {
        super.init()
        
        storey = StoreyRepo()
        room = RoomRepo()
        place = PlaceRepo()
        article = ArticleRepo()
        
        repotype = .house
        
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        storey <- map["storey"]
        room <- map["room"]
        place <- map["place"]
        article <- map["article"]
    }
    
    var storey: StoreyRepo!
    var room: RoomRepo!
    var place: PlaceRepo!
    var article: ArticleRepo!
    
    func add(index: HouseRepoIndex) {
        switch index.repotype {
        case .storey: storey.add(index: index.storeyrepoindex!)
        case .room: room.add(index: index.roomrepoindex!)
        case .place: place.add(index: index.placerepoindex!)
        case .article: article.add(index: index.articlerepoindex!)
            
        case .house: break
        }
    }
    
    func remove(index: HouseRepoIndex) {
        switch index.repotype {
        case .storey: storey.remove(index: index.storeyrepoindex!)
        case .room: room.remove(index: index.roomrepoindex!)
        case .place: place.remove(index: index.placerepoindex!)
        case .article: article.remove(index: index.articlerepoindex!)
            
        case .house: break
        }
    }
    
    func get(index: HouseRepoIndex) -> Base? {
        switch index.repotype {
        case .storey: return storey.get(index: index.storeyrepoindex!)
        case .room: return room.get(index: index.roomrepoindex!)
        case .place: return place.get(index: index.placerepoindex!)
        case .article: return article.get(index: index.articlerepoindex!)
            
        case .house: return nil
        }
    }
    
}
