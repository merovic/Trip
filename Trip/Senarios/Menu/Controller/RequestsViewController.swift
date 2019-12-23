//
//  RequestsViewController.swift
//  Trip
//
//  Created by Mustafa on 12/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import SideMenu

@available(iOS 13.0, *)
class RequestsViewController: UIViewController {
    
    @IBOutlet weak var requestTableView: UITableView!
    
    var requests: [Request]?
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
//MARK:- get requests by id owner
    func getData(){
        if let user = Shared.user {
            DispatchQueue.main.async { [weak self] in
                APIClient.selectAllRequestByOwnerId(id_owner: user.id) { (Result) in
                    switch Result{
                    case.success(let response):
                        print("///////////////////////////////////////////// \(response)")
                        print(user)
                        self?.requests = response
                        self?.requestTableView.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    
    @IBAction func menuBtnPreseed(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController") as! SideMenuNavigationController
        vc.settings = Shared.settings(view: self.view)
        present(vc, animated: true, completion: nil)
    }
    
}

//MARK:- tableView setUp
@available(iOS 13.0, *)
extension RequestsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "RequestCellTableViewCell", for: indexPath) as! RequestCellTableViewCell
        
        let request = requests?[indexPath.row]
        
        let date = Shared.converDate(date: request?.datee ?? "")
        
        cell.photo.sd_setImage(with: URL(string: request?.image ?? ""), placeholderImage: UIImage(named:"userPlaceholder"))
        cell.rateLbl.text = "Rate \(request?.rate ?? "")"
        cell.requestDateLabl.text = date[0]
        cell.requestNameLbl.text = request?.message
        cell.nameLbl.text = request?.name
        cell.idRequest = request?.id
        cell.delegate = self
        if let rating = Double(request?.rate ?? "0") {
            cell.rate.rating = rating
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        requestTableView.rowHeight = UITableView.automaticDimension
        requestTableView.estimatedRowHeight = 220
    }
}

//MARK:- request cell protocol methodes
@available(iOS 13.0, *)
extension RequestsViewController: RequestCellDelegate {
    
    func acceptRequest(id: Int) {
        print(id)
        DispatchQueue.global().async { [weak self] in
            APIClient.agrre_request(id_request: id) { (Result) in
                switch Result {
                case .success(let response):
                    print(response)
                    if response == "True" {
                        Alert.show("Done", massege: "", context: self!)
                        self?.getData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func refuseRequest(id: Int) {
        DispatchQueue.global().async { [weak self] in
            APIClient.refuseRequest(id_request: id) { (Result) in
                switch Result {
                case .success(let response):
                    print(response)
                    Alert.show("Deleted", massege:"", context: self!)
                    self?.getData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
