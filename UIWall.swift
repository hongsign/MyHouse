//
//  UIWall.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-06.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UIWall : UIHouseViewBase {
    
    private let sizeofbrickwidthofheight: CGFloat = 250
    private let sizeofbrickpaddingofheight: CGFloat = 18
    private let sizeofbrickradiusofheight: CGFloat = 8
    
    var _numberofrow: CGFloat = 10
    var numberofrow: CGFloat {
        get { return _numberofrow }
        set(newvalue) {
            if (newvalue != _numberofrow) {
                _numberofrow = newvalue
                reDisplay()
            }
        }
    }
    
    /*
    override var appearduration: Double {
        return 0.1
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        viewid = .wall
        category = .article
    }
    
    override init(frame: CGRect, delegate: UIHouseViewFocusDelegate) {
        super.init(frame: frame, delegate: delegate)
        backgroundColor = .clear
        viewid = .wall
        category = .article
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawLayers(rect: CGRect) {
        
        layer.borderWidth = 1
        layer.borderColor = bordercolor.cgColor
        
        layers.removeAll()
        
        let brickheight = rect.size.height / (numberofrow + (numberofrow + 1) * sizeofbrickpaddingofheight / 100)
        let brickwidth = brickheight * sizeofbrickwidthofheight / 100
        let brickpadding = brickheight * sizeofbrickpaddingofheight / 100
        let brickradius = brickheight * sizeofbrickradiusofheight / 100
        
        let row = Int(numberofrow)
        let col: Int = Int(rect.size.width / ((1 + brickpadding / brickwidth) * brickwidth)) + 1
        
        var r: CGRect = .zero
        r.size.width = brickwidth
        r.size.height = brickheight
        
        for i in 0..<row {
            let fi = CGFloat(i)
            let path = UIBezierPath()
            for j in 0..<col {
                let fj = CGFloat(j)
                
                if i % 2 > 0 {
                    
                    if j == 0 {
                        r.origin.x = rect.origin.x + (fj + 1) * brickpadding + fj * brickwidth / 2
                        r.size.width = brickwidth / 2
                    }
                    else {
                        r.origin.x = rect.origin.x + (fj + 1) * brickpadding + brickwidth / 2 + (fj - 1) * brickwidth
                        if (r.origin.x + brickwidth) > (rect.origin.x + rect.size.width) {
                            r.size.width = rect.origin.x + rect.size.width - r.origin.x
                            if r.size.width > brickpadding {
                                r.size.width = r.size.width - brickpadding
                            }
                            else {
                                break
                            }
                            //r.origin.x = rect.origin.x + (fj + 1) * brickpadding + brickwidth / 2 + (fj - 1) * brickwidth
                        }
                        else {
                            //r.origin.x = rect.origin.x + (fj + 1) * brickpadding + brickwidth / 2 + (fj - 1) * brickwidth
                            r.size.width = brickwidth
                        }
                    }
                }
                else {
                    r.origin.x = rect.origin.x + (fj + 1) * brickpadding + fj * brickwidth
                    if (r.origin.x + brickwidth) > (rect.origin.x + rect.size.width) {
                        r.size.width = rect.origin.x + rect.size.width - r.origin.x
                        if r.size.width > brickpadding {
                            r.size.width = r.size.width - brickpadding
                        }
                        else {
                            break
                        }
                        //r.origin.x = rect.origin.x + (fj + 1) * brickpadding + fj * brickwidth
                    }
                    else {
                        //r.origin.x = rect.origin.x + (fj + 1) * brickpadding + fj * brickwidth
                        r.size.width = brickwidth
                    }
                }
                r.origin.y = rect.origin.y + (fi + 1) * brickpadding + fi * brickheight
                
                path.append(UIBezierPath(roundedRect: r, cornerRadius: brickradius))
            }
            
            let brick = CAShapeLayer()
            brick.fillColor = fillcolor.cgColor
            brick.strokeColor = fillcolor.cgColor
            brick.lineWidth = borderwidth
            brick.path = path.cgPath
            layers.append(brick)
        }
        
    }
    
}
