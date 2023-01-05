//
//  UITabView.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-29.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

class UITabView: UIView {
    
    var focuscolor: UIColor {
        get { return UIColor.black }
    }
    
    var unfocuscolor: UIColor {
        get { return UIColor.lightGray }
    }
    
    var _tabindex: Int = 0
    var tabindex: Int {
        get { return _tabindex }
        set(newvalue) {
            if newvalue != _tabindex && newvalue < tabs.count {
                _tabindex = newvalue
                highlightTitle(index: _tabindex)
                setNeedsDisplay()
            }
        }
    }
    
    var titles: [UILabel] = [UILabel]()
    var tabs: [UIView] = [UIView]()
    
    private let padding: CGFloat = 5
    private let sizeoftitleheight: CGFloat = 15
    private let sizeoftitlefontsize: CGFloat = 70
    
    private var titlefontsize: CGFloat = 0
    
    var titlerect: CGRect = .zero
    var viewrect: CGRect = .zero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titlerect.origin.x = 0
        titlerect.origin.y = 0
        titlerect.size.width = frame.size.width
        titlerect.size.height = frame.size.height * sizeoftitleheight / 100
        
        titlefontsize = titlerect.size.height * sizeoftitlefontsize / 100
        
        viewrect.origin.x = 0
        viewrect.origin.y = titlerect.size.height
        viewrect.size.width = frame.size.width
        viewrect.size.height = frame.size.height - titlerect.size.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        removeSubview()
        
        initHighlightTitle()
        
        for t in titles {
            addSubview(t)
        }
        addSubview(tabs[tabindex])
    }
    
    func add(title: String, tab: UIView) {
        
        let label = UILabel(frame: .zero)
        label.font = label.font.withSize(titlefontsize)
        
        let width = title.widthOfString(usingFont: label.font)
        let i: Int = titles.count
        
        var labelrect: CGRect = .zero
        
        if i > 0 {
            labelrect.origin.x = titles[i-1].frame.origin.x + titles[i-1].frame.size.width + padding
        }
        else {
            labelrect.origin.x = padding
        }
        labelrect.origin.y = titlerect.origin.y
        labelrect.size.width = width + 2 * padding
        labelrect.size.height = titlerect.size.height
        label.frame = labelrect
        
        label.text = title
        label.textAlignment = .center
        label.textColor = unfocuscolor
        label.highlightedTextColor = focuscolor
        label.isHighlighted = false
        
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Tap(_:))))
        
        titles.append(label)
        tabs.append(tab)
    }
    
    func Tap(_ sender: UITapGestureRecognizer) {
        
        guard let index = titles.index(of: sender.view! as! UILabel) else {
            return
        }
        
        tabindex = index
    }
    
    /*
    func remove(at index: Int) {
        if index < tabs.count {
            titles.remove(at: index)
            tabs.remove(at: index)
        }
    }
    
    func clear() {
        titles.removeAll()
        tabs.removeAll()
    }
    */
    
    private func highlightTitle(index: Int) {
        
        for i in 0..<titles.count {
            if i == index {
                titles[i].isHighlighted = true
            }
            else {
                titles[i].isHighlighted = false
            }
        }
        
    }
    
    private func initHighlightTitle() {
        if titles.count > 0 {
            for t in titles {
                if t.isHighlighted {
                    return
                }
            }
            titles[0].isHighlighted = true
        }
    }
    
}
