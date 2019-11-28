//
//  LogInViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var logInBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: logInBut)
        }
    }
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func forgotPassPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
    }
    
}
