//
//  EditeProfileViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class EditeProfileViewController: UIViewController, NVActivityIndicatorViewable{
    
    @IBOutlet weak var saveBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: saveBut)
        }
    }
    @IBOutlet weak var comfirmPass: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var name: UITextField!
    
    var user = Shared.user
    let currencyPicker = UIPickerView()
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startAnimating()
        updateView()
        doneButtonForCitiesPicker(for: Address)
    }
    
    //MARK:- update user info
    @IBAction func savePressed(_ sender: UIButton) {
        self.startAnimating()
        if let user = user ,password.text == comfirmPass.text , name.text != "" , phone.text != "" , Address.text != "" , mail.text != "" , password.text != "" {
            
            DispatchQueue.main.async { [weak self] in
                APIClient.updateUser(id_user: user.id, name: self?.name.text ?? user.name , email: self?.mail.text ?? user.email, password: self?.password.text ?? user.password, phone: self?.phone.text ?? user.phone, address: self?.Address.text ?? user.address, license: user.license, img: user.img ?? "") { (Result) in
                    switch Result {
                    case .success(let respnse):
                        print(respnse)
                        self?.stopAnimating()
                    case .failure(let error):
                        print("///////////////////////",error.localizedDescription)
                        self?.stopAnimating()
                    }
                    
                }
            }
            
        } else if password.text != comfirmPass.text {
            self.stopAnimating()
            Alert.show("Error".localized, massege: "Passwords Don't Match".localized , context: self)
        } else if name.text == "" || phone.text == "" || Address.text == "" || mail.text == "" || password.text == "" {
            self.stopAnimating()
            Alert.show("Error".localized, massege: "All Fields Are Required".localized , context: self)
        }
    }
    
    @IBAction func showMenuPressed(_ sender: UIBarButtonItem) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "Reservations") as! ReservationViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    //MARK:- update View From Model
    func updateView(){
        name.text = user?.name
        mail.text = user?.email
        phone.text = user?.phone
        Address.text = user?.address
        password.text = user?.password
        comfirmPass.text = user?.password
        
        name.delegate = self
        mail.delegate = self
        phone.delegate = self
        Address.delegate = self
        password.delegate = self
        comfirmPass.delegate = self
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        self.stopAnimating()
    }
    
    //MARK:- inputAccessory Button Configuration
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
    
}

//MARK:- pickerView setUp
extension EditeProfileViewController: UIPickerViewDataSource , UIPickerViewDelegate {
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
        Address.text = Shared.addressArray[row]
    }
}


