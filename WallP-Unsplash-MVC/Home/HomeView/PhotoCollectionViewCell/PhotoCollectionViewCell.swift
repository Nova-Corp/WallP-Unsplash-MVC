//
//  PhotoCollectionViewCell.swift
//  WallP-Unsplash-MVC
//
//  Created by ADMIN on 07/02/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    let identifier: String = "PhotoCollectionViewCell"
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var creatorName: UILabel!
    @IBOutlet weak var likedByPeople: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }

}
