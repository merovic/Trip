//
//  RequestCellTableViewCell.swift
//  Trip
//
//  Created by Mustafa on 12/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos

protocol RequestCellDelegate {
    func acceptRequest(id: Int)
    func refuseRequest(id: Int)
}


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
            Rounded.roundedCornerButton1(button: Accepated)
        }
    }
    var idRequest: Int?
    var delegate: RequestCellDelegate?
    
    @IBAction func acceptRequest(_ sender: UIButton){
        if let id = idRequest {
            delegate?.acceptRequest(id: id)
        }
    }
    
    @IBAction func refuseRequest(_ sender: UIButton){
        if let id = idRequest {
            delegate?.refuseRequest(id: id)
        }
    }
}
