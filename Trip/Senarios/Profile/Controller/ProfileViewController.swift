//
//  ProfileViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import SideMenu

class ProfileViewController: UIViewController, UINavigationControllerDelegate , UIImagePickerControllerDelegate{
    
    @IBOutlet weak var profileImage: UIImageView!{
        didSet{
            Rounded.roundedImage(imageView: profileImage)
        }
    }
    @IBOutlet weak var name: UILabel!
    
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateData()
    }
    
    func updateData(){
        if let user = Shared.user {
            profileImage.sd_setImage(with: URL(string: user.img ?? ""), placeholderImage: UIImage(named: "userPlaceholder"))
            name.text = user.name
            DispatchQueue.global(qos: .background).async { [weak self] in
                APIClient.logIn(email: user.email, password: user.password) { (Result) in
                    switch Result {
                    case .success(let response):
                        print(response)
                        Shared.user = response.first
                        self?.profileImage.sd_setImage(with: URL(string: response.first?.img ?? ""), placeholderImage: UIImage(named: "userPlaceholder"))
                        self?.name.text = response.first?.name
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    @IBAction func editProfile(_ sender: UIButton) {
        
    }
    
    @IBAction func editCarDetails(_ sender: UIButton) {
        
    }
    
    @IBAction func reservations(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "Reservations") as! ReservationViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showMenuPressed(_ sender: UIBarButtonItem) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController") as! SideMenuNavigationController
           
            vc.settings = Shared.settings(view: self.view)
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func changePhoto(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
            profileImage.image = image
        _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, completion: { [weak self] in
            self?.updateUser()
        }
        )
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       print("NOOOO")
    }
    
    func updateUser(){
        if let imageUrl = Shared.Image , let user = Shared.user{
            DispatchQueue.global().async { [weak self] in
                APIClient.updateUser(id_user: user.id, name: user.name, email: user.email, password: user.password, phone: user.phone, address: user.address, license: user.license, img: imageUrl) { (Result) in
                    switch Result{
                    case .success(let response):
                        print(response)
                        if response == "True" {
                            Alert.show("Success", massege: "image uploaded successfully", context: self!)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                        Alert.show("Failed", massege: "please try again", context: self!)
                        
                    }
                }
                
            }
        }
    }
}
