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
        let logged = Shared.getcheckLogin()
        if logged {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
                self.navigationController?.pushViewController(vc, animated: false)
            }
        } else {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "LogIn") as? LogInViewController {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
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
        if indexPath.row ==  data.name.count - 1 {
             if Shared.getcheckLogin() == false {
                cell.Label.text = "Sign In".localized
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 5:
            if let name = URL(string: "https://itunes.apple.com/us/app/Trip"), !name.absoluteString.isEmpty {
                let objectsToShare = [name]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                self.present(activityVC, animated: true, completion: nil)
            }
        case 12:
            if Shared.getcheckLogin() == false {
                if let vc = storyboard?.instantiateViewController(withIdentifier: "LogIn") as? LogInViewController {
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            }else {
                Shared.setcheckLogin(false)
                Shared.user = nil
                dismiss(animated: true, completion: nil)
            }
            
        default:
            guard let vc = storyboard?.instantiateViewController(withIdentifier: data.controller[indexPath.row]) else { return  }
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
}

