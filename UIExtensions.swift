//
//  UIExtensions.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-13.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    func inverse () -> UIColor {
        var r:CGFloat = 0.0; var g:CGFloat = 0.0; var b:CGFloat = 0.0; var a:CGFloat = 0.0;
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: 1.0-r, green: 1.0 - g, blue: 1.0 - b, alpha: a)
        }
        return self
    }
}

extension UIView {
    func removeViewFromSubview(tag: Int) {
        if let _viewwithtag = viewWithTag(tag) {
            _viewwithtag.removeFromSuperview()
        }
    }
    
    func removeSubview() {
        subviews.forEach{ $0.removeFromSuperview() }
    }
}

//UIStorey (1 row, multi cols)
extension UICollectionView {
    func setItemsInRow(num: Int) {
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            let inset = self.contentInset
            let n = CGFloat(num)
            let innerspace = layout.minimumInteritemSpacing * (n - 1.0)
            let insetspace = inset.left + inset.right + layout.sectionInset.left + layout.sectionInset.right
            let verticalinsetspace = inset.top + inset.bottom + layout.sectionInset.top + layout.sectionInset.bottom
            let width = floor((frame.size.width - insetspace - innerspace) / n)
            layout.itemSize = CGSize(width: width, height: frame.size.height - verticalinsetspace)
        }
    }
}
