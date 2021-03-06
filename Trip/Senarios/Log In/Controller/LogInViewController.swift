//
//  LogInViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
@available(iOS 13.0, *)
class LogInViewController: UIViewController{

    @IBOutlet weak var logInBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: logInBut)
        }
    }
    @IBOutlet weak var passwordTF: UITextField!{didSet{ passwordTF.delegate = self }}
    @IBOutlet weak var mailTF: UITextField!{didSet{ mailTF.delegate = self }}
    @IBOutlet weak var fbBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: fbBut)
        }
    }
    
    
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
                        Shared.user = response.first
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
      //  facebooklogin()
    }
    @IBAction func showPassWord(_ sender: UIButton) {
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TabBarViewController
        vc.modalPresentationStyle = .fullScreen
    }
    
   
    func facebooklogin() {
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: self, handler: { (result, error) -> Void in
            print("\n\n result: \(result)")
            print("\n\n Error: \(error)")
            
            if (error == nil) {
                let fbloginresult : LoginManagerLoginResult = result!
                if(fbloginresult.isCancelled) {
                    //Show Cancel alert
                } else if(fbloginresult.grantedPermissions.contains("email")) {
                 //  self.returnUserData()
                    //fbLoginManager.logOut()
                }
            }
        })
    }
    
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
