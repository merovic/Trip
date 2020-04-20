//
//  SearchNormalViewController.swift
//  Trip
//
//  Created by Mustafa on 12/2/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class SearchNormalViewController: UIViewController {
    
    @IBOutlet weak var searchTF: DesignableUITextField!{
        didSet{
            searchTF.delegate = self
        }
    }
    @IBOutlet var currentView: UIView!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: searchBut)
        }
    }
    
    let currencyPicker = UIPickerView()
    
    var allCarsByCity  : AllCarsByCity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButtonForCitiesPicker(for: searchTF)
        searchTF.delegate = self
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchTF.becomeFirstResponder()
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        getSearch()
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
    
    func getSearch()  {
        if searchTF.text != "" {
            DispatchQueue.main.async { [weak self] in
                APIClient.getAllCarsByCityModel(city: self?.searchTF.text ?? "") { (Result) in
                    switch Result {
                    case .success(let response):
                        // print(response)
                        self?.allCarsByCity = response
                        print(self?.allCarsByCity)
                        self?.searchTableView.reloadData()
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                        Alert.show("Error".localized, massege: "Enter the city name correctly".localized, context: self!)
                    }
                }
            }
        }
    }
    
}

extension SearchNormalViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCarsByCity?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "SearchCellTableViewCell", for: indexPath) as! SearchCellTableViewCell
        cell.textLable.text = allCarsByCity?[indexPath.row].model
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("dsjkzxj")
        let vc = storyboard?.instantiateViewController(withIdentifier: "CarDetails") as! CarDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.lat = allCarsByCity?[indexPath.row].lat
        vc.long = allCarsByCity?[indexPath.row].lon
        vc.models = allCarsByCity?[indexPath.row].model
        vc.available_date_from = allCarsByCity?[indexPath.row].availableDateFrom
        vc.available_date_to = allCarsByCity?[indexPath.row].availableDateTo
        vc.price_rent_per_day = allCarsByCity?[indexPath.row].priceRentPerDay
        vc.owner = allCarsByCity?[indexPath.row].owner
        vc.city = allCarsByCity?[indexPath.row].city
        vc.area = allCarsByCity?[indexPath.row].area
        vc.rates = allCarsByCity?[indexPath.row].rate
        vc.available_time_from = allCarsByCity?[indexPath.row].availableTimeFrom
        vc.available_time_to = allCarsByCity?[indexPath.row].availableTimeTo
        vc.number_of_trip = allCarsByCity?[indexPath.row].numberOfTrip

            self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}



//MARK:- pickerView setUp
extension SearchNormalViewController: UIPickerViewDataSource , UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Shared.addressArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if "Lang".localized == "en" {
            return Shared.addressArray[row]
        } else if "Lang".localized == "ar"  {
            return Shared.addressArrayAr[row]
        }
         return Shared.addressArrayAr[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if "Lang".localized == "en" {
            searchTF.text = Shared.addressArray[row]
        } else if "Lang".localized == "ar"  {
            searchTF.text = Shared.addressArrayAr[row]
        }
    }
}
