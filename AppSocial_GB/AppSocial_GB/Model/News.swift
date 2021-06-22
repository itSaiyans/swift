//
//  News.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 22.06.2021.
//

import UIKit

struct News {
    let id: Int
    let userId: Int
    let date: String
    let text: String
    let imageName: String?
    let likesCount: Int
    let likedNews: Bool
    let viewsCount: Int
}

struct NewsDataStorage {
    static let shared = NewsDataStorage()
    
    var news: [News]
    
    private init(){
        news = [News(id: 1, userId: 1, date: "22.06.2021", text: "News newsnes", imageName: "newspaper", likesCount: 0, likedNews: false, viewsCount: 0),
                News(id: 2, userId: 2, date: "21.06.2021", text: "2News newsnes", imageName: "newspaper", likesCount: 0, likedNews: false, viewsCount: 0),
                News(id: 3, userId: 3, date: "21.06.2021", text: "3News newsnes", imageName: "newspaper", likesCount: 0, likedNews: false, viewsCount: 0),
                News(id: 4, userId: 4, date: "22.06.2021", text: "4News newsnes", imageName: "newspaper", likesCount: 0, likedNews: false, viewsCount: 0),
                News(id: 5, userId: 5, date: "20.06.2021", text: "5News newsnes", imageName: "newspaper", likesCount: 0, likedNews: false, viewsCount: 0),
                News(id: 6, userId: 6, date: "20.06.2021", text: "6News newsnes", imageName: "newspaper", likesCount: 0, likedNews: false, viewsCount: 0)
        ]
        
    }
}

