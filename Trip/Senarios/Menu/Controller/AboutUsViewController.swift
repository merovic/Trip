//
//  AboutUsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 1/12/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit
import SideMenu
class AboutUsViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "About Us".localized
    }
    
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController") as! SideMenuNavigationController
            vc.settings = Shared.settings(view: self.view)
            present(vc, animated: true, completion: nil)
        }
    }

}
