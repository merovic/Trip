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

    @IBOutlet weak var detailsBtn: UIButton!
    @IBOutlet weak var cancleBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func detailsBtnPressed(_ sender: UIButton) {
    }
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
    }
    @IBAction func startBtnPressed(_ sender: UIButton) {
    }
}
