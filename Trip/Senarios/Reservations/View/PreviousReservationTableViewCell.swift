//
//  PreviousReservationTableViewCell.swift
//  Trip
//
//  Created by Mustafa on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
protocol PreviosReservationCellDelegate {
    func previosReservationDetails(id: Int)
}

class PreviousReservationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressReservation: UILabel!
    @IBOutlet weak var dateOfReservation: UILabel!
    @IBOutlet weak var someOfDetailsOfReservationLbl: UILabel!
    @IBOutlet weak var detailsBtn: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: detailsBtn)
        }
    }
    
    var idCar: Int?
    var delegate: PreviosReservationCellDelegate?
    
    @IBAction func detailsBtnPressed(_ sender: UIButton) {
        if let id = idCar {
            delegate?.previosReservationDetails(id: id)
        }
    }
}
