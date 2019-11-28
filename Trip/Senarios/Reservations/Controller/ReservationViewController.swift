//
//  ReservationViewController.swift
//  Trip
//
//  Created by Mustafa on 11/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {
    
    var name1 = ["Bra" , "Arg" , "Fra" , "Ita" , "Pol"]
    var name2 = ["Barcelona" , "ManCity" , "InterMailan" ]


    @IBOutlet weak var reservationSegmented: UISegmentedControl!
    
    @IBOutlet weak var reservationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         reservationTableView.register(UINib(nibName: "CurrentReservationTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrentReservationTableViewCell")
         reservationTableView.register(UINib(nibName: "PreviousReservationTableViewCell", bundle: nil), forCellReuseIdentifier: "PreviousReservationTableViewCell")
               reservationTableView.rowHeight = UITableView.automaticDimension
        reservationTableView.estimatedRowHeight = 500


        // Do any additional setup after loading the view.
    }
    

    @IBAction func reservationsSegChanged(_ sender: UISegmentedControl) {
        reservationTableView.reloadData()
    }
    
    @IBAction func menuBtn(_ sender: UIBarButtonItem) {
    }
}


extension ReservationViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if reservationSegmented.selectedSegmentIndex == 0 {
            return name1.count
        } else {
            return name2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if reservationSegmented.selectedSegmentIndex == 0 {
                let  cell = tableView.dequeueReusableCell(withIdentifier: "CurrentReservationTableViewCell", for: indexPath) as! CurrentReservationTableViewCell
            cell.addressReservation.text = name1[indexPath.row]
                     return cell
            } else {
                let  cell = tableView.dequeueReusableCell(withIdentifier: "PreviousReservationTableViewCell", for: indexPath) as! PreviousReservationTableViewCell
            cell.addressReservation.text = name2[indexPath.row]
                                return cell
            }
    }

    
    
}
