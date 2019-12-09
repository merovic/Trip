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
            Maps.openMaps(lat: "21.332", long: "31.341", distance: 1000, name: model)
        }
    }
    
    @IBAction func reservePressed(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "ReserveCar") as! ReserveTripViewController
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
        if let image = UIImage(named: "map1.jpg") {
            imageCarSlider.auk.show(image: image)
        }
        if let image = UIImage(named: "carSale") {
            imageCarSlider.auk.show(image: image)
        }
        if let car = carDetails {
            price.attributedText = NSAttributedString.withDualText(text1: car.priceRentPerDay, ofSizeText1: 28, text2: " SR/D", ofSizeText2: 14)
            name.text = car.owner
            model.text = car.model
            from.attributedText = NSAttributedString.withDualText2(text1: "From ", ofSizeText1: Shared.body, text2: car.availableDateFrom, ofSizeText2: Shared.Header)
            to.attributedText = NSAttributedString.withDualText2(text1: "To ", ofSizeText1: Shared.body, text2: car.availableDateTo, ofSizeText2: Shared.Header)
            address.text = "\(car.city) ,\(car.area)"
            tripsNum.attributedText = NSAttributedString.withDualText(text1: car.numberOfTrip, ofSizeText1: 14, text2: "Trips ", ofSizeText2: 10)
        }
    }
    
    
}
