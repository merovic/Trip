//
//  NotificationsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import SideMenu
class NotificationsViewController: UIViewController {
    
    @IBOutlet weak var TabelView: UITableView!{
        didSet{
            TabelView.rowHeight = UITableView.automaticDimension
            TabelView.estimatedRowHeight = 150
            TabelView.sectionHeaderHeight = 20
            TabelView.sectionIndexColor = .black
            TabelView.separatorStyle = .none
        }
    }
    
    var notes: [Note]?
    
    //MARK:- viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    @IBAction func menu(_ sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigationController") as? SideMenuNavigationController {
            vc.settings = Shared.settings(view: self.view)
            present(vc, animated: true, completion: nil)
        }
    }
    
    //MARK:- get Notifications from API
    func getData(){
        if let id = Shared.user?.id {
            DispatchQueue.global().async { [weak self] in
                APIClient.getAllNoteByOwnerID(id_owner: id) { (Result) in
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
    }
}

//MARK:- tableView setUp
extension NotificationsViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! NotificationTableViewCell
        
        cell.dateLbl.text = notes?[indexPath.row].datee
        cell.messagelbl.text = notes?[indexPath.row].details
        cell.notNameLbl.text = notes?[indexPath.row].title
        return cell
    }
    
    //MARK:- didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NotificationDetails") as? NotificationDetailsViewController {
            vc.modalPresentationStyle = .overFullScreen
            vc.note = notes?[indexPath.row]
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension NotificationsViewController: NotificationsDelegate {
    func acceptNote(car_id: Int) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NewDetails") as? NewReservationDetailsViewController {
            vc.idCar = car_id
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func decilneNote() {
        getData()
    }
    
}
