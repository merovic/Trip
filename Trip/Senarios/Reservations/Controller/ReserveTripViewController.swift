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
            
            details.text = "There is no details".localized
            price.attributedText = NSAttributedString.withDualText(text1: car.priceRentPerDay, ofSizeText1: Shared.Header, text2: "SR".localized, ofSizeText2: Shared.body)
            km.attributedText = NSAttributedString.withDualText(text1: car.numberKM, ofSizeText1: Shared.Header, text2: "KM".localized, ofSizeText2: Shared.body)
            tax.attributedText = NSAttributedString.withDualText(text1: "\(taxAmount)", ofSizeText1: Shared.Header, text2: "SR".localized, ofSizeText2: Shared.body)
            dateFrom.attributedText = NSAttributedString.withDualText2(text1: "From".localized, ofSizeText1: Shared.body, text2: car.availableDateFrom, ofSizeText2: Shared.Header)
            dateTo.attributedText = NSAttributedString.withDualText2(text1: "To".localized, ofSizeText1: Shared.body, text2: car.availableDateTo, ofSizeText2: Shared.Header)
            totalPrice.attributedText = NSAttributedString.withDualText(text1: car.priceRentPerDay, ofSizeText1: 24, text2: "SR".localized, ofSizeText2: 16)
            if "Lang".localized == "ar"{
                note.text = "ملاحظة: سعر الكيلومتر الزائد \(car.priceKM) ريال"
            }else {
                note.text = "Note: extra KM price is \(car.priceKM) SR"
            }
            
        }
    }
}
