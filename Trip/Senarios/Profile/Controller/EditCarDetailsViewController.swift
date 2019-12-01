//
//  EditCarDetailsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class EditCarDetailsViewController: UIViewController {

    @IBOutlet weak var ownerName: UITextField!
    @IBOutlet weak var attachButn: UIButton!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var color: UITextField!
    @IBOutlet weak var rentPricePerDay: UITextField!
    @IBOutlet weak var dateFrom: UITextField!
    @IBOutlet weak var dateTo: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var km: UITextField!
    @IBOutlet weak var kmPrice: UITextField!
    @IBOutlet weak var tripPrice: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var region: UITextField!
    @IBOutlet weak var stName: UITextField!
    @IBOutlet weak var apartmentNumber: UITextField!
    @IBOutlet weak var detailsDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
  
    @IBAction func attachPressed(_ sender: UIButton) {
    }
    @IBAction func menuPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
    }
}
