//
//  TabBarViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/30/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 2
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
       
        switch tabBarController.selectedIndex {
        case 0:
            fallthrough
        case 1:
            fallthrough
        case 3:
            let loggedIn = Shared.getcheckLogin()
            if !loggedIn ,let vc = storyboard?.instantiateViewController(withIdentifier: "LogIn") as? LogInViewController {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        default:
            break
        }
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    }
  

}
