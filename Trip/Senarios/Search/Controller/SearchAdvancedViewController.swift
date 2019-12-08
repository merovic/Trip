//
//  SearchAdvancedViewController.swift
//  Trip
//
//  Created by Mustafa on 12/2/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class SearchAdvancedViewController: UIViewController {
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var carType: UITextField!
    @IBOutlet weak var from: UITextField!
    @IBOutlet weak var to: UITextField!
    
    @IBOutlet weak var searchBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: searchBut)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            APIClient.getAllCarsByCityAndDate(city: self?.cityName.text ?? "", available_date_from: self?.from.text ?? "", available_date_to: self?.to.text ?? "") { (Result) in
                switch Result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
}




