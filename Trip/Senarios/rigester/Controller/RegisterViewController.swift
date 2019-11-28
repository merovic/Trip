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
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var attachBut: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet var userType: [BEMCheckBox]!
    @IBOutlet weak var licenseView: UIView!
    @IBOutlet weak var licenseViewHeight: NSLayoutConstraint!
    
    
    let ImagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegates()
        
    }
    
    func setTextFieldDelegates(){
        nameTF.delegate = self
        addressTF.delegate = self
        phoneTf.delegate = self
        passwordTF.delegate = self
        passwordComfirmTF.delegate = self
        mailTF.delegate = self
        Rounded.roundedCornerButton1(button: attachBut)
        Rounded.roundedCornerButton1(button: registerBtn)
        
        ImagePicker.delegate = self
        ImagePicker.sourceType = .photoLibrary
        
        licenseView.isHidden = true
        licenseViewHeight.constant = 0
        userType[0].on = true
    }
    
    @IBAction func chooseUserType(_ sender: BEMCheckBox) {
        if sender.tag == 1 {
            userType[1].on = false
            licenseView.isHidden = true
            licenseViewHeight.constant = 0
        } else {
            userType[0].on = false
            licenseView.isHidden = false
            licenseViewHeight.constant = 100
        }
    }
    
    
    
    @IBAction func attachBtnPressed(_ sender: UIButton) {
        present(ImagePicker, animated: true, completion: nil)
    }
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        if let name = nameTF.text , let address = addressTF.text , let phone = phoneTf.text , let password = passwordTF.text , passwordComfirmTF.text == passwordTF.text , let email = mailTF.text , let licanse = FirebaseUploader.imageURl {
            APIClient.register(name: name, email: email, password: password, phone: phone, address: address, license: licanse, rate: "5") { (Result) in
                switch Result{
                case .success(let response):
                    print(response)
                    if response == "True" {
                        print("done")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    Alert.show("Failed", massege: error.localizedDescription, context: self)
                }
            }
        } else if passwordComfirmTF.text != passwordTF.text {
            Alert.show("Error", massege: "Password doesn't match", context: self)
        } else {
            Alert.show("Error", massege: "all Fields are required", context: self)
        }
    }
}

extension RegisterViewController: UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: ImagePicker, didFinishPickingMediaWithInfo: info)
    }
    
}
