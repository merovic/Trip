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
    @IBOutlet weak var showNumber: UILabel!
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
    @IBOutlet weak var detailsCarView: UIView!
    
    var carDetails: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView(){
        
        imageCarSlider.auk.show(url: "https://scarfi-hijabs.com/wp-content/uploads/2019/10/4.jpg")
        if let image = UIImage(named: "map1.jpg") {
            imageCarSlider.auk.show(image: image)
        }
        if let image = UIImage(named: "map2.jpg") {
            imageCarSlider.auk.show(image: image)
        }
        
        detailsCarView.layer.cornerRadius = 30
        detailsCarView.clipsToBounds = true
        
        if let car = carDetails {
            price.attributedText = NSAttributedString.withDualText(text1: car.priceRentPerDay, text2: "SR/Day")
            name.text = car.owner
            model.text = car.model
//            from.text = car.availableDateFrom
//            to.text = car.availableDateTo
            address.text = "\(car.city) ,\(car.area)"
            
        }
    }
    
    @IBAction func showMaps(_ sender: UIButton) {
        if let lat = carDetails?.lat , let long = carDetails?.lon , let model = carDetails?.model{
            Maps.openMaps(lat: "21.332", long: "31.341", distance: 1000, name: model)
        }
    }
    
}
