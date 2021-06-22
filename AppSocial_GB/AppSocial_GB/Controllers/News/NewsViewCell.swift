//
//  NewsViewCell.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 22.06.2021.
//

import UIKit

class NewsViewCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var pubDate: UILabel!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(news: News) {
        
        userImage.image = UIImage(systemName: "earpods.fill")
        userName.text = String(UsersDataStorage.shared.users.filter{ $0.id == news.userId}[0].name)
        pubDate.text = news.date
        newsText.text = news.text
        newsImage.image = UIImage(systemName: "newspaper")

    }
}
