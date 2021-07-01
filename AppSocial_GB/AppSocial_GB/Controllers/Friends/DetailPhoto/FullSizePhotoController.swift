//
//  FullSizePhotoController.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 01.07.2021.
//

import UIKit

class FullSizePhotoController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        view.addGestureRecognizer(recognizer)
        
        func configure(_ photo: UserAlbum){
            photoCurrent.image = UIImage(systemName: photo.photo)
        }
    }
    
    @IBOutlet var viewPhotoFull: UIView!
    @IBOutlet weak var photoCurrent: UIImageView!
    
    
    var allPhotos:[UserAlbum?] = []
    var countCurentPhoto = 0
    
    var interactiveAnimator: UIViewPropertyAnimator!
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            interactiveAnimator?.startAnimation()
            interactiveAnimator = UIViewPropertyAnimator(
                duration: 0.5,
                curve: .easeInOut,
                animations: {
                    self.photoCurrent.alpha = 0.5
                    self.photoCurrent.transform = .init(scaleX: 1.5, y: 1.5)
            })
            interactiveAnimator.pauseAnimation()
            
        case .changed:
            let translation = recognizer.translation(in: self.view)
            interactiveAnimator.fractionComplete = abs(translation.x / 100)
            self.photoCurrent.transform = CGAffineTransform(translationX: translation.x, y: 0)
            
        case .ended:
            interactiveAnimator.stopAnimation(true)
            if recognizer.translation(in: self.view).x < 0 {
                if  countCurentPhoto < allPhotos.count - 1  {
                    self.countCurentPhoto += 1
                }
            } else {
                if countCurentPhoto != 0 {
                    self.countCurentPhoto -= 1
                }
            }
            interactiveAnimator.addAnimations {
                self.photoCurrent.transform = .identity
                self.photoCurrent.alpha = 1
            }
            interactiveAnimator?.startAnimation()
            
        default: break
        }
        
        }
    
    }



