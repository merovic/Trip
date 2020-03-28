//
//  HomeViewController.swift
//  Trip
//
//  Created by Ali Mohamed on 11/30/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage
import SideMenu
class HomeViewController: UIViewController {
    
    @IBOutlet weak var inviteFriend: UIButton!{didSet{Rounded.roundedCornerButton1(button: inviteFriend)}}
    @IBOutlet weak var recentCollectionView: UICollectionView!
    @IBOutlet weak var addCar: UIButton!{didSet{Rounded.roundedCornerButton1(button: addCar)}}
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    @IBOutlet weak var searchTF: DesignableUITextField!{
        didSet{
            searchTF.forceSwitchingRegardlessOfTag = true
        }
    }
    
    var latestCars: [Car]?
    var topRatedCars: [Car]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCars()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getCars()
    }
    
    @IBAction func addCarPressed(_ sender: UIButton) {
        let logged = Shared.getcheckLogin()
        if logged {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "AddCar") as? AddCarViewController {
                vc.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "LogIn") as? LogInViewController {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func addFriendPressed(_ sender: UIButton) {
        if let name = URL(string: "https://itunes.apple.com/us/app/Trip"), !name.absoluteString.isEmpty {
            let objectsToShare = [name]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func menuPressed(_ sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigationController") as? SideMenuNavigationController {
            vc.settings = Shared.settings(view: self.view)
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func search(_ sender: DesignableUITextField) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Search") as? SearchViewController {
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController( vc , animated: true)
        }
    }
    
    func getCars(){
        DispatchQueue.main.async { [ weak self ] in
            APIClient.getAllCars(number_of_select: 5) { (Result) in
                switch Result{
                case .success(let response):
                    print(response)
                    self?.latestCars = response
                    self?.recentCollectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            APIClient.getAllCarsByRate(number_of_select: 10) { (Result) in
                switch Result{
                case .success(let response):
//                    print(response)
                    self?.topRatedCars = response
                    self?.topRatedCollectionView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

//MARK:- collectionView SetUp
extension HomeViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 0 {
            return latestCars?.count ?? 0
        } else if collectionView.tag == 1{
            return topRatedCars?.count ?? 0
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellLatest", for: indexPath) as! RecentCollectionViewCell
            if let car = latestCars?[indexPath.row] {
                if  let rating = Double(car.rate) {
                    cell.rate.rating = rating
                }
                cell.image.sd_setImage(with: URL(string: car.image ), placeholderImage: UIImage(named: "carPlaceholder"))
                cell.name.text = car.model
                cell.price.attributedText = NSAttributedString.withDualText(text1: car.price_rent_per_day, ofSizeText1: 18, text2:"SR/Day".localized , ofSizeText2: 13)
                cell.trips.attributedText = NSAttributedString.withDualText(text1: car.number_of_trip , ofSizeText1: 14, text2: "Trips".localized, ofSizeText2: 10)
            }
            return cell
            
        } else if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTopRated", for: indexPath) as! TopRatedCollectionViewCell
            if let car = topRatedCars?[indexPath.row] {
                if  let rating = Double(car.rate) {
                    cell.rate.rating = rating
                }
                cell.image.sd_setImage(with: URL(string: car.image), placeholderImage: UIImage(named: "carPlaceholder"))
                cell.name.text = car.model
                cell.price.attributedText = NSAttributedString.withDualText(text1: car.price_rent_per_day, ofSizeText1: 18, text2:"SR/Day".localized , ofSizeText2: 13)
                cell.trips.attributedText = NSAttributedString.withDualText(text1: car.number_of_trip , ofSizeText1: 14, text2: "Trips".localized, ofSizeText2: 10)
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CarDetails") as! CarDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        switch collectionView.tag {
        case 0:
            vc.carDetails = latestCars?[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            vc.carDetails = topRatedCars?[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

extension NSAttributedString {
    static func withDualText(text1: String ,ofSizeText1: CGFloat ,text2: String ,ofSizeText2: CGFloat ) -> NSMutableAttributedString{
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: text1, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSizeText1)]))
        text.append(NSAttributedString(string: text2, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray , NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSizeText2)]))
        return text
    }
    
    static func withDualText2(text1: String ,ofSizeText1: CGFloat ,text2: String ,ofSizeText2: CGFloat ) -> NSMutableAttributedString{
        let text = NSMutableAttributedString()
        
        text.append(NSAttributedString(string: text1, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray , NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSizeText1)]))
        text.append(NSAttributedString(string: text2, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSizeText2)]))
        
        return text
    }
    
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
