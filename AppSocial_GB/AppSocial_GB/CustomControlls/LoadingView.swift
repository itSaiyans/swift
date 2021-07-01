//
//  LoadingView.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 01.07.2021.
//

import UIKit

class LoadingView: UIViewController {
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let time = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: time, execute: closure)
    }

    @IBOutlet weak var loadingPointView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loadPoint1 = UIView()
        let loadPoint2 = UIView()
        let loadPoint3 = UIView()
        
        let pointSize = 30
        
        loadPoint1.backgroundColor = UIColor.systemGray
        loadPoint2.backgroundColor = loadPoint1.backgroundColor
        loadPoint3.backgroundColor = loadPoint1.backgroundColor
        
        loadPoint1.layer.cornerRadius = CGFloat(pointSize / 2)
        loadPoint2.layer.cornerRadius = loadPoint1.layer.cornerRadius
        loadPoint3.layer.cornerRadius = loadPoint1.layer.cornerRadius
        
        loadPoint1.alpha = 0.5
        loadPoint2.alpha = loadPoint1.alpha
        loadPoint3.alpha = loadPoint1.alpha
        
        loadPoint1.frame = CGRect(x: 0, y: 10, width: pointSize, height: pointSize)
        loadPoint2.frame = CGRect(x: pointSize + 20, y: 10, width: pointSize, height: pointSize)
        loadPoint3.frame = CGRect(x: pointSize * 2 + 40, y: 10, width: pointSize, height: pointSize)
        
        loadingPointView.addSubview(loadPoint1)
        loadingPointView.addSubview(loadPoint2)
        loadingPointView.addSubview(loadPoint3)
        
        let animationDuration = 0.25
        
        delay(0.25){
            
            UIView.animate(withDuration: animationDuration,
                           delay: 0,
                           options: [],
                           animations: {
                            loadPoint1.alpha += 0.5
                           },
                           completion: {_ in
                            UIView.animate(withDuration: animationDuration,
                                           delay: 0,
                                           options: [],
                                           animations: {
                                            loadPoint2.alpha += 0.5
                                           },
                                           completion: {_ in
                                            UIView.animate(withDuration: animationDuration,
                                                           delay: 0,
                                                           options: [],
                                                           animations: {
                                                            loadPoint3.alpha += 0.5
                                                           },
                                                           completion: {_ in
                                                            UIView.animate(withDuration: animationDuration,
                                                                           delay: 0,
                                                                           options: [],
                                                                           animations: {
                                                                            loadPoint1.alpha -= 0.5
                                                                           },
                                                                           completion: {_ in
                                                                            UIView.animate(withDuration: animationDuration,
                                                                                           delay: 0,
                                                                                           options: [],
                                                                                           animations: {
                                                                                            loadPoint2.alpha -= 0.5
                                                                                           },
                                                                                           completion: {_ in
                                                                                            UIView.animate(withDuration: animationDuration,
                                                                                                           delay: 0,
                                                                                                           options: [],
                                                                                                           animations: {
                                                                                                            loadPoint3.alpha -= 0.5
                                                                                                           },
                                                                                                           completion: {_ in
                                                                                                            self.performSegue(withIdentifier: "goTabbar", sender: self)
                                                                                                           })
                                                                                           })
                                                                           })
                                                           })
                                           })
                           })
            
        }

    }
    
}
