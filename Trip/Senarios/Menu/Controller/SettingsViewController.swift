//
//  SettingsViewController.swift
//  Trip
//
//  Created by Mustafa on 12/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import BEMCheckBox
import SideMenu
import MOLH
@available(iOS 13.0, *)
class SettingsViewController: UIViewController {
    
    @IBOutlet weak var arChk: BEMCheckBox!
    @IBOutlet weak var enChk: BEMCheckBox!
    @IBOutlet weak var onOffLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if "Lang".localized == "ar"{
            arChk.on = true
            enChk.on = false
        }else if "Lang".localized == "en" {
            arChk.on = false
            enChk.on = true
        }
    }
    
    @IBAction func arEnLangChk(_ sender: BEMCheckBox) {
        if sender.tag == 1 {
            arChk.on = false
            if MOLHLanguage.currentAppleLanguage() == "ar" {
                MOLH.setLanguageTo("en")
                MOLH.reset()
            }
        } else if sender.tag == 2 {
            enChk.on = false
            if MOLHLanguage.currentAppleLanguage() == "en" {
                MOLH.setLanguageTo("ar")
                MOLH.reset()
            }
        }
    }
    
    @IBAction func onOffSwitchPressed(_ sender: UISwitch) {
        if sender.isOn {
            onOffLbl.text = "On"
        }else {
            onOffLbl.text = "Off"
        }
    }
 
    @IBAction func menuBtnPreseed(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController") as! SideMenuNavigationController
        vc.settings = Shared.settings(view: self.view)
        present(vc, animated: true, completion: nil)
    }
}
