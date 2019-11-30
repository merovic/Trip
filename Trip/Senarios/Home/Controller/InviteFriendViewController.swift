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


    @IBOutlet weak var SocialCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension InviteFriendViewController : UICollectionViewDelegate , UICollectionViewDataSource {
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
    
}

extension InviteFriendViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let cellSize = CGSize(width: (view.frame.width / 5) - 5  , height: 75)
            return cellSize
        
}
}
