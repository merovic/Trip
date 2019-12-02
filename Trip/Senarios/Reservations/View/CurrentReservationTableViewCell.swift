//
//  CurrentReservationTableViewCell.swift
//  Trip
//
//  Created by Mustafa on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class CurrentReservationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressReservation: UILabel!
    @IBOutlet weak var dateOfReservation: UILabel!
    @IBOutlet weak var someOfDetailsOfReservationLbl: UILabel!
    @IBOutlet weak var detailsBtn: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: detailsBtn)
        }
    }
    @IBOutlet weak var cancleBtn: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: cancleBtn)
        }
    }
    @IBOutlet weak var startBtn: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: startBtn)
        }
    }
    
    @IBAction func detailsBtnPressed(_ sender: UIButton) {
    }
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
    }
    @IBAction func startBtnPressed(_ sender: UIButton) {
    }
}
