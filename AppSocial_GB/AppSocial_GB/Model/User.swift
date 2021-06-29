//
//  User.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 10.06.2021.
//

import UIKit

struct User {
    var id: Int
    var image: String
    var name: String
    var friends: [UserAlbum] = [UserAlbum(photo: "airpodspro"),
                                UserAlbum(photo: "airpodspro"),
                                UserAlbum(photo: "airpodspro"),
                                UserAlbum(photo: "airpodspro")
    ]
}

struct UsersDataStorage {
   static let shared = UsersDataStorage()
    
   var users: [User]
    
    private init() {
        users = [
            User(id: 1, image: "heart", name: "Viktoria"),
            User(id: 2, image: "person", name: "Stanislav"),
            User(id: 3, image: "person.crop.circle.badge.checkmark", name: "Daniil"),
            User(id: 4, image: "eyes", name: "Leonid"),
            User(id: 5, image: "mustache.fill", name: "Artem"),
            User(id: 6, image: "figure.walk", name: "Elena"),
            User(id: 7, image: "face.smiling", name: "Ivan"),
            User(id: 8, image: "person.icloud", name: "Maksim")
        ]
    }
}
