//
//  ForgotPasswordViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var mailTF: UITextField!{
        didSet{
            mailTF.delegate = self
        }
    }
    @IBOutlet weak var submitBtn: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: submitBtn)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        if mailTF.text != nil , mailTF.text!.count > 4 {
            DispatchQueue.main.async { [weak self] in
                APIClient.forgete_password_by_email(email: (self?.mailTF.text)!) { (Result) in
                    switch Result {
                    case .success(let respnse):
                        print(respnse)
                        Alert.show("Success", massege: "password changed Successfuly", context: self!)
                        self?.dismiss(animated: true, completion: nil)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        } else if mailTF.text!.count < 4 {
            Alert.show("Error", massege: "please enter valid email", context: self)
        }
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
