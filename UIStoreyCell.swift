//
//  UIStroreyCell.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-02-22.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit

protocol UIStoreyCellDelegate {
    func tap(key: UnicodeIcon.UnicodeIconKey)
}

class UIStoreyCell: UICollectionViewCell {
    
    internal var hasIcon: Bool {
        get { return true }
    }
    
    private var sizeofpadding: CGFloat = 2
    private var sizeoficonheight: CGFloat = 0
    private var sizeofviewheight: CGFloat = 0
    private let sizeoficonsizeoficonheight: CGFloat = 80
    
    
    private var houseviewrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    private var iconrect: UIRect = (x: 0, y: 0, w: 0, h: 0)
    private var rect: CGRect = .zero
    private var toppadding: CGFloat = 0
    private var leftpadding: CGFloat = 0
    private var iconheight: CGFloat = 0
    private var iconsize: CGFloat = 0
    private var viewheight: CGFloat = 0
    
    var focusdelegate: UIHouseViewFocusDelegate?
    var delegate: UIStoreyCellDelegate?
    
    var houseview: UIHouseViewBase!
    var icons: Dictionary<UnicodeIcon.UnicodeIconKey, UIUnicodeIcon> = Dictionary<UnicodeIcon.UnicodeIconKey, UIUnicodeIcon>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /* UITableViewCell
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
     */
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        for view in contentView.subviews {
            view.removeFromSuperview()
        }
        removeSubview()
        houseview = nil
    }
    
    func initialize(viewid: UIHouseViewId, focusdelegate: UIHouseViewFocusDelegate, delegate: UIStoreyCellDelegate? = nil, icons: [UnicodeIcon.UnicodeIconKey]? = nil) {
        
        self.focusdelegate = focusdelegate
        
        if hasIcon {
            self.delegate = delegate
            sizeoficonheight = (100 - 3 * sizeofpadding) / 100 * 18
            sizeofviewheight = (100 - 3 * sizeofpadding) / 100 * 82
        }
        else {
            sizeoficonheight = 0
            sizeofviewheight = 100 - 2 * sizeofpadding
        }
        
        getRectsOfViews()
        
        rect = CGRect(x: houseviewrect.x, y: houseviewrect.y, width: houseviewrect.w, height: houseviewrect.h)
        houseview = UIHouseViewHelper.getHouseViewInstance(viewid: viewid, rect: rect, delegate: focusdelegate)
        addSubview(houseview)
        
        if hasIcon {
            guard let _icons = icons else {
                if self.icons.count > 0 {
                    setRectsOfIcons()
                    addIconsAsSubview()
                }
                return
            }
            self.icons.removeAll()
            for key in _icons {
                self.icons[key] = UIUnicodeIcon(frame: .zero, key: key, size: iconsize)
                self.icons[key]?.tag = key.hashValue
                self.icons[key]?.isUserInteractionEnabled = true
                self.icons[key]?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(iconTapped(_:))))
            }
            if self.icons.count > 0 {
                setRectsOfIcons()
                addIconsAsSubview()
            }
        }
    }
    
    func addIcon(key: UnicodeIcon.UnicodeIconKey) {
        if hasIcon {
            icons[key] = UIUnicodeIcon(frame: .zero, key: key, size: iconsize)
            icons[key]?.tag = key.hashValue
            icons[key]?.isUserInteractionEnabled = true
            icons[key]?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(iconTapped(_:))))
            setRectsOfIcons()
            addSubview(icons[key]!)
        }
    }
    
    func removeIcon(key: UnicodeIcon.UnicodeIconKey) {
        if hasIcon {
            if icons[key] != nil {
                icons.removeValue(forKey: key)
                removeViewFromSubview(tag: key.hashValue)
                if icons.count > 0 {
                    setRectsOfIcons()
                }
            }
        }
    }
    
    func removeAllIcons() {
        if hasIcon {
            for (key, _) in icons {
                removeViewFromSubview(tag: key.hashValue)
            }
            icons.removeAll()
        }
    }
    
    func iconTapped(_ sender: UITapGestureRecognizer) {
        delegate?.tap(key: ((sender.view as? UIUnicodeIcon)?.key)!)
    }
    
    private func getRectsOfViews() {
        
        let w = frame.size.width
        let h = frame.size.height
        
        leftpadding = w * sizeofpadding / 100
        toppadding = h * sizeofpadding / 100
        iconheight = h * sizeoficonheight / 100
        viewheight = h * sizeofviewheight / 100
        iconsize = iconheight * sizeoficonsizeoficonheight / 100
        
        if hasIcon {
            iconrect.x = leftpadding
            iconrect.y = toppadding
            iconrect.w = w - 2 * leftpadding
            iconrect.h = iconheight
        }
        
        //make view rect a square
        let x = leftpadding
        let y = toppadding + iconheight + toppadding
        let width = w - 2 * leftpadding
        var height: CGFloat = 0
        if hasIcon {
            height = h - 3 * toppadding - iconheight
        }
        else {
            height = h - 2 * toppadding
        }
        
        if width > height {
            houseviewrect.x = x + (width - height) / 2
            houseviewrect.y = y
            houseviewrect.w = height
            houseviewrect.h = height
        }
        else {
            houseviewrect.x = x
            houseviewrect.y = y + (height - width) / 2
            houseviewrect.w = width
            houseviewrect.h = width
        }
        
    }
    
    private func setRectsOfIcons() {
        
        var i: CGFloat = 1
        
        for (_, icon) in icons {
            icon.frame = CGRect(x: iconrect.x + iconrect.w - i * iconsize, y: iconrect.y, width: iconsize, height: iconsize)
            i = i + 1
        }
        
    }
    
    private func addIconsAsSubview() {
        for (_, icon) in icons {
            addSubview(icon)
        }
    }
    
}
