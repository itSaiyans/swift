//
//  LikeButton.swift
//  AppSocial_GB
//
//  Created by Stas Danilov
//

import UIKit
import Foundation

class LikeButton: UIButton {
    
    var counter = 0
    var liked = false
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setNeedsDisplay()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setNeedsDisplay()
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    private func configure() {
        
        self.setTitle("\(liked ? "♥" : "♡") \(counter)", for: .normal)
        
        self.backgroundColor = liked ? UIColor.systemPink : UIColor.clear
        self.setTitleColor(liked ? UIColor.white : UIColor.gray, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
        
        addTarget(self, action: #selector(onTap(_:)), for: .touchUpInside)
    }
    
    @objc func onTap(_ sender: UIButton) {
        
        self.liked.toggle()
        self.counter += self.liked ? 1 : -1
        
        LikeButton.animate(withDuration: 0.6,
                           animations: {
                            self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                           },
                           completion: { _ in
                            UIView.animate(withDuration: 0.6) {
                                self.transform = CGAffineTransform.identity
                            }
                           })
        
    }
    
}
