//
//  EndTripViewController.swift
//  Trip
//
//  Created by Mustafa on 12/5/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos

class EndTripViewController: UIViewController , UITextViewDelegate{
    
    @IBOutlet weak var numOfKm: UILabel!
    @IBOutlet weak var numOfFreeKm: UILabel!
    @IBOutlet weak var numOfExtraKm: UILabel!
    @IBOutlet weak var extraKmPrice: UILabel!
    @IBOutlet weak var totalAddtionalCost: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var comment: UITextView!
    @IBOutlet weak var colsedTripBtn: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: colsedTripBtn)
        }
    }
    var endKms: String?
    var idRequest: Int?
    var requestInfo: Request?
    //MARK:- viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.345890411)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    @IBAction func colsedTripBtnPreesed(_ sender: UIButton) {
        rateUser()
        cancelBtn(colsedTripBtn)
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        self.view.backgroundColor = .clear
        dismiss(animated: true, completion: nil)
    }
    
    func updateView(){
        
        if let request = requestInfo , let end = endKms{
            
            let kmPrice = stringToDouble(for: request.priceKM)
            let freeKm = stringToDouble(for: request.numberKM)
            let endKm = stringToDouble(for: end)
            let startKm = stringToDouble(for: request.kmAgree)
            let totalKm = endKm - startKm
            let extraKm = totalKm - freeKm
            let extraPrice = extraKm * kmPrice
            
            numOfKm.text = "\("Total Kilometers".localized) \(totalKm)"
            numOfFreeKm.text = "\("Trip free Kilometers".localized) \(request.numberKM)"
            numOfExtraKm.text = "\("Extra Kilometers".localized) \(extraKm)"
            extraKmPrice.text = "\("Extra Kilometer Price".localized) \(request.priceKM)"
            totalAddtionalCost.text = "\("Extra Kilometers Price".localized) \(extraPrice)"
            
        }
    }
    
    func getData(){
        if let id = idRequest {
            DispatchQueue.main.async { [weak self] in
                APIClient.getAllRequestsByRequestID(Id_Request: id) { Result in
                    switch Result {
                    case .success(let response):
                        print(response)
                        self?.requestInfo = response.first
                        self?.updateView()
                    case .failure(let error):
                        print(error.localizedDescription)
                        
                    }
                }
            }
        }
    }
    
    
    //TODO:- convert string to double
    func stringToDouble(for text: String) -> Double {
        var doubleString: Double?
        doubleString = Double(text)
        guard let double = doubleString else { return 0 }
        return double
    }
    
    func rateUser(){
        if let user = requestInfo?.idOwner {
            DispatchQueue.main.async { [ weak self ] in
                APIClient.updateUserRate(id_car: user, number_rate: self?.rate.rating ?? 0) { (Result) in
                    switch Result{
                    case .success(let response):
                        print(response)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
}
