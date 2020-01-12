//
//  ForgotPasswordViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ForgotPasswordViewController: UIViewController, NVActivityIndicatorViewable{
    
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
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        self.startAnimating()
        if mailTF.text != nil , mailTF.text!.count > 4 {
            DispatchQueue.main.async { [weak self] in
                APIClient.forgete_password_by_email(email: (self?.mailTF.text)!) { (Result) in
                    switch Result {
                    case .success(let respnse):
                        print(respnse)
                        self?.stopAnimating()
                        Alert.show("Success".localized, massege: "Password Changed Successfully".localized, context: self!)
                        self?.dismiss(animated: true, completion: nil)
                    case .failure(let error):
                        print(error.localizedDescription)
                        self?.stopAnimating()
                        Alert.show("Failed".localized, massege: "This Email Doesn't Exist".localized, context: self!)
                    }
                }
            }
        } else if mailTF.text!.count < 4 {
            self.stopAnimating()
            Alert.show("Error".localized, massege: "Please Enter Valid Email".localized, context: self)
        }
        
    }
    
    //MARK:- back to Login
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
