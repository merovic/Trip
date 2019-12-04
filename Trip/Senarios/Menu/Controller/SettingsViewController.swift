//
//  SettingsViewController.swift
//  Trip
//
//  Created by Mustafa on 12/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import BEMCheckBox

@available(iOS 13.0, *)
class SettingsViewController: UIViewController {

    @IBOutlet weak var arChk: BEMCheckBox!
    @IBOutlet weak var enChk: BEMCheckBox!
    
    @IBOutlet weak var onOffLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func arEnLangChk(_ sender: BEMCheckBox) {
        if sender.tag == 1 {
                 arChk.on = false
                  
              } else {
            enChk.on = false
                 
              }
    }
    @IBAction func menuBtnPreseed(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
                   present(vc!, animated: true, completion: nil)
    }
    
    
    @IBAction func onOffSwitchPressed(_ sender: UISwitch) {
        if sender.isOn {
            onOffLbl.text = "On"
        }else {
             onOffLbl.text = "Off"
        }
    }
    
    
    
}
