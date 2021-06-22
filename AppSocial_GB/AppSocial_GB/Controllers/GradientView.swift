//
//  GradientView.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 14.06.2021.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    @IBInspectable var startColor: UIColor = .white {
        didSet{
            self.updateColor()
        }
    }
    @IBInspectable var endColor: UIColor = .purple {
        didSet{
            self.updateColor()
        }
    }
    @IBInspectable var startLocation: CGFloat = 0 {
        didSet{
            self.updateLocation()
        }
    }
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet{
            self.updateLocation()
        }
    }
    @IBInspectable var startPoint: CGPoint = .zero {
        didSet{
            self.updateStartPoint()
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet{
            self.updateEndPoint()
        }
    }
    
    func updateLocation() {
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
    }
    
    func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint
    }
    
    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
    }
    
    func updateColor() {
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    
    
}
