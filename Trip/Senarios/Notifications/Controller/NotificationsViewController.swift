//
//  NotificationsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    @IBOutlet weak var TabelView: UITableView!{
        didSet{
            TabelView.rowHeight = UITableView.automaticDimension
            TabelView.estimatedRowHeight = 150
            
        }
    }
    
    var notes: [Note]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }
    
    func getData(){
        DispatchQueue.global().async { [weak self] in
            APIClient.getAllNoteByOwnerID(id_owner: 5) { (Result) in
                switch Result {
                case .success(let response):
                    print(response)
                    self?.notes = response
                    self?.TabelView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    
    @IBAction func menu(_ sender: UIBarButtonItem) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
            present(vc!, animated: true, completion: nil)
        }
    }
    
}


extension NotificationsViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! NoticicationsTableViewCell
        
        cell.dateLbl.text = notes?[indexPath.row].datee
        cell.messagelbl.text = notes?[indexPath.row].details
        
        return cell
    }
    
    
}
