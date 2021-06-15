//
//  FriendsCollectionCell.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 10.06.2021.
//

import UIKit

final class FriendsCollectionCell: UICollectionViewCell {
    static let identifier = "FriendsCollectionCell"
    
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    func configure(_ photo: UserAlbum){
        collectionImageView.image = UIImage(systemName: photo.photo)
    }
    
    @IBAction func likeButtonTouch(_ sender: UIButton) {
        if likeButton.tag == 0 {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tag = 1
        } else {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tag = 0
        }
    }
}
