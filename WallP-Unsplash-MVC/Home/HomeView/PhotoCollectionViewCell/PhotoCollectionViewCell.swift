//
//  PhotoCollectionViewCell.swift
//  WallP-Unsplash-MVC
//
//  Created by ADMIN on 07/02/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    let identifier: String
    
    override init(frame: CGRect) {
        identifier = "PhotoCollectionViewCell"
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        identifier = "PhotoCollectionViewCell"
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
