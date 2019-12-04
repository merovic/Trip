//
//  ReserveTripViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ReserveTripViewController: UIViewController {
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView(){
        
        details.text = "There is no details"
        price.attributedText = NSAttributedString.withDualText(text1: reservationDetails?.priceRentPerDay ?? "0", ofSizeText1: 18, text2: "SR", ofSizeText2: 14)
        km.attributedText = NSAttributedString.withDualText(text1: reservationDetails?.numberKM ?? "0", ofSizeText1: 18, text2: "K/M", ofSizeText2: 14)
        tax.attributedText = NSAttributedString.withDualText(text1: "\(taxAmount)", ofSizeText1: 18, text2: "SR", ofSizeText2: 14)
        dateFrom.attributedText = NSAttributedString.withDualText(text1: "\(reservationDetails?.numberKM)", ofSizeText1: 18, text2: "From", ofSizeText2: 14)
        dateTo.attributedText = NSAttributedString.withDualText(text1: "\(reservationDetails?.availableDateTo)", ofSizeText1: 18, text2: "To", ofSizeText2: 14)
        totalPrice.attributedText = NSAttributedString.withDualText(text1: reservationDetails?.priceRentPerDay ?? "0", ofSizeText1: 24, text2: "SR", ofSizeText2: 20)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let user = Shared.user {
            let currentDate = Date()
            let dateformter = DateFormatter()
            dateformter.dateStyle = .short
            let date = dateformter.string(from: currentDate)

            APIClient.addRequest(id_user: user.id, id_owner: reservationDetails?.idOwner ?? 0, id_car: reservationDetails?.id ?? 0, message: "Hello ,can i reserve this car", datee: date) { (Result) in
                switch Result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
