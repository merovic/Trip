//
//  ProfileViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import SideMenu

class ProfileViewController: UIViewController , UITabBarControllerDelegate {
    //MARK:- IBActions
    @IBOutlet weak var profileImage: UIImageView!{
        didSet{
            Rounded.roundedImage(imageView: profileImage)
        }
    }
    @IBOutlet weak var name: UILabel!
    let imagePicker = UIImagePickerController()
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateData()
    }
    
    //MARK:- Update Data
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
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("ssssss")
        let logedInStatus = Shared.getcheckLogin()
        if !logedInStatus {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "LogIn") as? LogInViewController {
                             vc.modalPresentationStyle = .fullScreen
                             self.present(vc, animated: true, completion: nil)
                         }
        }
    }
    
    @IBAction func editProfile(_ sender: UIButton) {
        
    }
    
    @IBAction func editCarDetails(_ sender: UIButton) {
        
    }
    
    @IBAction func reservations(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Reservations") as? ReservationViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showMenuPressed(_ sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigationController") as? SideMenuNavigationController {
            vc.settings = Shared.settings(view: self.view)
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func changePhoto(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func updateUser(){
        print("NOW")
        if let imageUrl = Shared.Image , let user = Shared.user{
            print("Updating")
            DispatchQueue.global().async { [weak self] in
                APIClient.updateUser(id_user: user.id, name: user.name, email: user.email, password: user.password, phone: user.phone, address: user.address, license: user.license, img: imageUrl) { (Result) in
                    switch Result{
                    case .success(let response):
                        print(response)
                        if response == "True" {
                            Alert.show("Success".localized, massege: "Image Uploaded Successfully".localized, context: self!)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                        Alert.show("Failed".localized, massege: "Please Try Again".localized, context: self!)
                        
                    }
                }
            }
        }
    }
}

extension ProfileViewController: UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        profileImage.image = image
        FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info) { [weak self] (success) in
            if success == true {
                self?.updateUser()
            }
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
