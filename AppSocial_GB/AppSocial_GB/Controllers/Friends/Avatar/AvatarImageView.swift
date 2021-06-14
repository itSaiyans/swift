//
//  AvatarImageView.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 14.06.2021.
//

import UIKit

@IBDesignable class AvatarImageView: UIImageView {
    
    @IBInspectable var radius: CGFloat = 30 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override init (frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 30
        layer.masksToBounds = true
    }
    
}
