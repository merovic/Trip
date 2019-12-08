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
    @IBOutlet weak var attachBut: UIButton!{
        didSet{
            attachBut.layer.cornerRadius = 8
            attachBut.layer.borderColor = UIColor.black.cgColor
            attachBut.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet var userType: [BEMCheckBox]!
    @IBOutlet weak var licenseView: UIView!
    @IBOutlet weak var licenseViewHeight: NSLayoutConstraint!
    
    
    let ImagePicker = UIImagePickerController()
    let currencyPicker = UIPickerView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButtonForCitiesPicker(for: addressTF)
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
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        licenseView.isHidden = true
        licenseViewHeight.constant = 0
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
  
    

    func doneButtonForCitiesPicker(for textField: UITextField){
           textField.inputView = currencyPicker
           let toolbar = UIToolbar()
           toolbar.sizeToFit()
           let doneButton = UIBarButtonItem(title: NSLocalizedString("Done", comment: ""), style: .plain, target: self, action: #selector(doneCityPicker));
           toolbar.setItems([doneButton], animated: true)
           toolbar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
           textField.inputAccessoryView = toolbar
       }
    
    @objc func doneCityPicker(){
        self.view.endEditing(true)
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
    @IBAction func showPass(_ sender: UIButton) {
        if sender.tag == 0 {
            passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
        } else {
            passwordComfirmTF.isSecureTextEntry = !passwordComfirmTF.isSecureTextEntry
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension RegisterViewController: UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: ImagePicker, didFinishPickingMediaWithInfo: info)
    }
    
}

extension RegisterViewController: UIPickerViewDataSource , UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Shared.addressArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return Shared.addressArray[row]
       }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
   
        addressTF.text = Shared.addressArray[row]
 
        
           
       }
       
    
    
}

