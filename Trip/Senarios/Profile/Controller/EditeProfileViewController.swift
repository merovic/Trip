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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
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
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        self.startAnimating()
        if let user = user ,password.text == comfirmPass.text , name.text != "" , phone.text != "" , Address.text != "" , mail.text != "" , password.text != "" {
            
            DispatchQueue.main.async { [weak self] in
                APIClient.updateUser(id_user: user.id, name: self?.name.text ?? user.name , email: self?.mail.text ?? user.email, password: self?.password.text ?? user.password, phone: self?.phone.text ?? user.phone, address: self?.Address.text ?? user.address, license: user.license) { (Result) in
                    switch Result {
                    case .success(let respnse):
                        print(respnse)
                        self?.stopAnimating()
                    case .failure(let error):
                        print(error.localizedDescription)
                        self?.stopAnimating()
                    }
                    
                }
            }
            
        } else if password.text != comfirmPass.text {
            self.stopAnimating()
            Alert.show("Error", massege: "Password does not match", context: self)
        } else if name.text == "" || phone.text == "" || Address.text == "" || mail.text == "" || password.text == "" {
            self.stopAnimating()
            Alert.show("Error", massege: "All fields are required", context: self)
        }
    }
    
}
