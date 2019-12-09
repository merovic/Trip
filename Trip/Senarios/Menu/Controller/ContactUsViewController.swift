//
//  ContactUsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import SideMenu

@available(iOS 13.0, *)
class ContactUsViewController: UIViewController {
    
    @IBOutlet weak var sendBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: sendBut)
        }
    }
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var site: UILabel!
    @IBOutlet weak var fax: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func menuBtnPreseed(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController") as! SideMenuNavigationController
        vc.settings = Shared.settings(view: self.view)
        present(vc, animated: true, completion: nil)
    }
}
