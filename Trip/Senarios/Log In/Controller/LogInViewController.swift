//
//  LogInViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class LogInViewController: UIViewController{

    @IBOutlet weak var logInBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: logInBut)
        }
    }
    @IBOutlet weak var passwordTF: UITextField!{didSet{ passwordTF.delegate = self }}
    @IBOutlet weak var mailTF: UITextField!{didSet{ mailTF.delegate = self }}
    @IBOutlet weak var fbBut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        if mailTF.text != nil , passwordTF.text != nil , mailTF.text != "" , passwordTF.text != ""   {
            DispatchQueue.main.async { [weak self ] in
                APIClient.logIn(email: self?.mailTF.text ?? "", password: self?.passwordTF.text ?? "") { (Result) in
                    switch Result {
                    case .success(let response):
                        print(response)
                        self?.performSegue(withIdentifier: "Log In", sender: self)
                    case .failure(let error):
                        print(error.localizedDescription)
                        Alert.show("Failed", massege: error.localizedDescription, context: self!)
                    }
                }
            }
        }
        else {
            Alert.show("Error", massege: "Enter email and Password", context: self)
        }
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(identifier: "Register") as? RegisterViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func forgotPassPressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(identifier: "ForgotPassword") as? ForgotPasswordViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func signUpWithFb(_ sender: UIButton) {
        
    }
    @IBAction func showPassWord(_ sender: UIButton) {
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TabBarViewController
        vc.modalPresentationStyle = .fullScreen
    }
}

extension UIViewController: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
