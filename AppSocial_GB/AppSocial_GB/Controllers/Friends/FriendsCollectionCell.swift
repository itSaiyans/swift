//
//  FriendsCollectionCell.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 10.06.2021.
//

import UIKit

final class FriendsCollectionCell: UICollectionViewCell {
    static let identifier = "FriendsCollectionCell"
    
    @IBOutlet weak var collectionImage: UIImageView!
    
    func configure(_ user: User){
        collectionImage.image = UIImage(systemName: user.image)
    }
}
