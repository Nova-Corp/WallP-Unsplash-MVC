//
//  HomeViewController.swift
//  WallP-Unsplash-MVC
//
//  Created by ADMIN on 07/02/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController {

    let homeView = HomeView()
    let homeDataModel = HomeDataModel()
    
    var homeData: [PhotoList]?
    
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
        
        homeDataModel.delegate = self
        homeDataModel.fetchImageListFromServer()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, HomeDataSource {
    func didReceiveHomeData(from dataModel: [PhotoList]) {
        homeData = dataModel
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeData?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeView.photoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
       
        let data = homeData?[indexPath.item]
        
        cell.imageTitle.text = data?.altDescription
        cell.creatorName.text = "by \(data?.user?.firstName ?? "") \(data?.user?.lastName ?? "")"
        cell.likedByPeople.text = "\(data?.likes ?? 0)"
        cell.mainImageView.downloaded(from: data?.imageURLs.thumb ?? Home.imagePlaceHolderURL, contentMode: .scaleAspectFill)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
