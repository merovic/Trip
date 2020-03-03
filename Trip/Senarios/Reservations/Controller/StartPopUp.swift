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
    @IBOutlet weak var popView: UIView!{
        didSet{
            popView.layer.cornerRadius = 15
        }
    }
    
    var idRequest: Int?
    
    //MARK:- viewDidLoad
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3801369863)
    }
    
    // Start Trip
    @IBAction func start(_ sender: UIButton) {
        if let id = idRequest , let km = kmRead.text , kmRead.text != "" {
            DispatchQueue.main.async { [weak self] in
                APIClient.statTrip(id_request: id, new_km: km) { (Result) in
                    switch Result {
                    case .success(let response):
                        print(response)
                        self?.cancelBtn(nil)
                    case .failure(let error):
                        print(error.localizedDescription)
                        let vc = self?.storyboard?.instantiateViewController(withIdentifier: "Reservations") as! ReservationViewController
                        vc.dismiss(animated: true) {
                            Alert.show("Failed".localized, massege: "please try again".localized, context: vc)
                        }
                        
                    }
                }
            }
        } else {
            if kmRead.text == "" {
                Alert.show("Error".localized, massege: "Enter the number of kilometers".localized, context: self)
            }
        }
    }
    
    @IBAction func cancelBtn(_ sender: UIButton?) {
        self.view.backgroundColor = .clear
        dismiss(animated: true, completion: nil)
    }
}
