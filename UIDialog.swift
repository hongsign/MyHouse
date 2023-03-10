//
//  UIDialog.swift
//  NumberGame
//
//  Created by Jerry Hong on 2016-12-03.
//  Copyright © 2016 Jerry Hong. All rights reserved.
//

import Foundation
import UIKit

private extension Selector {
    static let buttonTapped = #selector(UIDialog.buttonTapped)
    static let deviceOrientationDidChange = #selector(UIDialog.deviceOrientationDidChange)
}

/*---------------------------------------------------------------------
 CustomDialogView protocol:
 All customized dialogs must implement this protocol.
 All funcs in this protocol are callbacks that UIDialog will call them to
 accommondate with custom settings, and return values to custom dialog.
 ----------------------------------------------------------------------*/
protocol CustomDialogView {
    /*----------------------------------------------------------
     Set up dialog size by customized dialog
     ------------------------------------------------------------*/
    func getDialogSize() -> CGSize
    
    /*----------------------------------------------------------
     Set up all customized UIViews in UIDialog
     ------------------------------------------------------------*/
    func setupDialogView(dialogview: UIView, dialogsize: CGSize)
    
    /*----------------------------------------------------------
     Validate user input when click Done button
     ------------------------------------------------------------*/
    func validate() -> Bool
    
    /*----------------------------------------------------------
     Populate values of custom views into data model
     ------------------------------------------------------------*/
    func populate()
}

open class UIDialog: UIView {
    public typealias UIDialogCallback = (Int) -> Void
    
    // MARK: - Constants
    private let DialogDefaultButtonHeight:       CGFloat = 50
    private let DialogDefaultButtonSpacerHeight: CGFloat = 1
    private let DialogCornerRadius:              CGFloat = 7
    
    static let DialogDoneButtonTag:             Int     = 1
    static let DialogCancelButtonTag:           Int     = 0
    
    // MARK: - Views
    private var dialogView:   UIView!
    private var titleLabel:   UILabel!
    private var cancelButton: UIButton!
    private var doneButton:   UIButton!
    
    private var customdialogview: CustomDialogView!
    private var dialogContainer: UIView!
    private var dialogSize: CGSize!
    
    // MARK: - Variables
    private var callback:       UIDialogCallback?
    
    // MARK: - Dialog initialization
    init(frame: CGRect, customdialogview: CustomDialogView) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        
        self.customdialogview = customdialogview
        dialogSize = customdialogview.getDialogSize()
        
        setupView()
        
        self.customdialogview.setupDialogView(dialogview: dialogContainer, dialogsize: dialogSize)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.dialogView = createContainerView()
        
