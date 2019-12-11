//
//  CurrentReservationTableViewCell.swift
//  Trip
//
//  Created by Mustafa on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
protocol CurrentReservationDelegate {
    func startTrip(id: Int)
    func details(id: Int)
    func endTrip(id: Int)
}

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
    var delegate: CurrentReservationDelegate?
    var idRequest: Int?
    var idCar: Int?
    
    @IBAction func detailsBtnPressed(_ sender: UIButton) {
        if let id = idCar {
            delegate?.details(id: id)
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        if let id = idRequest {
            delegate?.endTrip(id: id)
        }
    }
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
        if let id = idRequest {
            delegate?.startTrip(id: id)
        }
    }
}
