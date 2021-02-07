//
//  HomeView.swift
//  WallP-Unsplash-MVC
//
//  Created by ADMIN on 07/02/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class HomeView: UIView {
    let photoCollectionViewCell: PhotoCollectionViewCell
    private let padding: CGFloat = 1.0

    override init(frame: CGRect) {
        photoCollectionViewCell = PhotoCollectionViewCell()
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func registerCollectionView(collectionView: UICollectionView) {
        collectionView.backgroundColor = .white
        let photosNib = UINib(nibName: photoCollectionViewCell.identifier, bundle: nil)
        collectionView.register(photosNib, forCellWithReuseIdentifier: photoCollectionViewCell.identifier)
    }

    func compositionalLayout() -> UICollectionViewCompositionalLayout {
        let largeItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2 / 3),
                heightDimension: .fractionalHeight(1)
            )
        )
        largeItem.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)

        let doubleVerticalItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        doubleVerticalItem.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)

        let trippleHorizontalItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.3)
            )
        )
        trippleHorizontalItem.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)

        let trippleHorizontalItemGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize:
            NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.3)
            ),
            subitem: trippleHorizontalItem,
            count: 3
        )

        let doubleVerticalItemGroup = NSCollectionLayoutGroup.vertical(
            layoutSize:
            NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1 / 3),
                heightDimension: .fractionalHeight(1.0)
            ),
            subitem: doubleVerticalItem,
            count: 2
        )

        let arrayForLargeItemsGroup = [
            largeItem,
            doubleVerticalItemGroup,
        ].shuffled()

        let largeItemsGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.7)
            ),
            subitems: arrayForLargeItemsGroup
        )

        let arrayFormMasterGroup = [
            largeItemsGroup,
            trippleHorizontalItemGroup,
        ].shuffled()

        let masterGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(1.0)
            ),
            subitems: arrayFormMasterGroup
        )

        let section = NSCollectionLayoutSection(group: masterGroup)

        return UICollectionViewCompositionalLayout(section: section)
    }
}
