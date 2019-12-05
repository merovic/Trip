//
//  RequestCellTableViewCell.swift
//  Trip
//
//  Created by Mustafa on 12/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos

class RequestCellTableViewCell: UITableViewCell {

    @IBOutlet weak var requestNameLbl: UILabel!
    @IBOutlet weak var requestDateLabl: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var rateLbl: UILabel!
    
    @IBOutlet weak var refused: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: refused)
        }
    }
    @IBOutlet weak var Accepated: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: refused)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
