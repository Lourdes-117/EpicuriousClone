//
//  Segue.swift
//  EpicuriousClone
//
//  Created by Tringapps on 05/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class ScaleSegue:UIStoryboardSegue {
    public static var startFrameToAnimate:CGRect?
    override func perform() {
        print("Performing Custom Segue Animation")
        destination.transitioningDelegate = self
        super.perform()
    }
}

extension ScaleSegue: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScalePresentAnimator()
    }
}

class ScalePresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let toViewController = transitionContext.viewController(forKey: .to)!
        let toView = transitionContext.view(forKey: .to)
        if let toView = toView{
            transitionContext.containerView.addSubview(toView)
        }

        var startFrame:CGRect = CGRect.zero
        if let startFrameToAnimate = ScaleSegue.startFrameToAnimate {
            startFrame = startFrameToAnimate
        } else {
            print("Start Frame To Animate Is Not set")
            print("Animation Will Start From (0,0)")
        }
        toView?.frame = startFrame
        toView?.layoutIfNeeded()

        let duration = transitionDuration(using: transitionContext)
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        UIView.animate(withDuration: duration, animations: {
            toView?.frame = finalFrame
            toView?.layoutIfNeeded()
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }


}
