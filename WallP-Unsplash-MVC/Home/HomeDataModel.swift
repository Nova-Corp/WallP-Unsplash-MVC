//
//  HomeDataModel.swift
//  WallP-Unsplash-MVC
//
//  Created by ADMIN on 07/02/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import Foundation

struct Home {
    static let title = "Home"
    
//    static let randomPhotoListURL = "https://api.unsplash.com/photos"
    static let randomPhotoListURL = "https://next.json-generator.com/api/json/get/4J2Ib9Fe9"
    
    static let imagePlaceHolderURL = "https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png"
    
    static let header = [
        "Authorization": "Client-ID 038865ae4edb7c4e2aeb2af607e890526108163ad9a40a13da98ca1185404d03",
        "Accept": "application/json"
    ]
}

protocol HomeDataSource {
    func didReceiveHomeData(from dataModel: [PhotoList] )
}

class HomeDataModel {
    var delegate: HomeDataSource?
    
    func fetchImageListFromServer() {
        APIManager.shared.fetchData(url: Home.randomPhotoListURL, header: Home.header, method: "GET"){ data, error in
            
            let decoder = JSONDecoder()
            guard let data = data else {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let photosList = try decoder.decode([PhotoList].self, from: data)
                self.delegate?.didReceiveHomeData(from: photosList)
            }catch let err{
                print(err)
            }
            
        }
    }
}

struct PhotoList: Codable {
    let id: String
    let createdAt, updatedAt: String?
    let color: String?
    let altDescription: String?
    let imageURLs: ImageUrls
    
    let likes: Int?
    let user: PhotosCreator?
    
    enum CodingKeys: String, CodingKey {
        case id, color, likes, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case altDescription = "alt_description"
        case imageURLs = "urls"
    }
}

struct ImageUrls: Codable {
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
}

struct PhotosCreator: Codable {
    let id: String?
    let updatedAt: String?
    let username: String?
    let name: String?
    let firstName: String?
    let lastName: String?
    let bio: String?
    let location: String?
    let profileImage: PhotosCreatorProfileImage
    
    enum CodingKeys: String, CodingKey {
        case id, username, name, bio, location
        case updatedAt = "updated_at"
        case firstName = "first_name"
        case lastName = "last_name"
        case profileImage = "profile_image"
    }
}

struct PhotosCreatorProfileImage: Codable {
    let small: String?
    let medium: String?
    let large: String?
}
