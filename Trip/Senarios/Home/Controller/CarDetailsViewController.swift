//
//  CarDetailsViewController.swift
//  Trip
//
//  Created by Mustafa on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Auk

class CarDetailsViewController: UIViewController {
    
    @IBOutlet weak var tripsNum: UILabel!
    @IBOutlet weak var reserveBut: UIButton!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var toHour: UILabel!
    @IBOutlet weak var fromHour: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var userType: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var detailsCarView: UIView!
    @IBOutlet weak var imageCarSlider: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readius()
      
               imageCarSlider.auk.show(url: "https://scarfi-hijabs.com/wp-content/uploads/2019/10/4.jpg")
        if let image = UIImage(named: "map1.jpg") {
                 imageCarSlider.auk.show(image: image)
               }
        if let image = UIImage(named: "map2.jpg") {
          imageCarSlider.auk.show(image: image)
        }
    }
    

    @IBAction func showMaps(_ sender: UIButton) {
    }
    
    func readius() {
           detailsCarView.layer.cornerRadius = 30
           detailsCarView.clipsToBounds = true
       }

}
