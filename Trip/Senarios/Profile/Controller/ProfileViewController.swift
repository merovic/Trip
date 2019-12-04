//
//  ProfileViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
    func updateData(){
        if let user = Shared.user {
            profileImage.sd_setImage(with: URL(string: user.img ?? ""), placeholderImage: UIImage(named: "userPlaceholder"))
            DispatchQueue.global(qos: .background).async { [weak self] in
                APIClient.logIn(email: user.email, password: user.password) { (Result) in
                    switch Result {
                    case .success(let response):
                        print(response)
                        self?.profileImage.sd_setImage(with: URL(string: user.img ?? ""), placeholderImage: UIImage(named: "userPlaceholder"))
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
            
            //  vc.modalPresentationStyle = .fullScreen
            // self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showMenuPressed(_ sender: UIBarButtonItem) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
            present(vc!, animated: true, completion: nil)
        }
    }
    
    @IBAction func changePhoto(_ sender: UIButton) {
        
    }
    
    
}
