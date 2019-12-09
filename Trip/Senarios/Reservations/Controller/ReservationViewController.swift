//
//  ReservationViewController.swift
//  Trip
//
//  Created by Mustafa on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import SideMenu

class ReservationViewController: UIViewController {
    
    @IBOutlet weak var reservationSegmented: UISegmentedControl!
    @IBOutlet weak var reservationTableView: UITableView!
    
    var requestAgreed: [RequestAgree]?
    var requestFinished: [RequestAgree]?
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        getAgreedRequests()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reservationSegmented.selectedSegmentIndex = 0
        reservationsSegChanged(reservationSegmented)
    }
    
    //MARK:- IBActions
    @IBAction func reservationsSegChanged(_ sender: UISegmentedControl) {
        if reservationSegmented.selectedSegmentIndex == 0 {
            getAgreedRequests()
            self.reservationTableView.reloadData()
        } else {
            getFinishedRequests()
            
        }
    }
    
    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController") as! SideMenuNavigationController
            vc.settings = Shared.settings(view: self.view)
            present(vc, animated: true, completion: nil)
        }
    }
    
    // get requests that have agreed by id user
    func getAgreedRequests(){
        if let user = Shared.user {
            DispatchQueue.global().async {
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
    }
    
    
    func getFinishedRequests(){
        if let user = Shared.user {
            DispatchQueue.global().async {
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
    }
}

//MARK:- tableView setUp
extension ReservationViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if reservationSegmented.selectedSegmentIndex == 0 {
            return requestAgreed?.count ?? 0
        } else {
            return requestFinished?.count ?? 0
        }
    }
    
    //MARK:- cellForRawAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if reservationSegmented.selectedSegmentIndex == 0 {
            reservationTableView.register(UINib(nibName: "CurrentReservationTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrentReservationTableViewCell")
            let  cell = tableView.dequeueReusableCell(withIdentifier: "CurrentReservationTableViewCell", for: indexPath) as! CurrentReservationTableViewCell
            cell.addressReservation.text = requestAgreed?[indexPath.row].agrreOrRefuse
            cell.idRequest = requestAgreed?[indexPath.row].id
            cell.idCar = requestAgreed?[indexPath.row].idCar
            cell.delegate = self
            return cell
        } else {
            reservationTableView.register(UINib(nibName: "PreviousReservationTableViewCell", bundle: nil), forCellReuseIdentifier: "PreviousReservationTableViewCell")
            let  cell = tableView.dequeueReusableCell(withIdentifier: "PreviousReservationTableViewCell", for: indexPath) as! PreviousReservationTableViewCell
            cell.addressReservation.text = requestFinished?[indexPath.row].agrreOrRefuse
            cell.idCar = requestAgreed?[indexPath.row].idCar
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        reservationTableView.rowHeight = UITableView.automaticDimension
        reservationTableView.estimatedRowHeight = 120
    }
}

//MARK:- extrntion - change Current and previous Reservation views
extension ReservationViewController: CurrentReservationDelegate , PreviosReservationCellDelegate {
    
    func previosReservationDetails(id: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewDetails") as! NewReservationDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.idCar = id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func startTrip(id: Int) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "StartReservation") as! StartPopUp
            vc.modalPresentationStyle = .overFullScreen
            vc.idRequest = id
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func details(id: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewDetails") as! NewReservationDetailsViewController
        vc.idCar = id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
