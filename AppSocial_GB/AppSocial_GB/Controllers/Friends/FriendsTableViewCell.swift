//
//  FriendsTableView.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 07.06.2021.
//

import UIKit

final class FriendsTableViewCell: UITableViewCell {
    static let identifier = "FriendsTableViewCell"
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    @objc func didTap() {
        isUserInteractionEnabled = false
        layer.removeAllAnimations()
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.isUserInteractionEnabled = true
        }
        
        let squeezeAnimation = CABasicAnimation()
        squeezeAnimation.keyPath = "transform.scale"
        squeezeAnimation.duration = 0.3
        squeezeAnimation.fromValue = 1
        squeezeAnimation.toValue = 0.7
        
        let restoreAnimation = CASpringAnimation()
        restoreAnimation.keyPath = "transform.scale"
        restoreAnimation.fromValue = 0.7
        restoreAnimation.toValue = 1
        restoreAnimation.duration = 1.3
        restoreAnimation.damping = 3
        restoreAnimation.initialVelocity = 1
        
        let tapAnimation = CAAnimationGroup()
        tapAnimation.animations = [squeezeAnimation, restoreAnimation]
        tapAnimation.duration = 1.6
        layer.add(tapAnimation, forKey: nil)
        CATransaction.commit()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        //error
        //avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(_ user: User){
        avatarImageView.image = UIImage(systemName: user.image)
        nameLabel.text = user.name
    }
}
