//
//  ViewController.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-01-23.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var profileicon: UIUnicodeIcon!
    var articleicon: UIUnicodeIcon!
    var alarmicon: UIAlarmIcon!
    
    var housearclabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupTopbar()
        
        loadModel()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    private func loadModel() {
        
        if MyHouse.instance() != nil {
            
        }
        else {
            _ = MyHouse()
        }
        
        if UniqueId.instance() != nil {
            
        }
        else {
            _ = UniqueId()
        }
        
        if Storages.instance() != nil {
            
        }
        else {
            _ = Storages()
        }
        
        if Alerts.instance() != nil {
            
        }
        else {
            _ = Alerts()
        }
        
        if (MyHouse.instance()?.isfirsttime)! {
            //setup something
            housearclabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
            housearclabel.text = "House Arc Type:"
            view.addSubview(housearclabel)
        }
        
    }
    
    private func setupTopbar() {
        
        var rect: CGRect = .zero
        var count: CGFloat = 0
        
        count += 1
        rect.origin.x = UIDefinitions.screenwidth - count * UIDefinitions.topbariconpadding - count * UIDefinitions.topbarheight
        rect.origin.y = UIDefinitions.paddingtop
        rect.size.width = UIDefinitions.topbarheight
        rect.size.height = UIDefinitions.topbarheight
        
        articleicon = UIUnicodeIcon(frame: rect, key: .Setting1, size: UIDefinitions.topbarheight)
        articleicon.isUserInteractionEnabled = true
        articleicon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapArticleSetting(_:))))
        
        count += 1
        rect.origin.x = UIDefinitions.screenwidth - count * UIDefinitions.topbariconpadding - count * UIDefinitions.topbarheight
        profileicon = UIUnicodeIcon(frame: rect, key: .Setting, size: UIDefinitions.topbarheight)
        profileicon.isUserInteractionEnabled = true
        profileicon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapProfileSetting(_:))))
        
        count += 1
        rect.origin.x = UIDefinitions.screenwidth - count * UIDefinitions.topbariconpadding - count * UIDefinitions.topbarheight
        alarmicon = UIAlarmIcon(frame: rect)
        alarmicon.isUserInteractionEnabled = true
        alarmicon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapAlarmIcon(_:))))
        
        view.addSubview(articleicon)
        view.addSubview(profileicon)
        view.addSubview(alarmicon)
        
        let testbutton1 = UIButton(frame: CGRect(x: 0, y: 20, width: 50, height: 30))
        testbutton1.setTitle("Test1", for: .normal)
        testbutton1.setTitleColor(.black, for: .normal)
        testbutton1.addTarget(self, action: #selector(test1(_:)), for: .touchUpInside)
        view.addSubview(testbutton1)
        
        let testbutton2 = UIButton(frame: CGRect(x: 80, y: 20, width: 50, height: 30))
        testbutton2.setTitle("Test2", for: .normal)
        testbutton2.setTitleColor(.black, for: .normal)
        testbutton2.addTarget(self, action: #selector(test2(_:)), for: .touchUpInside)
        view.addSubview(testbutton2)
    }
    
    func test1(_ sender: UIButton) {
        
    }
    
    func test2(_ sender: UIButton) {
        if let houseviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HouseViewController") as? HouseViewController {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window?.rootViewController!.present(houseviewcontroller, animated: true, completion: nil)
        }
    }
    
    func TapArticleSetting(_ sender: UITapGestureRecognizer) {
        alarmicon.alarmnumber = 15
    }
    
    func TapProfileSetting(_ sender: UITapGestureRecognizer) {
        alarmicon.alarmnumber = 0
    }
    
    func TapAlarmIcon(_ sender: UITapGestureRecognizer) {

    }
    
}
