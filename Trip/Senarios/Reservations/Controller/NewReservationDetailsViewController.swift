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

    @IBOutlet weak var cancelBut: UIButton!
    @IBOutlet weak var startBut: UIButton!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var expDate: UILabel!
    @IBOutlet weak var natNumber: UILabel!
    @IBOutlet weak var name: UILabel!
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
    
    var idCar: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func startPressed(_ sender: UIButton) {
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
    }
    @IBAction func menuPressed(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
            present(vc!, animated: true, completion: nil)
        }
    }
    

}
