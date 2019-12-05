//
//  RequestsViewController.swift
//  Trip
//
//  Created by Mustafa on 12/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class RequestsViewController: UIViewController {
    var requests: [Request]?
    
    @IBOutlet weak var requestTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        if let user = Shared.user {
            DispatchQueue.main.async { [weak self] in
                APIClient.selectAllRequestByOwnerId(id_owner: user.id) { (Result) in
                    switch Result{
                    case.success(let response):
                        print("///////////////////////////////////////////// \(response)")
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
        let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
        present(vc!, animated: true, completion: nil)
    }
    
}

@available(iOS 13.0, *)
extension RequestsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "RequestCellTableViewCell", for: indexPath) as! RequestCellTableViewCell
        let request = requests?[indexPath.row]
        
        cell.photo.sd_setImage(with: URL(string: request?.image ?? ""), placeholderImage: UIImage(named:"userPlaceholder"))
        //            cell.rate.rating = request.rate
        cell.rateLbl.text = "Rate \(request?.rate ?? "")"
        cell.requestDateLabl.text = request?.datee
        cell.requestNameLbl.text = request?.message
        cell.nameLbl.text = request?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        requestTableView.rowHeight = UITableView.automaticDimension
        requestTableView.estimatedRowHeight = 220
    }
    
    
}
