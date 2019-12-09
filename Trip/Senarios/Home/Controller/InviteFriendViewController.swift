//
//  Invite a Friend Invite a Friend Invite a friend Invite a friend Invite a friend InviteFriendViewController.swift
//  Trip
//
//  Created by Mustafa on 11/30/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class InviteFriendViewController: UIViewController {
    
    var soicalNameArray = ["Phone" , "Facebook" , "Whatsapp" , "Messenger" , "Email" , "More"]
    var soicalImageArray = ["mobile" , "fbIcon" , "what'sIcon" , "messengerIcon" , "emailIcon" , "moreIcon"]
    
    @IBOutlet weak var popView: UIView!{
        didSet{
            popView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var SocialCollectionView: UICollectionView!
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.352739726)
    }
    //MARK:- cancel
    @IBAction func cancelBtn(_ sender: UIButton) {
        self.view.backgroundColor = .clear
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK:- collectionView setUp
extension InviteFriendViewController : UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return soicalNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SocialLinksCollectionViewCell", for: indexPath) as? SocialLinksCollectionViewCell {
            
            cell.socialImage.image = UIImage(named: soicalImageArray[indexPath.item])
            cell.socialName.text = soicalNameArray[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize = CGSize(width: (view.frame.width / 5) - 5  , height: 75)
        return cellSize
        
    }
    
    //MARK:- didSelectRowAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: performSegue(withIdentifier: "inviteByPhone", sender: self)
        case 4: performSegue(withIdentifier: "inviteByMail", sender: self)
        default:
            break
        }
    }
}
