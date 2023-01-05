//
//  File.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-01-27.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

typealias UIRect = (x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat)

protocol UIHouseViewFocusDelegate {
    func focusIn(view: UIHouseViewBase, superview: UIView)
}

enum UIHorizontalDirection: String {
    case left
    case right
}

enum UIVerticalDirection: String {
    case up
    case down
}

enum UIHouseViewId: String {
    case gutter
    case downspout
    case chimney
    case window
    case door
    case fence
    case car
    case garagedoor
    case shutter
    case roof
    case siding
    case wall
    case insulation
    
    case room
    case bedroom
    case bathroom
    case attic
    case cinema
    case den
    case laundry
    case kitchen
    case familyroom
    case equipmentroom
    case sunroom
    case hall
    case study
    case diningroom
    case pantry
    case office
    case hallway
    case recreationroom
    case workshop
    case utilityroom
    case lounge
    case livingroom
    case dressingroom
    
    case place
    case deck
    case backyard
    case frontyard
    case driveway
    case garage
    case closet
    case elevator
    case patio
    case stair
    case cellar
    case pool
    case porch
    case balcony
    
    case house
    
}

enum UIHouseViewCategory: String {
    case article
    case room
    case place
    case storey
}

class UIHouseViewBase: UIView, CAAnimationDelegate {
    
    internal var infocusopactity: Float {
        get { return 0.9 }
    }
    internal var outfocusopacity: Float {
        get { return 0.5 }
    }
    internal var appearduration: Double {
        get { return 0.5 }
    }
    internal var strokeduration: Double {
        get { return 2.0 }
    }
    internal var islabelrequiredfordisplayname: Bool {
        get { return true }
    }
    
    internal var category: UIHouseViewCategory = .article
    
    /*-------------------------------------------------------
     model object id that associated to this UIView
    ---------------------------------------------------------*/
    var modelids: [Int] = [Int]()
    /*-------------------------------------------------------
     unique UIView id
     ---------------------------------------------------------*/
    var _containerid: Int = 0
    var containerid: Int {
        get { return _containerid }
        set(newvalue) {
            _containerid = newvalue
            tag = newvalue
        }
    }
    
    var delegate: UIHouseViewFocusDelegate?
    
    var _viewid: UIHouseViewId = .deck
    var viewid: UIHouseViewId {
        get { return _viewid }
        set(newvalue) {
            _viewid = newvalue
            displayname = _viewid.rawValue
            //tag = UIHouseViewID.getId()
        }
    }
    var displayname: String = ""
    
    var _borderwidth: CGFloat = 1
    var borderwidth: CGFloat {
        get { return _borderwidth }
        set(newvalue) {
            if newvalue != _borderwidth {
                _borderwidth = newvalue
                reDisplay()
            }
        }
    }
    
    var _bordercolor: UIColor = .black
    var bordercolor: UIColor {
        get { return _bordercolor }
        set(newvalue) {
            if newvalue != _bordercolor {
                _bordercolor = newvalue
                reDisplay()
            }
        }
    }
    
    var _fillcolor: UIColor = .lightGray
    var fillcolor: UIColor {
        get { return _fillcolor }
        set(newvalue) {
            if newvalue != _fillcolor {
                _fillcolor = newvalue
                reDisplay()
            }
        }
    }
    
    var _bgcolor: UIColor = .white
    var bgcolor: UIColor {
        get { return _bgcolor }
        set(newvalue) {
            if newvalue != _bgcolor {
                _bgcolor = newvalue
                reDisplay()
            }
        }
    }
    
    var hasfocus: Bool = false
    
    internal var layers: [CAShapeLayer] = [CAShapeLayer]()
    internal var animatelayer: CAShapeLayer = CAShapeLayer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.opacity = outfocusopacity
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapToGetFocus(_:))))
        
        addAnimation(rect: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
    }
    
    init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame)
        layer.opacity = outfocusopacity
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapToGetFocus(_:))))
        
        self.delegate = delegate
        
        addAnimation(rect: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        removeSublayers()
        addSublayers()
    }
    
    func reDisplay() {
        drawLayers(rect: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        setNeedsDisplay()
    }
    
    func drawLayers(rect: CGRect){
        //all subclasses must override
    }
    
    func removeSublayers() {
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        animatelayer.sublayers?.forEach{ $0.removeFromSuperlayer() }
    }
    
    func addSublayers() {
        for i in 0..<layers.count {
            animatelayer.addSublayer(layers[i])
        }
        layer.addSublayer(animatelayer)
    }
    
    func addAnimation(rect: CGRect) {
        layers.removeAll()
        drawLayers(rect: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        animateStroke()
        animateAppearance()
        addSublayers()
    }
    
    func animateStroke() {
        let end = CABasicAnimation(keyPath: "strokeEnd")
        end.toValue = 1.0
        end.duration = strokeduration
        end.delegate = self
        end.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        end.fillMode = kCAFillModeForwards
        end.isRemovedOnCompletion = false
        end.autoreverses = false
        //shape.add(end, forKey: "strokeEnd")
        for i in 0..<layers.count {
            layers[i].strokeEnd = 0
            layers[i].add(end, forKey: "strokeEnd")
        }
    }
    
    func animateAppearance() {
        let appear = CABasicAnimation(keyPath: "opacity")
        appear.fromValue = 0.1
        appear.toValue = outfocusopacity
        appear.duration = appearduration
        appear.fillMode = kCAFillModeBackwards
        
        for (index, shape) in layers.enumerated() {
            appear.beginTime = CACurrentMediaTime() + TimeInterval(Double(index) * appearduration)
            shape.add(appear, forKey: "opacity")
        }
        
    }
    
    func TapToGetFocus(_ sender: UITapGestureRecognizer) {
        delegate?.focusIn(view: sender.view as! UIHouseViewBase, superview: superview!)
    }
    
    func foucsIn() {
        layer.opacity = infocusopactity
        hasfocus = true
    }
    
    func focusOut() {
        layer.opacity = outfocusopacity
        hasfocus = false
    }
    
    /* don't know why. it does not work.
     
    override var canBecomeFocused: Bool {
        return true
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        print("didUpdateFocus")
        if context.nextFocusedView == self {
            
            coordinator.addCoordinatedAnimations({ () -> Void in
                print("Focus IN")
                self.layer.opacity = self.infocusopactity
                self.setNeedsDisplay()
                self.delegate?.focusIn(view: self)
            }, completion: nil)
        }
        else if context.previouslyFocusedView == self {
            coordinator.addCoordinatedAnimations({ () -> Void in
                print("Focus OUT")
                self.layer.opacity = self.outfocusopacity
                self.setNeedsDisplay()
                self.delegate?.focusOut(view: self)
            }, completion: nil)
        }
    }
     */
    
}
