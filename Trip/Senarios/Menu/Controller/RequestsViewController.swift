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
    var text = ["12" , "23" , "34"]

    @IBOutlet weak var requestTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestTableView.rowHeight = UITableView.automaticDimension
        requestTableView.estimatedRowHeight = 220



        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func menuBtnPreseed(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
                   present(vc!, animated: true, completion: nil)
    }
    
}

@available(iOS 13.0, *)
extension RequestsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let  cell = tableView.dequeueReusableCell(withIdentifier: "RequestCellTableViewCell", for: indexPath) as! RequestCellTableViewCell
        cell.requestNameLbl.text = text[indexPath.row]
         return cell
    }
    
    
}
