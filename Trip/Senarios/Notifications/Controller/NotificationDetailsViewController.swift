//
//  NotificationDetailsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos
@available(iOS 13.0, *)
class NotificationDetailsViewController: UIViewController {

    @IBOutlet weak var rejectBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: rejectBut)
        }
    }
    @IBOutlet weak var acceptBut: UIButton!{
        didSet{
            Rounded.roundedCornerButton1(button: acceptBut)
        }
    }
    @IBOutlet weak var descrtition2: UILabel!
    @IBOutlet weak var description1: UILabel!
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var trips: UILabel!
    @IBOutlet weak var ratelbl: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!{
        didSet{
            Rounded.roundedImage(imageView: image)
        }
    }
    var note: Note?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    func updateView(){
        
        messageTitle.text = note?.title
        description1.text = note?.details
    }
    
    func getUserDetails() {
        
    }
    
    @IBAction func acceptPressed(_ sender: UIButton) {
        print("////////////")
        
        let vc = storyboard?.instantiateViewController(identifier: "NewDetails") as! NewReservationDetailsViewController
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func rejectPressed(_ sender: UIButton) {
        APIClient.refuseRequest(id_request: note?.id ?? 0) { (Result) in
            switch Result {
            case .success(let response):
                print(response)
                self.dismiss(animated: true, completion: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
