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
    
    @IBOutlet weak var backButton: UIButton!{
        didSet{
            if "Lang".localized == "ar" {
                self.backButton.setImage(UIImage(named: "backBlack")?.flippedImage(), for: .normal)
            }
        }
    }
    
    let ImagePicker = UIImagePickerController()
    let currencyPicker = UIPickerView()
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButtonForCitiesPicker(for: addressTF)
        setTextFieldDelegates()
    }
    
    //MARK:- IBActions
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
    
    @IBAction func attachBtnPressed(_ sender: UIButton) {
        present(ImagePicker, animated: true, completion: nil)
    }
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        if userType[0].on == true {
            registerNow()
        }else if userType[1].on == true {
            if let licence = Shared.Image {
                registerNow()
            } else {
                Alert.show("Error".localized, massege: "Please Upload Licence Image".localized, context: self)
            }
        }
    }
    
    func registerNow(){
        if let name = nameTF.text , nameTF.text != "" , let address = addressTF.text , addressTF.text != "", let phone = phoneTf.text , phoneTf.text != "" , let password = passwordTF.text , passwordTF.text != "", passwordComfirmTF.text == passwordTF.text , let email = mailTF.text , mailTF.text != "" {
            DispatchQueue.main.async {
                APIClient.register(name: name, email: email, password: password, phone: phone, address: address, license: Shared.Image ?? "", rate: "5") { (Result) in
                    switch Result{
                    case .success(let response):
                        print(response)
                        if response != "True" {
                            Alert.show("Error", massege: response, context: self)
                        } else {
                            Alert.show("Done".localized, massege: "", context: self)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                        Alert.show("Failed".localized, massege: error.localizedDescription, context: self)
                    }
                }
            }
            
        } else if passwordComfirmTF.text != passwordTF.text {
            Alert.show("Error".localized, massege: "Passwords Don't Match".localized, context: self)
        } else {
            Alert.show("Error".localized, massege: "All Fields Are Required".localized, context: self)
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
    
    //MARK:- textField Delegates
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
    
}

//MARK:- imagePicker setUp
extension RegisterViewController: UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: ImagePicker, didFinishPickingMediaWithInfo: info, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK:- pickerView setUp
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

