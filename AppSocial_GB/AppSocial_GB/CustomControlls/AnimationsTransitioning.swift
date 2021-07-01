//
//  AnimationsTransitioning.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 01.07.2021.
//

import  UIKit

class AnimationsTransitioning: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toBackController: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            self.interactiveTransition.viewController = toBackController
        
            return animatorTurnPush()
        } else if operation == .pop {
            if navigationController.viewControllers.first != toBackController {
                self.interactiveTransition.viewController = toBackController
            }
            return animatorTurnPop()
        }
        return nil
    }
    
    let interactiveTransition = CustomInteractiveTransition()
    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.starting ? interactiveTransition : nil
    }
    
}

class animatorTurnPush: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 1.0
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let source = transitionContext.viewController(forKey: .from)!
        let destination = transitionContext.viewController(forKey: .to)!
        
        let containerViewFrame = transitionContext.containerView.frame
        
        let sourceViewFrame = CGRect(
            x: -containerViewFrame.height,
            y: 0,
            width: source.view.frame.height,
            height: source.view.frame.width
        )
        
        let destinationViewFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.transform = CGAffineTransform(rotationAngle: -(.pi/2))
        destination.view.frame = CGRect(
            x: containerViewFrame.width,
            y: 0,
            width: source.view.frame.height,
            height: source.view.frame.width
        )
        
       
        UIView.animate(
            withDuration: duration,
            animations: {
                source.view.transform = CGAffineTransform(rotationAngle: .pi/2)
                source.view.frame = sourceViewFrame
                
                destination.view.transform = .identity
                destination.view.frame = destinationViewFrame
        }) { finished in
            
            transitionContext.completeTransition(finished)
        }
    }

}


class animatorTurnPop: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 1.0
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let source = transitionContext.viewController(forKey: .from)!
        let destination = transitionContext.viewController(forKey: .to)!
        
        let containerViewFrame = transitionContext.containerView.frame
        
        let sourceViewFrame = CGRect(
            x: containerViewFrame.width,
            y: 0,
            width: source.view.frame.height,
            height: source.view.frame.width
        )
        
        let destinationViewFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = CGRect(
            x: -containerViewFrame.height,
            y: 0,
            width: source.view.frame.height,
            height: source.view.frame.width
        )
        
        
        UIView.animate(
            withDuration: duration,
            animations: {
                source.view.frame = sourceViewFrame
                source.view.transform = CGAffineTransform(rotationAngle: -.pi/2)
                
                destination.view.transform = .identity
                destination.view.frame = destinationViewFrame
                
        }) { finished in
        
            transitionContext.completeTransition(finished)
        }
    }

}


class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(
                target: self,
                action: #selector(handleScreenEdgeGesture))
            
                recognizer.edges = [.left]
                viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var starting: Bool = false
    var finishing: Bool = false

    @objc func handleScreenEdgeGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            self.starting = true
            self.viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
           
            let relativeTranslation = translation.y / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            
            self.finishing = progress > 0.1

            self.update(progress)
        case .ended:
            self.starting = false
            self.finishing ? self.finish() : self.cancel()
        case .cancelled:
            self.starting = false
            self.cancel()
        default: return
        }
    }
}