        self.dialogView!.layer.shouldRasterize = true
        self.dialogView!.layer.rasterizationScale = UIScreen.main.scale
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        self.dialogView!.layer.opacity = 0.5
        self.dialogView!.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1)
        
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        self.addSubview(self.dialogView!)
    }
    
    /// Handle device orientation changes
    func deviceOrientationDidChange(_ notification: Notification) {
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let screenSize = countScreenSize()
        let dialogSize = CGSize(width: 300, height: 230 + DialogDefaultButtonHeight + DialogDefaultButtonSpacerHeight)
        dialogView.frame = CGRect(x: (screenSize.width - dialogSize.width) / 2, y: (screenSize.height - dialogSize.height) / 2, width: dialogSize.width, height: dialogSize.height)
    }
    
    /// Create the dialog view, and animate opening the dialog
    open func show(_ title: String, doneButtonTitle: String = "Done", cancelButtonTitle: String = "Cancel", callback: @escaping UIDialogCallback) {
        self.titleLabel.text = title
        self.doneButton.setTitle(doneButtonTitle, for: .normal)
        self.cancelButton.setTitle(cancelButtonTitle, for: .normal)
        self.callback = callback
        
        /* Add dialog to main window */
        guard let appDelegate = UIApplication.shared.delegate else { fatalError() }
        guard let window = appDelegate.window else { fatalError() }
        window?.addSubview(self)
        window?.bringSubview(toFront: self)
        window?.endEditing(true)
        
        NotificationCenter.default.addObserver(self, selector: .deviceOrientationDidChange, name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        /* Anim */
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
                self.dialogView!.layer.opacity = 1
                self.dialogView!.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
        )
    }
    
    /// Dialog close animation then cleaning and removing the view from the parent
    private func close() {
        NotificationCenter.default.removeObserver(self)
        
        let currentTransform = self.dialogView.layer.transform
        
        let startRotation = (self.value(forKeyPath: "layer.transform.rotation.z") as? NSNumber) as? Double ?? 0.0
        let rotation = CATransform3DMakeRotation((CGFloat)(-startRotation + Double.pi * 270 / 180), 0, 0, 0)
        
        self.dialogView.layer.transform = CATransform3DConcat(rotation, CATransform3DMakeScale(1, 1, 1))
        self.dialogView.layer.opacity = 1
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: [],
            animations: {
                self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                self.dialogView.layer.transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(0.6, 0.6, 1))
                self.dialogView.layer.opacity = 0
        }) { (finished) in
            for v in self.subviews {
                v.removeFromSuperview()
            }
            
            self.removeFromSuperview()
            self.setupView()
        }
    }
    
    /// Creates the container view here: create the dialog, then add the custom content and buttons
    private func createContainerView() -> UIView {
        
        let screenSize = countScreenSize()
        /*
         dialogSize = CGSize(
         width: 300,
         height: 230
         + DialogDefaultButtonHeight
         + DialogDefaultButtonSpacerHeight)
         */
        // For the black background
        self.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        
        // This is the dialog's container; we attach the custom content and the buttons to this one
        dialogContainer = UIView(frame: CGRect(x: (screenSize.width - dialogSize.width) / 2, y: (screenSize.height - dialogSize.height) / 2, width: dialogSize.width, height: dialogSize.height))
        
        // First, we style the dialog to match the iOS8 UIAlertView >>>
        let gradient: CAGradientLayer = CAGradientLayer(layer: self.layer)
        gradient.frame = dialogContainer.bounds
        gradient.colors = [UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1).cgColor,
                           UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1).cgColor,
                           UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1).cgColor]
        
        let cornerRadius = DialogCornerRadius
        gradient.cornerRadius = cornerRadius
        dialogContainer.layer.insertSublayer(gradient, at: 0)
        
        dialogContainer.layer.cornerRadius = cornerRadius
        dialogContainer.layer.borderColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1).cgColor
        dialogContainer.layer.borderWidth = 1
        dialogContainer.layer.shadowRadius = cornerRadius + 5
        dialogContainer.layer.shadowOpacity = 0.1
        dialogContainer.layer.shadowOffset = CGSize(width: 0 - (cornerRadius + 5) / 2, height: 0 - (cornerRadius + 5) / 2)
        dialogContainer.layer.shadowColor = UIColor.black.cgColor
        dialogContainer.layer.shadowPath = UIBezierPath(roundedRect: dialogContainer.bounds, cornerRadius: dialogContainer.layer.cornerRadius).cgPath
        
        // There is a line above the button
        let lineView = UIView(frame: CGRect(x: 0, y: dialogContainer.bounds.size.height - DialogDefaultButtonHeight - DialogDefaultButtonSpacerHeight, width: dialogContainer.bounds.size.width, height: DialogDefaultButtonSpacerHeight))
        lineView.backgroundColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        dialogContainer.addSubview(lineView)
        
        //Title
        self.titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 280, height: 30))
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        dialogContainer.addSubview(self.titleLabel)
        
        // Add the buttons
        addButtonsToView(container: dialogContainer)
        
        return dialogContainer
    }
    
    /// Add buttons to container
    private func addButtonsToView(container: UIView) {
        let buttonWidth = container.bounds.size.width / 2
        
        let leftButtonFrame = CGRect(
            x: 0,
            y: container.bounds.size.height - DialogDefaultButtonHeight,
            width: buttonWidth,
            height: DialogDefaultButtonHeight
        )
        let rightButtonFrame = CGRect(
            x: buttonWidth,
            y: container.bounds.size.height - DialogDefaultButtonHeight,
            width: buttonWidth,
            height: DialogDefaultButtonHeight
        )
        
        let interfaceLayoutDirection = UIApplication.shared.userInterfaceLayoutDirection
        let isLeftToRightDirection = interfaceLayoutDirection == .leftToRight
        
        self.cancelButton = UIButton(type: .custom) as UIButton
        self.cancelButton.frame = isLeftToRightDirection ? leftButtonFrame : rightButtonFrame
        self.cancelButton.setTitleColor(UIColor(red: 0, green: 0.5, blue: 1, alpha: 1), for: .normal)
        self.cancelButton.setTitleColor(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5), for: .highlighted)
        self.cancelButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14)
        self.cancelButton.layer.cornerRadius = DialogCornerRadius
        self.cancelButton.addTarget(self, action: .buttonTapped, for: .touchUpInside)
        container.addSubview(self.cancelButton)
        
        self.doneButton = UIButton(type: .custom) as UIButton
        self.doneButton.frame = isLeftToRightDirection ? rightButtonFrame : leftButtonFrame
        self.doneButton.tag = UIDialog.DialogDoneButtonTag
        self.doneButton.setTitleColor(UIColor(red: 0, green: 0.5, blue: 1, alpha: 1), for: .normal)
        self.doneButton.setTitleColor(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5), for: .highlighted)
        self.doneButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14)
        self.doneButton.layer.cornerRadius = DialogCornerRadius
        self.doneButton.addTarget(self, action: .buttonTapped, for: .touchUpInside)
        container.addSubview(self.doneButton)
    }
    
    func buttonTapped(sender: UIButton!) {
        if sender.tag == UIDialog.DialogDoneButtonTag {
            /*-----------------------------------------
             validate failed. can't close dialog.
             -------------------------------------------*/
            if !customdialogview.validate() { return }
            /*-----------------------------------------
             populate values from custom views to data model
             -------------------------------------------*/
            customdialogview.populate()
            
            self.callback?(UIDialog.DialogDoneButtonTag)
        } else {
            self.callback?(UIDialog.DialogCancelButtonTag)
        }
        
        close()
    }
    
    // MARK: - Helpers
    
    /// Count and return the screen's size
    func countScreenSize() -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        return CGSize(width: screenWidth, height: screenHeight)
    }
}

