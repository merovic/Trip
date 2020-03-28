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
    
    var arrayText = ["egy" , "bra" , "alg" , "mrc" ]
    var allCarsByCity  : AllCarsByCity?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchTF.becomeFirstResponder()
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        /*
        if searchTF.text != "" {
            
            DispatchQueue.main.async { [weak self] in
                APIClient.getAllCarsByCity(city: self?.searchTF.text ?? "") { (Result) in
                    switch Result {
                    case .success(let response):
                        print(response)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
 */
            
        getSearch()
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
        cell.textLable.text = allCarsByCity?[indexPath.row].owner
                 return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchTF.text = allCarsByCity?[indexPath.row].owner
    }
    
}
