//
//  RegisterViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import BEMCheckBox
class RegisterViewController: UIViewController {

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordComfirmTF: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var ownerOrTenant: BEMCheckBox!
    
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var attachBut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func attachBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
    }
    

}
