//
//  CancelPopUp.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

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
    
    //MARK:- viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.352739726)
    }
    
    @IBAction func CancelBut(_ sender: UIButton) {
        
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        self.view.backgroundColor = .clear
        dismiss(animated: true, completion: nil)
    }
    
}
