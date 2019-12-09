//
//  EditCarDetailsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class EditCarDetailsViewController: UIViewController {
    
    @IBOutlet weak var ownerName: UITextField!
    @IBOutlet weak var attachButn: UIButton!{
        didSet{
            attachButn.layer.cornerRadius = 8
            attachButn.layer.borderColor = #colorLiteral(red: 0.9725490196, green: 0.9529411765, blue: 0.003921568627, alpha: 1)
            attachButn.layer.borderWidth = 1
        }
    }
    
    
    
    
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var color: UITextField!
    @IBOutlet weak var rentPricePerDay: UITextField!
    @IBOutlet weak var dateFrom: UITextField!
    @IBOutlet weak var dateTo: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var km: UITextField!
    @IBOutlet weak var kmPrice: UITextField!
    @IBOutlet weak var tripPrice: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var region: UITextField!
    @IBOutlet weak var stName: UITextField!
    @IBOutlet weak var apartmentNumber: UITextField!
    @IBOutlet weak var detailsDescription: UITextView!
    let ImagePicker = UIImagePickerController()
    let currencyPicker = UIPickerView()
     var datePicker = UIDatePicker()
   
    var flag =  0
    var dataFlag = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        
       //doneButtonForCitiesPicker(for: model)
        
        
    }
    
    func setDelegates(){
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        ImagePicker.delegate = self
        ImagePicker.sourceType = .photoLibrary
        doneButtonForCitiesPicker(for: model)
        doneButtonForCitiesPicker(for: city)
        doneButtonForCitiesPicker(for: color)
        openDatePicker(for: dateFrom)
        openDatePicker(for: dateTo)
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
        dateFrom.text = dateformter.string(from: datePicker.date)
        } else {
            dateTo.text = dateformter.string(from: datePicker.date)

        }
        self.view.endEditing(true)
        
    }
    
    func doneButtonForCitiesPicker(for textField: UITextField){
        textField.inputView = currencyPicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: NSLocalizedString("Done", comment: ""), style: .plain, target: self, action: #selector(doneCityPicker));
        toolbar.setItems([doneButton], animated: true)
        toolbar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.inputAccessoryView = toolbar
    }
    
    @objc func doneCityPicker(){
        self.view.endEditing(true)
    }
    
    @IBAction func attachPressed(_ sender: UIButton) {
        present(ImagePicker, animated: true, completion: nil)

    }
    @IBAction func menuPressed(_ sender: UIBarButtonItem) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
            present(vc!, animated: true, completion: nil)
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
    }
    
    
    
    
    @IBAction func modelCarAtion(_ sender: UITextField) {
        flag = 1
    }
    
    @IBAction func colorCarAtion(_ sender: UITextField) {
        flag = 2
    }
    
    @IBAction func cityAction(_ sender: UITextField) {
        flag = 3
    }
    
    
    
    @IBAction func dataFromAction(_ sender: UITextField) {
        dataFlag = false
    }
    
    @IBAction func DataToAction(_ sender: UITextField) {
        dataFlag = true
    }
    
}


extension EditCarDetailsViewController: UIPickerViewDataSource , UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if flag == 1 {
            return Shared.modelArray.count
        } else if flag == 2 {
            return Shared.colorArray.count
        } else {
            return Shared.addressArray.count
        }
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if flag == 1 {
            return Shared.modelArray[row]
        } else if flag == 2 {
            return Shared.colorArray[row]
        } else {
            return Shared.addressArray[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if flag == 1 {
            model.text = Shared.modelArray[row]
        } else if flag == 2 {
            color.textColor = UIColor(named: Shared.colorArray[row])
            color.text =  Shared.colorArray[row]
        } else {
            city.text = Shared.addressArray[row]
        }
        
        
        
        
        
    }
    
    
    
}



extension EditCarDetailsViewController: UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: ImagePicker, didFinishPickingMediaWithInfo: info)
    }
    
}
