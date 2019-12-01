//
//  TopRatedCollectionViewCell.swift
//  Trip
//
//  Created by Ali Mohamed on 11/30/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos
class TopRatedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!{
        didSet{
            image.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var trips: UILabel!
}
