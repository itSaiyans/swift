//
//  GroupsTableViewCell.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 10.06.2021.
//

import UIKit

final class GroupsTableViewCell: UITableViewCell {
    static let identifier = "GroupsTableViewCell"
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupInfoButton: UIButton!
    
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
    
    func configure(_ group: Group){
        groupImage.image = UIImage(systemName: group.image)
        groupLabel.text = group.name
    }
}
