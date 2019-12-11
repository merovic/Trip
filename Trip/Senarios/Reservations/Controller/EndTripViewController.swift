//
//  EndTripViewController.swift
//  Trip
//
//  Created by Mustafa on 12/5/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos

class EndTripViewController: UIViewController {
    
    @IBOutlet weak var numOfKm: UILabel!
    @IBOutlet weak var numOfFreeKm: UILabel!
    @IBOutlet weak var numOfExtraKm: UILabel!
    @IBOutlet weak var extraKmPrice: UILabel!
    @IBOutlet weak var totalAddtionalCost: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var comment: UITextView!
    @IBOutlet weak var colsedTripBtn: UIButton!
    
    var idRequest: Int?
    
    //MARK:- viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.345890411)
    }
    
    @IBAction func colsedTripBtnPreesed(_ sender: UIButton) {
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        self.view.backgroundColor = .clear
        dismiss(animated: true, completion: nil)
    }
    
}
