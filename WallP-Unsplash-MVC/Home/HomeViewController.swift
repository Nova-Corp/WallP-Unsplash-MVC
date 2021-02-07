//
//  HomeViewController.swift
//  WallP-Unsplash-MVC
//
//  Created by ADMIN on 07/02/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let homeView = HomeView()
    
    init() {
        super.init(collectionViewLayout: homeView.compositionalLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.title = Home.title
        homeView.registerCollectionView(collectionView: collectionView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeView.photoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        return cell
        
    }
}
