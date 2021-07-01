//
//  Group.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 10.06.2021.
//

import UIKit

struct Group {
    var image: String
    var name: String
}

struct GroupsDataStorage {
   static let shared = GroupsDataStorage()
    
    var groups: [Group]
    var allGroups: [Group]
    
    private init() {
        groups = [
            Group(image: "bolt", name: "Sity"),
            Group(image: "bolt", name: "123"),
            Group(image: "bolt", name: "7830"),
        ]
        
        allGroups = [
            Group(image: "gamecontroller", name: "Gamers"),
            Group(image: "music.note", name: "Love Music"),
            Group(image: "car", name: "Travelers"),
            Group(image: "bolt", name: "SPB Festivals"),
            Group(image: "newspaper", name: "IOS News"),
            Group(image: "display.2", name: "Work SPB")
        ]
    }
}
