//
//  UIStorey.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-22.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit



class UIStorey: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let row: Int = 1
    var col: Int = 0
    
    private let icons: [UnicodeIcon.UnicodeIconKey] = [UnicodeIcon.UnicodeIconKey.ArrowLeft, UnicodeIcon.UnicodeIconKey.ArrowRight]
    
    private var viewids: [UIHouseViewId] = [UIHouseViewId]()
    
    internal var category: UIHouseViewCategory {
        get { return .storey }
    }
    
    /*-------------------------------------------------------
     unique UIView id
     ---------------------------------------------------------*/
    var containerid: Int = 0
    var position: StoreyPostion = (col: 0, floornumber: 0)
    
    var focusdelegate: UIHouseViewFocusDelegate?
    var celldelegate: UIStoreyCellDelegate?
    
    
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, focusdelegate: UIHouseViewFocusDelegate, celldelegate: UIStoreyCellDelegate? = nil) {
        
        super.init(frame: frame, collectionViewLayout: layout)
        self.focusdelegate = focusdelegate
        self.celldelegate = celldelegate
        
        dataSource = self
        delegate = self
        register(UIStoreyCell.self, forCellWithReuseIdentifier: "UIStoreyCell")
        backgroundColor = .clear
        
        
        //print("width: " + String(describing: contentSize.width) + " height: " + String(describing: contentSize.height))
        
        //let l = self.collectionViewLayout as! UICollectionViewFlowLayout
        
        //print("layout width: " + String(describing: l.itemSize.width) + " height: " + String(describing: l.itemSize.height))
    }
    
    /*
    init(frame: CGRect, style: UITableViewStyle, focusdelegate: UIHouseViewFocusDelegate? = nil, celldelegate: UIStoreyCellDelegate? = nil) {
        super.init(frame: frame, style: style)
        
        self.focusdelegate = focusdelegate
        self.celldelegate = celldelegate
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func append(viewid: UIHouseViewId) {
        
        //let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        //let cell = UIStroreyCell(frame: CGRect(x: 0, y: 0, width: layout.itemSize.width, height: layout.itemSize.height))
        
        viewids.append(viewid)
        col = col + 1
        let newindex = IndexPath(item: col - 1, section: row - 1)
        //reloadData()
        insertItems(at: [newindex])
        
    }
    
    func remove(at col: Int) {
        if self.col >= col {
            viewids.remove(at: col-1)
            
            //reloadData()
            let indexPath = IndexPath(item: col - 1, section: row - 1)
            self.col = self.col - 1
            performBatchUpdates({
                self.deleteItems(at: [indexPath])
            }, completion: {
                (finished: Bool) in
                //self.reloadItems(at: self.indexPathsForVisibleItems)
                //print("delete finished")
                return
            })
            
        }
    }

    func move(from col: Int, to direction: UIHorizontalDirection) {
        var from: IndexPath!
        var to: IndexPath!
        var canmove: Bool = false
        switch direction {
        case .left:
            if col == 1 {
                //first item, can't move left
                break
            }
            from = IndexPath(item: col - 1, section: row - 1)
            to = IndexPath(item: col - 1 - 1, section: row - 1)
            canmove = true
        case .right:
            if col == self.col {
                //last item, can't move right
                break
            }
            from = IndexPath(item: col - 1, section: row - 1)
            to = IndexPath(item: col - 1 + 1, section: row - 1)
            canmove = true
        }
        if canmove {
            performBatchUpdates({
                self.moveItem(at: from, to: to)
            }, completion: {
                (finished: Bool) in
                //self.reloadItems(at: self.indexPathsForVisibleItems)
                //print("delete finished")
                return
            })
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return row
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return col
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UIStoreyCell = dequeueReusableCell(withReuseIdentifier: "UIStoreyCell", for: indexPath) as! UIStoreyCell
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        cell.frame.size = CGSize(width: layout.itemSize.width, height: layout.itemSize.height)
        cell.initialize(viewid: viewids[indexPath.section], focusdelegate: focusdelegate!, delegate: celldelegate, icons: icons)
        
        return cell
    }
    
}
