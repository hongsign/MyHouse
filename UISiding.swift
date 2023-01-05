//
//  UISiding.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-06.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UISiding: UIHouseViewBase {
    
    private let sizeofpadding: CGFloat = 3
    private let sizeofcutoff: CGFloat = 12
    
    var _numberofbanners: CGFloat = 3
    var numberofbanners : CGFloat {
        get { return _numberofbanners }
        set(newvalue) {
            if newvalue != _numberofbanners {
                _numberofbanners = newvalue
                reDisplay()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .siding
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .siding
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        layers.removeAll()
        
        let path = UIBezierPath()
        let banner = CAShapeLayer()
        banner.fillColor = fillcolor.cgColor
        banner.strokeColor = bordercolor.cgColor
        banner.lineWidth = borderwidth
        banner.lineJoin = kCALineJoinRound
        
        for i in 0..<Int(numberofbanners) {
            let points = getPointsOfBanners(rect: rect, num: i)
            path.move(to: points[0])
            for j in 1..<points.count {
                path.addLine(to: points[j])
            }
            path.close()
            banner.path = path.cgPath
            layers.append(banner)
        }
        
    }
    
    private func getPointsOfBanners(rect: CGRect, num: Int) -> [CGPoint] {
        
        let padding: CGFloat = rect.size.height * sizeofpadding / 100
        let cutoff: CGFloat = rect.size.width * sizeofcutoff / 100
        
        let bannerheight: CGFloat = (rect.size.height - (numberofbanners + 1) * padding) / numberofbanners
        
        let x11: CGFloat = rect.origin.x + padding + cutoff
        let x12: CGFloat = rect.origin.x + rect.size.width - padding - cutoff
        let x21: CGFloat = rect.origin.x + padding
        let x22: CGFloat = rect.origin.x + rect.size.width - padding
        
        let n = CGFloat(num)
        let y1: CGFloat = rect.origin.y + (n + 1) * padding + n * bannerheight
        let y2: CGFloat = rect.origin.y + (n + 1) * padding + (n + 1) * bannerheight
        
        var points: [CGPoint] = [CGPoint]()
        
        points.append(CGPoint(x: x11, y: y1))
        points.append(CGPoint(x: x12, y: y1))
        points.append(CGPoint(x: x22, y: y2))
        points.append(CGPoint(x: x21, y: y2))
        
        return points
    }
    
}
