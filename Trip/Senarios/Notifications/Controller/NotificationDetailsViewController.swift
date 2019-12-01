//
//  NotificationDetailsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos
class NotificationDetailsViewController: UIViewController {

    @IBOutlet weak var rejectBut: UIButton!
    @IBOutlet weak var acceptBut: UIButton!
    @IBOutlet weak var descrtition2: UILabel!
    @IBOutlet weak var description1: UILabel!
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var trips: UILabel!
    @IBOutlet weak var ratelbl: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func acceptPressed(_ sender: UIButton) {
    }
    @IBAction func rejectPressed(_ sender: UIButton) {
    }
}
