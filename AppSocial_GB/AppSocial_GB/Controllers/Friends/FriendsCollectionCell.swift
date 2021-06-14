//
//  FriendsCollectionCell.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 10.06.2021.
//

import UIKit

final class FriendsCollectionCell: UICollectionViewCell {
    static let identifier = "FriendsCollectionCell"
    
    @IBOutlet private weak var collectionImageView: UIImageView!
    
    func configure(_ photo: UserAlbum){
        collectionImageView.image = UIImage(systemName: photo.photo)
    }
}
