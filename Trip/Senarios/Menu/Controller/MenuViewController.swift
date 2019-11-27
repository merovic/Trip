//
//  MenuViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/26/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import SideMenu
class MenuViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    {
        didSet{
            Rounded.roundedImage(imageView: profileImage)
        }
    }
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToProfile(sender: UIButton) {
        print("go")
       
    }

    @IBAction func closeMenu(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

extension MenuViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        
        cell.Label.text = "Browse Cars"
        cell.image1.image = #imageLiteral(resourceName: "settings")
        return cell
    }
    
}

//let menu = storyboard?.instantiateViewController(identifier: "") as! SideMenuNavigationController
//menu.pushStyle = .subMenu
