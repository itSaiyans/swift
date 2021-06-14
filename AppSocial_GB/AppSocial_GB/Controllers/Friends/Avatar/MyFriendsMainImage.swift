//
//  MyFriendsMainImage.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 14.06.2021.
//

import UIKit

@IBDesignable class MyFriendsMainImage: UIView {
    
    @IBInspectable var radius: CGFloat = 30 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 30
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 7
        layer.shadowOffset = CGSize(width: 5, height: 5)
        
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
