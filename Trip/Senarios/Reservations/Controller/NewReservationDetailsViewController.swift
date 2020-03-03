//
//  NewReservationDetailsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/30/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos
import SideMenu

class NewReservationDetailsViewController: UIViewController {
    
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var dateTo: UILabel!
    @IBOutlet weak var dateFrom: UILabel!
    @IBOutlet weak var hourTo: UILabel!
    @IBOutlet weak var hourFrom: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var km: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    var idCar: Int?
    var carInfo: Car?
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigationController") as? SideMenuNavigationController {
            vc.settings = Shared.settings(view: self.view)
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func closeViewPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Get car details by id
    func getData() {
        if let carID = idCar {
            DispatchQueue.global().async { [ weak self ] in
                APIClient.getAllCarsById(id: carID) { (Result) in
                    switch Result {
                    case .success(let response):
                        print(response)
                        self?.carInfo = response.first
                        self?.updateView()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    //MARK:- update View from model
    func updateView() {
        if let car = carInfo {
            let availableDateFrom = Shared.converDate(date: car.available_date_from)
            let availableDateTo = Shared.converDate(date: car.available_date_to)
            
            price.attributedText = NSAttributedString.withDualText(text1: car.price_rent_per_day, ofSizeText1: 18, text2: "SR".localized, ofSizeText2: 14)
            tax.attributedText = NSAttributedString.withDualText(text1: "0", ofSizeText1: 18, text2: "SR".localized, ofSizeText2: 14)
            km.attributedText = NSAttributedString.withDualText(text1: car.number_km, ofSizeText1: 18, text2: "KM".localized, ofSizeText2: 14)
            totalPrice.attributedText = NSAttributedString.withDualText(text1: car.price_rent_per_day, ofSizeText1: 22, text2: "SR".localized, ofSizeText2: 16)
            dateFrom.attributedText = NSAttributedString.withDualText2(text1: "From".localized, ofSizeText1: 14, text2: availableDateFrom[0], ofSizeText2: 18)
            dateTo.attributedText = NSAttributedString.withDualText2(text1: "To".localized, ofSizeText1: 14, text2: availableDateTo[0], ofSizeText2: 18)
            hourFrom.attributedText = NSAttributedString.withDualText2(text1: "From".localized, ofSizeText1: 10, text2: car.available_time_from, ofSizeText2: 14)
            hourTo.attributedText = NSAttributedString.withDualText2(text1: "To".localized, ofSizeText1: 10, text2: car.available_time_to, ofSizeText2: 14)
            
            if "Lang".localized == "ar" {
                note.text = "ملاحظة: سعر الكيلومتر الزائد \(car.price_km) ريال"
                
            }else {
                note.text = "Note: extra KM price is \(car.price_km) SR"
            }
            
            if let rating = Double(car.rate) {
                rate.rating = rating
            }
        }
    }
}
