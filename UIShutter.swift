//
//  UIShutter.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-03.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIShutter: UIHouseViewBase {
    
    private let sizeofpadding: CGFloat = 12
    private let sizeofopenbanner: CGFloat = 50
    private let sizeofopenpadding: CGFloat = 10
    private let numberofopenbanner: CGFloat = 2
    
    enum ShutterState: String {
        case open
        case closed
    }
    
    var isanimationallowed: Bool = true
    var animationduration: Double = 2.0
    var originrect: CGRect = .zero
    var openrect: CGRect = .zero
    
    var _state: ShutterState = .closed
    var state: ShutterState {
        get { return _state }
        set(newvalue) {
            if newvalue != _state {
                _state = newvalue
                if isanimationallowed {
                    switch _state {
                    case .open:
                        openShutter()
                    case .closed:
                        closeShutter()
                    }
                }
                else {
                    reDisplay()
                }
            }
        }
    }
    
    var _numberofbanner: CGFloat = 3
    var numberofbanner: CGFloat {
        get { return _numberofbanner }
        set(newvalue) {
            if newvalue != _numberofbanner {
                _numberofbanner = newvalue
                if _state == .closed {
                    reDisplay()
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .shutter
        category = .article
        
        originrect.origin.x = frame.origin.x
        originrect.origin.y = frame.origin.y
        originrect.size.width = frame.size.width
        originrect.size.height = frame.size.height
        
        openrect.origin.x = frame.origin.x
        openrect.origin.y = frame.origin.y
        openrect.size.width = frame.size.width
        openrect.size.height = frame.size.height / 4
        
        clipsToBounds = true
        //layer.needsDisplayOnBoundsChange = true
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .shutter
        category = .article
        
        originrect.origin.x = frame.origin.x
        originrect.origin.y = frame.origin.y
        originrect.size.width = frame.size.width
        originrect.size.height = frame.size.height
        
        openrect.origin.x = frame.origin.x
        openrect.origin.y = frame.origin.y
        openrect.size.width = frame.size.width
        openrect.size.height = frame.size.height / 4
        
        clipsToBounds = true
        //layer.needsDisplayOnBoundsChange = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        layers.removeAll()
        
        let padding = rect.size.width * sizeofpadding / 100
        let widthofbanner = rect.size.width - 2 * padding
        let heightofbanner = rect.size.height / (numberofbanner * 2)
        
        //let heightofopenbanner = heightofbanner * sizeofopenbanner / 100
        //let heightofopenpadding = heightofbanner * sizeofopenpadding / 100
        
        let path = UIBezierPath()
        let banner = CAShapeLayer()
        banner.strokeColor = bordercolor.cgColor
        banner.lineWidth = heightofbanner
        for i in 0..<Int(numberofbanner) {
            let num = CGFloat(i)
            path.move(to: CGPoint(x: rect.origin.x + padding, y: rect.origin.y + heightofbanner + 2 * num * heightofbanner))
            path.addLine(to: CGPoint(x: rect.origin.x + padding + widthofbanner, y: rect.origin.y + heightofbanner + 2 * num * heightofbanner))
            banner.path = path.cgPath
            //layer.addSublayer(banner)
            layers.append(banner)
        }
        
        /*
         switch state {
         case .closed:
         let path = UIBezierPath()
         let banner = CAShapeLayer()
         banner.strokeColor = bordercolor.cgColor
         banner.lineWidth = heightofbanner
         for i in 0..<Int(numberofbanner) {
         let num = CGFloat(i)
         path.move(to: CGPoint(x: rect.origin.x + padding, y: rect.origin.y + heightofbanner + 2 * num * heightofbanner))
         path.addLine(to: CGPoint(x: rect.origin.x + padding + widthofbanner, y: rect.origin.y + heightofbanner + 2 * num * heightofbanner))
         banner.path = path.cgPath
         layer.addSublayer(banner)
         }
         case .open:
         let path = UIBezierPath()
         let banner = CAShapeLayer()
         banner.strokeColor = bordercolor.cgColor
         banner.lineWidth = heightofopenbanner
         for i in 0..<Int(numberofopenbanner) {
         let num = CGFloat(i)
         path.move(to: CGPoint(x: rect.origin.x + padding, y: rect.origin.y + heightofbanner + num * (heightofopenbanner + heightofopenpadding)))
         path.addLine(to: CGPoint(x: rect.origin.x + padding + widthofbanner, y: rect.origin.y + heightofbanner + num * (heightofopenbanner + heightofopenpadding)))
         banner.path = path.cgPath
         layer.addSublayer(banner)
         }
         }
         */

    }
    
    func closeShutter() {
        UIView.animate(withDuration: animationduration, animations: {
            self.frame = self.originrect
            self.layoutIfNeeded()
        })
    }
    
    func openShutter() {
        UIView.animate(withDuration: animationduration, animations: {
            self.frame = self.openrect
            self.layoutIfNeeded()
        })
    }
    
}
