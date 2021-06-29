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
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        FriendsTableViewCell.animate(withDuration: 0.5,
                                     delay: 0,
                                     usingSpringWithDamping: 0.2,
                                     initialSpringVelocity: 0.5,
                                     options: [.allowUserInteraction],
                                     animations: {
                                        self.avatarImageView.bounds = self.avatarImageView.bounds.insetBy(dx: 34, dy: 34)
                                     },
                                     completion: nil)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(FriendsTableViewCell.tapFunction))
        //error
        
      //  avatarImageView.isUserInteractionEnabled = true
       // avatarImageView.addGestureRecognizer(tap)
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
