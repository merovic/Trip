//
//  NotificationDetailsViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos
protocol NotificationsDelegate {
    func acceptNote(car_id: Int)
    func decilneNote()
}

class NotificationDetailsViewController: UIViewController {
    
    @IBOutlet weak var bigView: UIView!{
        didSet{
            bigView.layer.cornerRadius = 8
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
    
    var delegate: NotificationsDelegate?
    var note: Note?
    var user: Login?
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        getUserDetails()
    }
    
    //MARK:- viewWillAppear
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    //MARK:- IBActions
    
    @IBAction func acceptPressed(_ sender: UIButton) {
        if let car = note?.idCar {
            delegate?.acceptNote(car_id: car)
            self.dismiss(animated: true, completion: nil)

        }
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        
        self.view.backgroundColor = .clear
        dismiss(animated: true, completion: nil)
        
    }
    
    //MARK:- Delete Note
    @IBAction func rejectPressed(_ sender: UIButton) {
        if let note = note {
            DispatchQueue.main.async { [weak self] in
                APIClient.deleteNote(id: note.id) { (Result) in
                    switch Result {
                    case .success(let response):
                        print(response)
                        self?.delegate?.decilneNote()
                        self?.dismiss(animated: true, completion: nil)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
    
    //MARK:- get user details by id
    func getUserDetails() {
        if let note = note {
            DispatchQueue.main.async { [weak self] in
                APIClient.selectUserById(id_user: note.idUser) { (Result) in
                    switch Result{
                    case .success(let response):
                        print(response)
                        self?.user = response.first
                        self?.updateUserInfo()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func updateUserInfo(){
        if let user = user {
            phone.text = user.phone
            name.text = user.name
            image.sd_setImage(with: URL(string: user.img ?? ""), placeholderImage: UIImage(named: "userPlaceholder"))
            ratelbl.text = "Rate \(user.rate)"
            guard let rateing = Double(user.rate) else { return }
            rate.rating = rateing
        }
    }
    
    func updateView(){
        
        messageTitle.text = note?.title
        description1.text = note?.details
        descrtition2.text = ""
        
    }
}
