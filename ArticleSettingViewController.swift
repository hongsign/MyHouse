//
//  ArticleSettingViewController.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-03-22.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation
import UIKit
import DropDown

class ArticleSettingViewController: UIViewController {
    
    var articlerepoindex: ArticleRepoIndex!
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    var yearlabel: UILabel!
    var year: UICustomTextField!
    var powertypelabel: UILabel?
    var powertype: DropDown?
    var type1label: UILabel?
    var type1: DropDown?
    var type2label: UILabel?
    var type2: DropDown?
    var typedescriptionlabel: UILabel?
    var typedescription: UILabel?
    var lifespanlabel1: UILabel!
    var lifespanlabel2: UILabel!
    var lifespanwarn: UILabel!
    var lifespanalarm: UILabel!
    
    var maintenanceoptionlabel: UILabel?
    var maintenanceoption: UISwitch?
    var maintenancelabel1: UILabel?
    var maintenancelabel2: UILabel?
    var maintenancewarn: UILabel?
    var maintenancealarm: UILabel?
    
    var articleinfohead: [UILabel]!
    var articleinfotable: [UILabel : [UIStarRating]]!
    
    var tabview: UITabView!
    
    override func viewDidLoad() {
         super.viewDidLoad()
    }
    
    private func initTabview() {
        
    }
    
    private func initSettingTab() {
        
    }
    
    private func initMaintainTab() {
        
    }
    
    private func initInfoTab() {
        
    }

    
}

extension ArticleSettingViewController: CustomDialogView {
    
    func getDialogSize() -> CGSize {
        return CGSize(width: width, height: height)
    }
    
    func setupDialogView(dialogview: UIView, dialogsize: CGSize) {
        
    }
    
    func validate() -> Bool {
        /*------------------------
         No validation rules so far
         --------------------------*/
        return true
    }
    
    func populate() {
        
    }

}

