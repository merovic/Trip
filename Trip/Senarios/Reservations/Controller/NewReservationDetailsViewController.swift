//
//  NewReservationDetailsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/30/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos
class NewReservationDetailsViewController: UIViewController {
    @IBOutlet weak var expDate: UILabel!
    @IBOutlet weak var natNumber: UILabel!
    @IBOutlet weak var name: UILabel!

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
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func updateView() {
        if let car = carInfo {
            price.attributedText = NSAttributedString.withDualText(text1: car.priceRentPerDay, ofSizeText1: 18, text2: " SR", ofSizeText2: 14)
            tax.attributedText = NSAttributedString.withDualText(text1: "0", ofSizeText1: 18, text2: " SR", ofSizeText2: 14)
            km.attributedText = NSAttributedString.withDualText(text1: car.numberKM, ofSizeText1: 18, text2: " KM", ofSizeText2: 14)
            totalPrice.attributedText = NSAttributedString.withDualText(text1: car.priceRentPerDay, ofSizeText1: 22, text2: " SR", ofSizeText2: 16)
            dateFrom.attributedText = NSAttributedString.withDualText2(text1: "From ", ofSizeText1: 14, text2: "\(car.availableDateFrom)", ofSizeText2: 18)
            dateTo.attributedText = NSAttributedString.withDualText2(text1: "To ", ofSizeText1: 14, text2: "\(car.availableDateTo)", ofSizeText2: 18)
            if let rating = Double(car.rate) {
                rate.rating = rating
            }
        }
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
            present(vc!, animated: true, completion: nil)
        }
    }
    
    func getData() {
        if let carID = idCar {
            DispatchQueue.global().async { [weak self ] in
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
    
    
}
