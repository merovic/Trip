//
//  PreviousReservationTableViewCell.swift
//  Trip
//
//  Created by Mustafa on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class PreviousReservationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressReservation: UILabel!
    @IBOutlet weak var dateOfReservation: UILabel!
    @IBOutlet weak var someOfDetailsOfReservationLbl: UILabel!
    @IBOutlet weak var detailsBtn: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: detailsBtn)
        }
    }
    
    @IBAction func detailsBtnPressed(_ sender: UIButton) {
    }
}
