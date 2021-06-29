//
//  SectionHeaderTableView.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 15.06.2021.
//

import UIKit

class SectionHeaderTableView: UITableViewHeaderFooterView {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 3
        titleLabel.layer.cornerRadius = 5
        titleLabel.backgroundColor = .orange
        titleLabel.layer.shadowRadius = 3
        titleLabel.layer.shadowColor = UIColor.yellow.cgColor
        titleLabel.layer.shadowOpacity = 0.5
        return titleLabel
    }()
 
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0)
        ])
    }
}
