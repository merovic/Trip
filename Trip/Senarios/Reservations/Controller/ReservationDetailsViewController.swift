//
//  ReservationDetailsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/30/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import SideMenu

class ReservationDetailsViewController: UIViewController {
    
    @IBOutlet weak var hourTo: UILabel!
    @IBOutlet weak var hourFrom: UILabel!
    @IBOutlet weak var dateTo: UILabel!
    @IBOutlet weak var dateFrom: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var km: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var cancelTrip: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: cancelTrip)
        }
    }
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cancelTripPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func menuPressed(_ sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigationController") as? SideMenuNavigationController {
            vc.settings = Shared.settings(view: self.view)
            present(vc, animated: true, completion: nil)
        }
    }
    
    
}
