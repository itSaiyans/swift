//
//  ViewingNewsCounter.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 22.06.2021.
//

import UIKit

class ViewingNewsCounter: UIButton {
    
    var counter = 0
    var seen = false
    
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

        self.setTitle("\(seen ? "􀋮" : "􀋭") \(counter)", for: .normal)
        self.backgroundColor = UIColor.clear
        self.setTitleColor(UIColor.gray, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
        
    }
    @objc func onTap(_ sender: UIButton) {
        
        self.seen.toggle()
        self.counter += self.seen ? 1 : -1
    }
    
}
