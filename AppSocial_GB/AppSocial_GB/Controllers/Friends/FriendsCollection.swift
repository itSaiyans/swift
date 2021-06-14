//
//  FriendsCollection.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 10.06.2021.
//

import UIKit

class FriendsCollection: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var friends: [UserAlbum] = []
}

extension FriendsCollection: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsCollectionCell.identifier, for: indexPath) as! FriendsCollectionCell
        
        cell.configure(friends[indexPath.item])
        
        return cell
    }
}
