//
//  FriendsTableView.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 07.06.2021.
//

import UIKit

final class FriendsTableViewCell: UITableViewCell {
    static let identifier = "FriendsTableViewCell"
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var infoButton: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configure(_ user: User){
        avatarImageView.image = UIImage(systemName: user.image)
        nameLabel.text = user.name
    }
}
