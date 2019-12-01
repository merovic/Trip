//
//  CarDetailsViewController.swift
//  Trip
//
//  Created by Mustafa on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Auk

class CarDetailsViewController: UIViewController {

    @IBOutlet weak var detailsCarView: UIView!
    @IBOutlet weak var imageCarSlider: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        readius()
      
               imageCarSlider.auk.show(url: "https://scarfi-hijabs.com/wp-content/uploads/2019/10/4.jpg")
        if let image = UIImage(named: "map1.jpg") {
                 imageCarSlider.auk.show(image: image)
               }
        if let image = UIImage(named: "map2.jpg") {
          imageCarSlider.auk.show(image: image)
        }
               //

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
    func readius() {
           detailsCarView.layer.cornerRadius = 30
           detailsCarView.clipsToBounds = true
       }

}
