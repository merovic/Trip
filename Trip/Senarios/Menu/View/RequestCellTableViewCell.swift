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
            Rounded.roundedCornerButton1(button: Accepated)
        }
    }
    var idRequest: Int?
    
    @IBAction func acceptRequest(_ sender: UIButton){
        APIClient.agrre_request(id_request: 0, km: 0) { (Result) in
            switch Result {
            case .success(let ressponse):
                print(ressponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func refuseRequest(_ sender: UIButton){
        APIClient.refuseRequest(id_request: 0) { (Result) in
            switch Result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
