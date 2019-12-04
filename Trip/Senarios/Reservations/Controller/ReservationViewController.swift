//
//  ReservationViewController.swift
//  Trip
//
//  Created by Mustafa on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {
    
    @IBOutlet weak var reservationSegmented: UISegmentedControl!
    @IBOutlet weak var reservationTableView: UITableView!
    
    var requestAgreed: [RequestAgree]?
    var requestFinished: [RequestAgree]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getAgreedRequests(){
        if let user = Shared.user {
            APIClient.selectRequestHaveAgreedByUserId(id_user: user.id) { (Result) in
                switch Result{
                case .success(let response):
                    print(response)
                    self.reservationTableView.reloadData()
                    self.requestAgreed = response
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }

        }
    }
     
    func getFinishedRequests(){
        if let user = Shared.user {
            APIClient.selectRequestHaveEndTripByIdUser(id_user: user.id) { (Result) in
                switch Result{
                case .success(let ressponse):
                    print(ressponse)
                    self.requestFinished = ressponse
                    self.reservationTableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
    
    @IBAction func reservationsSegChanged(_ sender: UISegmentedControl) {
        if sender.tag == 0 {
            getAgreedRequests()
        } else {
            getFinishedRequests()

        }
    }
    
    
    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
            present(vc!, animated: true, completion: nil)
        }
    }
}


extension ReservationViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if reservationSegmented.selectedSegmentIndex == 0 {
            return requestAgreed?.count ?? 0
        } else {
            return requestFinished?.count ?? 0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        reservationTableView.register(UINib(nibName: "CurrentReservationTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrentReservationTableViewCell")
               reservationTableView.register(UINib(nibName: "PreviousReservationTableViewCell", bundle: nil), forCellReuseIdentifier: "PreviousReservationTableViewCell")
        if reservationSegmented.selectedSegmentIndex == 0 {
            let  cell = tableView.dequeueReusableCell(withIdentifier: "CurrentReservationTableViewCell", for: indexPath) as! CurrentReservationTableViewCell
            cell.addressReservation.text = requestAgreed?[indexPath.row].agrreOrRefuse
            
            return cell
        } else {
            let  cell = tableView.dequeueReusableCell(withIdentifier: "PreviousReservationTableViewCell", for: indexPath) as! PreviousReservationTableViewCell
            cell.addressReservation.text = requestFinished?[indexPath.row].agrreOrRefuse
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        reservationTableView.rowHeight = UITableView.automaticDimension
        reservationTableView.estimatedRowHeight = 120
    }
    
    
}
