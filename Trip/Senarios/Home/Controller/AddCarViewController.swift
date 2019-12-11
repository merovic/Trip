//
//  AddCarViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class AddCarViewController: UIViewController ,CanReceive ,NVActivityIndicatorViewable {
    
    @IBOutlet weak var apartmentName: UITextField!
    @IBOutlet weak var stname: UITextField!
    @IBOutlet weak var refion: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var tripPrice: UITextField!
    @IBOutlet weak var kmPrice: UITextField!
    @IBOutlet weak var km: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var dateTo: UITextField!
    @IBOutlet weak var dateFrom: UITextField!
    @IBOutlet weak var pricePerDay: UITextField!
    @IBOutlet weak var color: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var attatchBut: UIButton!{
        didSet{
            attatchBut.layer.cornerRadius = 8
            attatchBut.layer.borderColor = #colorLiteral(red: 0.9725490196, green: 0.9529411765, blue: 0.003921568627, alpha: 1)
            attatchBut.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var addPressed: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: addPressed)
        }
    }
    
    let imagePicker = UIImagePickerController()
    let currencyPicker = UIPickerView()
    var datePicker = UIDatePicker()
    var imageUrl: String!
    var flag =  0
    var dataFlag = false
    var lat: String = ""
    var long: String = ""
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    //MARK:- IBActions
    @IBAction func attachPressed(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func showMap(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "Map") as! MapKitViewController
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK:- Add a new car
    @IBAction func addPressed(_ sender: UIButton) {
        if apartmentName.text != "" , stname.text != "" , refion.text != "" , city.text != "" , tripPrice.text != "" , kmPrice.text != "" , km.text != "" , number.text != "" , dateTo.text != "" , dateFrom.text != "" , pricePerDay.text != "" , color.text != "" , model.text != "" , name.text != "" , let image = Shared.Image{
            self.startAnimating()
            
            DispatchQueue.main.async { [weak self ] in
                APIClient.addCar(id_owner: 5, owner: self?.name.text ?? "", image: image , price_rent_per_day: self?.pricePerDay.text ?? "", available_date_from: self?.dateFrom.text ?? "", available_date_to: self?.dateTo.text ?? "", number_km: self?.km.text ?? "", price_km: self?.kmPrice.text ?? "", price_trip: self?.tripPrice.text ?? "", city: self?.city.text ?? "", area: self?.refion.text ?? "", st_name: self?.stname.text ?? "", number_hone: "22" , lon: self?.long ?? "", lat: self?.lat ?? "", number_of_trip: "19", model: self?.model.text ?? "", type:"ali" , rate: "2") { (Result) in
                    switch Result {
                    case .success(let respnse):
                        print(respnse)
                        self?.stopAnimating()
                        Alert.show("Success", massege: "Car added Successfully", context: self!)
                    case .failure(let error):
                        print(error.localizedDescription)
                        self?.stopAnimating()
                        Alert.show("Failed", massege: error.localizedDescription, context: self!)
                    }
                }
            }
        }
        else {
            Alert.show("Failed", massege: "All fields are requires", context: self)
        }
    }
    
    @IBAction func modelCarAtion(_ sender: UITextField) {
           flag = 1
       }
       
       @IBAction func colorCarAction(_ sender: UITextField) {
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
    
    func setDelegates(){
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        doneButtonForCitiesPicker(for: model)
        doneButtonForCitiesPicker(for: city)
        doneButtonForCitiesPicker(for: color)
        openDatePicker(for: dateFrom)
        openDatePicker(for: dateTo)
    }
    
    //MARK:- update view from model
    func updateView(){
        
        apartmentName.delegate = self
        stname.delegate = self
        refion.delegate = self
        city.delegate = self
        tripPrice.delegate = self
        kmPrice.delegate = self
        km.delegate = self
        number.delegate = self
        pricePerDay.delegate = self
        name.delegate = self
        setDelegates()
        
        if let user = Shared.user {
            name.text = user.name
            number.text = user.phone
        }
    }
    
    //MARK:- change textField inputView to datePicker
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
    
    //MARK:- change textField inputView to a pickerView
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
    
    //MARK:- Data from MapKit -- Map Protocol 
    func dataReceived(lat: String, long: String) {
        self.lat = lat; self.long = long
    }
}

//MARK:- pickerView Set Up
extension AddCarViewController: UIPickerViewDataSource , UIPickerViewDelegate {
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
    
    //MARK:- didSelectRow for pickerView
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

//MARK:- imagePicker Methodes
extension AddCarViewController: UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info , completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
