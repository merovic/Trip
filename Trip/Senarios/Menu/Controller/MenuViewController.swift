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
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
        {
        didSet{
            Rounded.roundedImage(imageView: profileImage)
            profileImage.sd_setImage(with: URL(string: ""), placeholderImage: UIImage(named: "userPlaceholder"))
        }
    }
    
    let data = Controllers()
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    //MARK:- IBActions
    @IBAction func goToProfile(sender: UIButton) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    @IBAction func closeMenu(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateView(){
        if let user = Shared.user {
            nameLbl.text = user.name
            profileImage.sd_setImage(with: URL(string: user.img ?? ""), placeholderImage: UIImage(named: "userPlaceholder"))
        }
    }
}

//MARK:- tableView setUp
extension MenuViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.name.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        if "Lang".localized == "en" {
            cell.Label.text = data.name[indexPath.row]
        } else if "Lang".localized == "ar"  {
            cell.Label.text = data.nameAR[indexPath.row]
        }
        cell.image1.image = UIImage(named: data.name[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            
            switch indexPath.row {
            case 5:
                if let name = URL(string: "https://itunes.apple.com/us/app/Trip"), !name.absoluteString.isEmpty {
                    let objectsToShare = [name]
                    let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                    self.present(activityVC, animated: true, completion: nil)
                }
            case 12:
                if let vc = storyboard?.instantiateViewController(identifier: "LogIn") as? LogInViewController {
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            default:
                guard let vc = storyboard?.instantiateViewController(identifier: data.controller[indexPath.row]) else { return  }
                self.navigationController?.pushViewController(vc, animated: false)
            }
        }
    }
}

