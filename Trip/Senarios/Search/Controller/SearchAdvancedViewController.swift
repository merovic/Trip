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
    var datePicker = UIDatePicker()
       var dataFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    func setDelegates(){
        openDatePicker(for: from)
        openDatePicker(for: to)
    }
    
    
    func openDatePicker(for textField: UITextField) {
        datePicker.datePickerMode = .date
        textField.inputView = datePicker
        let toolbaar = UIToolbar()
        toolbaar.sizeToFit()
        let doneBut = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:#selector(doneClicked))
        toolbaar.setItems([doneBut], animated: true)
        textField.inputAccessoryView = toolbaar
    }
    
    @objc func doneClicked() {
        let dateformter = DateFormatter()
        dateformter.dateStyle = .short
        dateformter.dateFormat = Shared.dateFormate
        if dataFlag == false {
        from.text = dateformter.string(from: datePicker.date)
        } else {
            to.text = dateformter.string(from: datePicker.date)

        }
        self.view.endEditing(true)
        
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            APIClient.getAllCarsByCityAndDate(city: self?.cityName.text ?? "", available_date_from: self?.from.text ?? "", available_date_to: self?.to.text ?? "", type: self?.carType.text ?? "" ) { (Result) in
                switch Result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
   
    @IBAction func dataFromAction(_ sender: UITextField) {
         dataFlag = false
    }
    
    
    @IBAction func dataToAction(_ sender: UITextField) {
         dataFlag = true
    }
    
}




