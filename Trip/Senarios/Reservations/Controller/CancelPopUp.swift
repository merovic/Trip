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
    
    @IBOutlet weak var kmRead: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func CancelBut(_ sender: UIButton) {
       
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
          dismiss(animated: true, completion: nil)
      
      }
  
    

}
