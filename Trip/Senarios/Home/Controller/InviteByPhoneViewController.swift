//
//  InviteByPhoneViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class InviteByPhoneViewController: UIViewController {

    @IBOutlet weak var inviteBut: UIButton!
    @IBOutlet weak var phone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func invitePressed(_ sender: UIButton) {
        if let phone = phone.text {
            Alert.show("success", massege: "invitaion will be sent to this number \(phone)", context: self)
        }
    }
}
