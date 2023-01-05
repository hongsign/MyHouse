//
//  UIPopupMenu.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-01-23.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

protocol UIPopupMenuDelegate {
    func Tap()
}

protocol UIPopupMenuItemDelegate {
    func Tap(itemid: Int)
}

class UIPopupMenuItem: UILabel {
    var delegate: UIPopupMenuItemDelegate?
    var itemid: Int = 0
    
    init(frame: CGRect, title: String, itemid: Int) {
        
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        text = title
        self.itemid = itemid
        
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Tap(_:))))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Tap(_ sender: UIView) {
        delegate?.Tap(itemid: itemid)
    }
}

class UIPopupMenu: UIView {
    
    var delegate: UIPopupMenuDelegate?
    
    var _radius: CGFloat = 0
    var radius: CGFloat {
        get { return _radius }
        set(newvalue) {
            _radius = newvalue
        }
    }
    
    var _listoficons: [String] = [String]()
    var listoficons: [String] {
        get { return _listoficons }
        set(newvalue) {
            _listoficons.removeAll()
            for s in newvalue {
                _listoficons.append(s)
            }
        }
    }
    
    var _listofmenuitemids: [Int] = [Int]()
    var listofmenuitemids: [Int] {
        get { return _listofmenuitemids }
        set(newvalue) {
            _listofmenuitemids.removeAll()
            for s in newvalue {
                _listofmenuitemids.append(s)
            }
        }
    }
    
    private let PI: CGFloat = CGFloat.pi
    private let radianofonepiece: CGFloat = CGFloat.pi / 4
    
    private let bordercolor: UIColor = .black
    private let borderwidth: CGFloat = 1
    
    private let itemtextcolor: UIColor = .black
    private let itembordercolor: UIColor = .black
    private let itemborderwidth: CGFloat = 1
    private let itemfillcolor: UIColor = .white
    
    private var radiusoficon: CGFloat = 0
    private var circlecenter: CGPoint = .zero
    private var startangle: CGFloat = 0
    private var endangle: CGFloat = 0
    private var startpoint: CGPoint = .zero
    private var endpoint: CGPoint = .zero
    //private var circlepath: UIBezierPath!
    
    private var centerofmenuitems: [CGPoint] = [CGPoint]()
    private var menuitems: [UIPopupMenuItem] = [UIPopupMenuItem]()
    
