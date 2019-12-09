//
//  ReserveTripViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ReserveTripViewController: UIViewController {
    
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var hourTo: UILabel!
    @IBOutlet weak var hourFrom: UILabel!
    @IBOutlet weak var sendBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: sendBut)
        }
    }
    @IBOutlet weak var dateTo: UILabel!
    @IBOutlet weak var dateFrom: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var km: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    var reservationDetails: Car?
    var taxAmount = 0
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let user = Shared.user {
            let currentDate = Date()
            let dateformter = DateFormatter()
            dateformter.dateStyle = .short
            let date = dateformter.string(from: currentDate)
            
            APIClient.addRequest(id_user: user.id, id_owner: reservationDetails?.idOwner ?? 0, id_car: reservationDetails?.id ?? 0, message: "New Car Rent Request", datee: date) { (Result) in
                switch Result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func updateView(){
   
        if let car = reservationDetails {
             
            details.text = "There is no details"
            price.attributedText = NSAttributedString.withDualText(text1: car.priceRentPerDay, ofSizeText1: Shared.Header, text2: " SR", ofSizeText2: Shared.body)
            km.attributedText = NSAttributedString.withDualText(text1: car.numberKM, ofSizeText1: Shared.Header, text2: " KM", ofSizeText2: Shared.body)
                   tax.attributedText = NSAttributedString.withDualText(text1: "\(taxAmount)", ofSizeText1: Shared.Header, text2: " SR", ofSizeText2: Shared.body)
            dateFrom.attributedText = NSAttributedString.withDualText(text1: car.availableDateFrom, ofSizeText1: Shared.Header, text2: "From ", ofSizeText2: Shared.body)
            dateTo.attributedText = NSAttributedString.withDualText(text1: car.availableDateTo, ofSizeText1: Shared.Header, text2: "To ", ofSizeText2: Shared.body)
            totalPrice.attributedText = NSAttributedString.withDualText(text1: car.priceRentPerDay, ofSizeText1: 24, text2: " SR", ofSizeText2: 16)
            note.text = "Note: extra KM price is \(car.priceKM) SR"
        }
    }
}
