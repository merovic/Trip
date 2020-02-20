//
//  CarDetailsViewController.swift
//  Trip
//
//  Created by Mustafa on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Auk
import Cosmos
class CarDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageCarSlider: UIScrollView!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userType: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var tripsNum: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var fromHour: UILabel!
    @IBOutlet weak var toHour: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var reserveBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: reserveBut)
        }
    }
    @IBOutlet weak var detailsCarView: UIView!{
        didSet{
            detailsCarView.layer.cornerRadius = 40
            detailsCarView.clipsToBounds = true
        }
    }
    
    var carDetails: Car?
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    //MARK:- Open location in Maps app
    @IBAction func showMaps(_ sender: UIButton) {
        if let lat = carDetails?.lat , let long = carDetails?.lon , let model = carDetails?.model{
            Maps.openMaps(lat: lat , long: long , distance: 1000, name: model)
        }
    }
    
    @IBAction func reservePressed(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ReserveCar") as? ReserveTripViewController {
            vc.reservationDetails = carDetails
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    //MARK:- UpdateView
    func updateView(){
        imageCarSlider.auk.settings.contentMode = .scaleAspectFill
        imageCarSlider.auk.settings.pageControl.marginToScrollViewBottom = 30
        
        price.layer.cornerRadius = 10
        price.layer.masksToBounds = true
        price.layer.borderWidth = 0
        
        imageCarSlider.auk.show(url: carDetails?.image ?? "")
        //        if let image = UIImage(named: "map1.jpg") {
        //            imageCarSlider.auk.show(image: image)
        //        }
        //        if let image = UIImage(named: "carSale") {
        //            imageCarSlider.auk.show(image: image)
        //        }
        if let car = carDetails {
            let availableDateFrom = Shared.converDate(date: car.available_date_from)
            let availableDateTo = Shared.converDate(date: car.available_date_to)
            
            price.attributedText = NSAttributedString.withDualText(text1: car.price_rent_per_day, ofSizeText1: 28, text2: "SR/Day".localized, ofSizeText2: 14)
            name.text = car.owner
            model.text = car.model
            from.attributedText = NSAttributedString.withDualText2(text1: "From".localized, ofSizeText1: Shared.body, text2: availableDateFrom[0], ofSizeText2: Shared.Header)
            to.attributedText = NSAttributedString.withDualText2(text1: "To".localized, ofSizeText1: Shared.body, text2: availableDateTo[0], ofSizeText2: Shared.Header)
            address.text = "\(car.city) ,\(car.area)"
            tripsNum.attributedText = NSAttributedString.withDualText(text1: car.number_of_trip, ofSizeText1: 14, text2: "Trips".localized, ofSizeText2: 10)
            fromHour.attributedText = NSAttributedString.withDualText2(text1: "From".localized, ofSizeText1: 10, text2: car.available_time_from, ofSizeText2: 14)
            toHour.attributedText = NSAttributedString.withDualText2(text1: "To".localized, ofSizeText1: 10, text2: car.available_time_to, ofSizeText2: 14)
            if let rating = Double(car.rate) {
                rate.rating = rating
            }
        }
    }
    
    
}
