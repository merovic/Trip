//
//  LogInViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import MOLH
class LogInViewController: UIViewController, NVActivityIndicatorViewable{
    
    @IBOutlet weak var logInBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: logInBut)
        }
    }
    @IBOutlet weak var passwordTF: MOLHTextField!{didSet{
        passwordTF.forceSwitchingRegardlessOfTag = true
        }}
    @IBOutlet weak var mailTF: MOLHTextField!{didSet{
        mailTF.forceSwitchingRegardlessOfTag = true
        }}
    @IBOutlet weak var fbBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: fbBut)
        }
    }
    @IBOutlet weak var backButton: UIButton!{
        didSet{
            if "Lang".localized == "ar" {
                self.backButton.setImage(UIImage(named: "backBlack")?.flippedImage(), for: .normal)
            }
        }
    }
    
    @IBOutlet weak var write: UIImageView!
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        write.image?.imageFlippedForRightToLeftLayoutDirection()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mailTF.text = ""
        passwordTF.text = ""
    }
    
    //MARK:- logIn
    @IBAction func logInPressed(_ sender: UIButton) {
        self.startAnimating()
        if mailTF.text != nil , passwordTF.text != nil , mailTF.text != "" , passwordTF.text != ""   {
            DispatchQueue.main.async { [weak self ] in
                APIClient.logIn(email: self?.mailTF.text ?? "", password: self?.passwordTF.text ?? "") { (Result) in
                    switch Result {
                    case .success(let response):
                        print(response)
                        Shared.user = response.first
                        Shared.setcheckLogin(true)
                        self?.stopAnimating()
                        self?.dismiss(animated: true, completion: nil)
//                        self?.performSegue(withIdentifier: "Log In", sender: self)
                    case .failure(let error):
                        print(error.localizedDescription)
                        self?.stopAnimating()
                        if error.localizedDescription == "The Internet connection appears to be offline" {
                            
                        } else {
                             Alert.show("Failed".localized, massege: "Wrong Email or Password".localized , context: self!)
                        }
                    }
                }
            }
        }
        else {
            self.stopAnimating()
            Alert.show("Error".localized, massege: "Enter Your Email And Password".localized, context: self)
        }
    }
    
    //MARK:- register
    @IBAction func signUpPressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Register") as? RegisterViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    //MARK:- forgot password
    @IBAction func forgotPassPressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPassword") as? ForgotPasswordViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        if let tbvc = presentingViewController as? TabBarViewController {
            tbvc.selectedIndex = 2
            self.dismiss(animated: true, completion: nil)
            print(tbvc.selectedIndex)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK:- prepare for segue method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TabBarViewController
        vc.modalPresentationStyle = .fullScreen
    }
    
    //MARK:- facebook sign in methodes
    @IBAction func signUpWithFb(_ sender: UIButton) {
        Alert.show("Error".localized, massege: "Facebook login is not yet ready", context: self)
        //  facebooklogin()
    }
    @IBAction func showPassWord(_ sender: UIButton) {
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    
    //    func facebooklogin() {
    //        let fbLoginManager : LoginManager = LoginManager()
    //        fbLoginManager.logIn(permissions: ["email"], from: self, handler: { (result, error) -> Void in
    //            if (error == nil) {
    //                let fbloginresult : LoginManagerLoginResult = result!
    //                if(fbloginresult.isCancelled) {
    //                    //Show Cancel alert
    //                } else if(fbloginresult.grantedPermissions.contains("email")) {
    //                 //  self.returnUserData()
    //                    //fbLoginManager.logOut()
    //                }
    //            }
    //        })
    //    }
    
    /*
     func returnUserData() {
     let graphRequest : GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"email,name"])
     graphRequest.start(completionHandler: { (connection, result, error) -> Void in
     if ((error) != nil) {
     // Process error
     print("\n\n Error: \(error)")
     } else {
     let resultDic = result as! NSDictionary
     print("\n\n  fetched user: \(result)")
     
     if (resultDic.value(forKey:"token") != nil) {
     let userName = resultDic.value(forKey:"access_token")! as! String as NSString?
     print("\n User Name is: \(userName)")
     }
     if(AccessToken.current != nil){
     print(AccessToken.current)
     }
     
     if (resultDic.value(forKey:"email") != nil) {
     let userEmail = resultDic.value(forKey:"email")! as! String as NSString?
     print("\n User Email is: \(userEmail)")
     }
     
     
     }
     })
     }
     */
  
}

extension UIViewController: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
