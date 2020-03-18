//
//  CancelPopUp.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

protocol EndTripDelegate {
    func endTrip(id:Int , endText: String)
}

class CancelPopUp: UIViewController {
    
    @IBOutlet weak var cancelBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: cancelBut)
        }
    }
    @IBOutlet weak var popView: UIView!{
        didSet{
            popView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var kmRead: UITextField!{
        didSet{
            kmRead.delegate = self
        }
    }
    
    var id_request: Int?
    var delegate: EndTripDelegate?
    
    //MARK:- viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.352739726)
    }
    
    @IBAction func CancelBut(_ sender: UIButton) {
        if let id = id_request , kmRead.text != "" {
            DispatchQueue.main.async { [weak self] in
                APIClient.endTrip(id_request: id, new_km: self?.kmRead.text ?? "") { (Result) in
                    switch Result{
                    case .success(let response ):
                        print(response)
                        if response == "True"{
                            self?.dismiss(animated: true, completion: nil)
                            self?.delegate?.endTrip(id: id, endText: self?.kmRead.text ?? "0")
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            if kmRead.text == "" {
                Alert.show("Error".localized, massege: "Enter the number of kilometers".localized, context: self)
            }
        }
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        self.view.backgroundColor = .clear
        dismiss(animated: true, completion: nil)
    }
}
