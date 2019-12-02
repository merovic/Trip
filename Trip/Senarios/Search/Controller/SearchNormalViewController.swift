//
//  SearchNormalViewController.swift
//  Trip
//
//  Created by Mustafa on 12/2/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class SearchNormalViewController: UIViewController {
    
    @IBOutlet var currentView: UIView!
    var arrayText = ["egy" , "bra" , "alg" , "mrc" ]

    @IBOutlet weak var srarchBarText: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
}
