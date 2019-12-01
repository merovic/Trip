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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editProfile(_ sender: UIButton) {
    }
    
    @IBAction func editCarDetails(_ sender: UIButton) {
    }
    
    @IBAction func reservations(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "Reservations") as! ReservationViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
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
    
}
