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
class HomeViewController: UIViewController {

    @IBOutlet weak var recentCollectionView: UICollectionView!
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var backView: UIView!
    
    var latestCars: [Car]?
    var topRatedCars: [Car]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCars()
    }
    
    @IBAction func addCarPressed(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "AddCar") as! AddCarViewController
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func addFriendPressed(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "AddFriend") as! InviteFriendViewController
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func menuPressed(_ sender: UIBarButtonItem) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "SideMenuNavigationController")
            present(vc!, animated: true, completion: nil)
        }
    }
    
    @IBAction func searchTapped(_ sender: UITextField) {
        
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
                    print("FAILLLLLLLLLLL")
                    print(error.localizedDescription)
                }
            }
            APIClient.getAllCarsByRate(number_of_select: 20) { (Result) in
                switch Result{
                    case .success(let response):
                        print(response)
                        self?.topRatedCars = response
                        self?.topRatedCollectionView.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
        }
    }
}


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
            let car = latestCars?[indexPath.row]
            if let rate = car?.rate , let rating = Double(rate) {
                cell.rate.rating = rating
            }
            cell.image.sd_setImage(with: URL(string: car?.image ?? ""), placeholderImage: UIImage(named: "carPlaceholder"))
            cell.name.text = car?.stName
            cell.price.text = car?.priceRentPerDay
            cell.trips.text = car?.numberOfTrip
            return cell
        } else if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTopRated", for: indexPath) as! TopRatedCollectionViewCell
            if let car = topRatedCars?[indexPath.row] {
                if  let rating = Double(car.rate) {
                    cell.rate.rating = rating
                }
                cell.image.sd_setImage(with: URL(string: car.image), placeholderImage: UIImage(named: "carPlaceholder"))
                cell.name.text = car.stName
                cell.price.text = car.priceRentPerDay
                cell.trips.text = car.numberOfTrip
            }

            return cell
        }
    return UICollectionViewCell()
    }
}
