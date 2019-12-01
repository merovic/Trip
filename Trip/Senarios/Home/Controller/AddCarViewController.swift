//
//  AddCarViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class AddCarViewController: UIViewController {

    @IBOutlet weak var apartmentName: UITextField!
    @IBOutlet weak var stname: UITextField!
    @IBOutlet weak var refion: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var tripPrice: UITextField!
    @IBOutlet weak var kmPrice: UITextField!
    @IBOutlet weak var km: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var dateTo: UITextField!
    @IBOutlet weak var dateFrom: UITextField!
    @IBOutlet weak var pricePerDay: UITextField!
    @IBOutlet weak var color: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var attatchBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: attatchBut)
        }
    }
    @IBOutlet weak var addPressed: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: addPressed)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        APIClient.addCar(id_owner: 0, owner: name.text ?? "", image: "", price_rent_per_day: pricePerDay.text ?? "", available_date_from: dateFrom.text ?? "", available_date_to: dateTo.text ?? "", number_km: km.text ?? "", price_km: kmPrice.text ?? "", price_trip: tripPrice.text ?? "", city: city.text ?? "", area: refion.text ?? "", st_name: stname.text ?? "", number_hone: "" , lon: "", lat: "", number_of_trip: "", model: model.text ?? "", type:"" , rate: "") { (Result) in
            switch Result {
            case .success(let respnse):
                print(respnse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    @IBAction func showMap(_ sender: UIButton) {
    }
    
    
}
