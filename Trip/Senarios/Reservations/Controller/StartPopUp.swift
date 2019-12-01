//
//  StartPopUp.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class StartPopUp: UIViewController {

    @IBOutlet weak var kmRead: UITextField!
    @IBOutlet weak var startBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: startBut)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func start(_ sender: UIButton) {
        
    }
    

}