    init(frame: CGRect, radius: CGFloat? = nil, listoficons: [String]? = nil, listofmenuitemids: [Int]? = nil) {
        
        /*---------------------------------------------------------
         Resize frame to SQUARE
        -----------------------------------------------------------*/
        let w = frame.size.width > frame.size.height ? frame.size.height : frame.size.width
        let rect = CGRect(x: frame.origin.x, y: frame.origin.y, width: w, height: w)
        
        super.init(frame: rect)
        backgroundColor = .clear
        
        if let radi = radius {
            if radi > w / 2 {
                _radius = w / 2
            }
            else {
                _radius = radi
            }
        }
        
        if let listicons = listoficons {
            self.listoficons = listicons
        }
        if let listids = listofmenuitemids {
            self.listofmenuitemids = listids
        }
        
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapMenu(_:))))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        clearup()
        
        let count: CGFloat = CGFloat(listoficons.count)
        
        //let radians = radianofonepiece * count
        
        startangle = (16 - (4 + count)) * radianofonepiece / 2
        endangle = ( 12 + count) * radianofonepiece / 2
        //circlecenter = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        circlecenter.x = rect.size.width / 2
        circlecenter.y = rect.size.height / 2
        
        startpoint.x = circlecenter.x + radius * cos(startangle)
        startpoint.y = circlecenter.y + radius * sin(startangle)
        endpoint.x = circlecenter.x + radius * cos(endangle)
        endpoint.y = circlecenter.y + radius * sin(endangle)
        
        radiusoficon = radius * sin(radianofonepiece / 2) / (1 + sin(radianofonepiece / 2))
        
        let circlepath = UIBezierPath(arcCenter: circlecenter, radius: radius, startAngle: startangle, endAngle: endangle, clockwise: true)
        bordercolor.setStroke()
        circlepath.lineWidth = borderwidth
        circlepath.stroke()
        
        let startlinepath = UIBezierPath()
        bordercolor.setStroke()
        startlinepath.lineWidth = borderwidth
        startlinepath.move(to: circlecenter)
        startlinepath.addLine(to: startpoint)
        startlinepath.stroke()
        
        let endlinepath = UIBezierPath()
        bordercolor.setStroke()
        endlinepath.lineWidth = borderwidth
        endlinepath.move(to: circlecenter)
        endlinepath.addLine(to: endpoint)
        endlinepath.stroke()
        
        for num in 0..<listoficons.count {
            let n: CGFloat = CGFloat(num)
            //let thenum: Int = num + 1
            //let reminder = thenum % 2
            let angleoficon = startangle + radianofonepiece / 2 + n * radianofonepiece
            let r = radius - radiusoficon
            let centeroficon = CGPoint(x: circlecenter.x + r * cos(angleoficon), y: circlecenter.y + r * sin(angleoficon))
            centerofmenuitems.append(centeroficon)
            
            //let icon = UILabel(frame: CGRect(x: centeroficon.x - radiusoficon, y: centeroficon.y - radiusoficon, width: 2 * radiusoficon, height: 2 * radiusoficon))
            let menuitem = UIPopupMenuItem(frame: CGRect(x: circlecenter.x - radiusoficon, y: circlecenter.y - radiusoficon, width: 2 * radiusoficon, height: 2 * radiusoficon), title: listoficons[num], itemid: listofmenuitemids[num])
            menuitem.delegate = delegate as! UIPopupMenuItemDelegate?
            menuitem.font = menuitem.font.withSize(radiusoficon)
            menuitem.textColor = itemtextcolor
            menuitem.textAlignment = .center
            //icon.layer.borderColor = itembordercolor
            //icon.layer.borderWidth = itemborderwidth
            menuitem.adjustsFontSizeToFitWidth = true
            menuitems.append(menuitem)
            
            
            //let path = UIBezierPath(arcCenter: centeroficon, radius: radiusoficon, startAngle: 0, endAngle: 2 * PI, clockwise: true)
            //path.stroke()
            
            
            /*-------------------------------------------------------------------
             Draw an anminated cirle for each menu item
            ---------------------------------------------------------------------*/
            let path = UIBezierPath(arcCenter: centeroficon, radius: radiusoficon, startAngle: 0, endAngle: 2 * PI, clockwise: true)
            let circlelayer = CAShapeLayer()
            circlelayer.path = path.cgPath
            circlelayer.strokeColor = itembordercolor.cgColor
            circlelayer.fillColor = itemfillcolor.cgColor
            circlelayer.lineWidth = itemborderwidth
            circlelayer.strokeEnd = 0.0
            layer.addSublayer(circlelayer)
            animateCircleFull(circlelayer: circlelayer, duration: 1.0)
            
            addSubview(menuitem)
            
            moveView(view: menuitem, toPoint: centeroficon)
        }
        
    }
    
    private func clearup() {
        centerofmenuitems.removeAll()
        menuitems.removeAll()
        
        subviews.forEach( { $0.removeFromSuperview() } )
    }
    
    private func moveView(view: UIView, toPoint destination:CGPoint) {
        //Always animate on main thread
        //DispatchQueue.main.async (execute: {
        //Use UIView animation API
        UIView.animate(withDuration: 1.5, delay: 0.2,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.2,
                       options: UIViewAnimationOptions.allowAnimatedContent,
                       animations: { () ->
                        Void in
                        //do actual move
                        view.center = destination
        },
                       completion: nil)
        
        //})
    }
    
    private func animateCircleFull(circlelayer: CAShapeLayer, duration: TimeInterval) {
        CATransaction.begin()
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        circlelayer.strokeEnd = 1.0
        CATransaction.setCompletionBlock(nil)
        circlelayer.add(animation, forKey: "animateCircle")
        CATransaction.commit()
    }
    
    func TapMenu(_ sender: UIPopupMenu) {
        delegate?.Tap()
    }
    
}
