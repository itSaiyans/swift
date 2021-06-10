//
//  User.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 10.06.2021.
//

import UIKit

struct User {
    var image: String
    var name: String
}

struct UsersDataStorage {
   static let shared = UsersDataStorage()
    
   var users: [User]
    
    private init() {
        users = [
            User(image: "heart", name: "Viktoria"),
            User(image: "person", name: "Stanislav"),
            User(image: "person.crop.circle.badge.checkmark", name: "Daniil"),
            User(image: "eyes", name: "Leonid"),
            User(image: "mustache.fill", name: "Artem"),
            User(image: "figure.walk", name: "Elena"),
            User(image: "face.smiling", name: "Ivan"),
            User(image: "person.icloud", name: "Maksim")
        ]
    }
}
