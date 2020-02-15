//
//  NoticicationsTableViewCell.swift
//  Trip
//
//  Created by Ali Mohamed on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var messagelbl: UILabel!
    @IBOutlet weak var detailsBtn: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: detailsBtn )
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
extension NotificationTableViewCell {
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.awakeFromNib()
        contentView.backgroundColor = .none
    }
}