//
//  SearchAdvancedViewController.swift
//  Trip
//
//  Created by Mustafa on 12/2/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class SearchAdvancedViewController: UIViewController {

    @IBOutlet weak var searchBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: searchBut)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
