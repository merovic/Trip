//
//  SearchNormalViewController.swift
//  Trip
//
//  Created by Mustafa on 12/2/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class SearchNormalViewController: UIViewController {
    
    @IBOutlet weak var searchTF: DesignableUITextField!
    @IBOutlet var currentView: UIView!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: searchBut)
        }
    }
    
    var arrayText = ["egy" , "bra" , "alg" , "mrc" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
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
    }
    
}

extension SearchNormalViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "SearchCellTableViewCell", for: indexPath) as! SearchCellTableViewCell
        cell.textLable.text = arrayText[indexPath.row]
                 return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchTF.text = arrayText[indexPath.row]
    }
    
}
