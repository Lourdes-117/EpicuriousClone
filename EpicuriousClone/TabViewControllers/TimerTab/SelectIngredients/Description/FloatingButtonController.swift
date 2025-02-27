//
//  FloatingButtonViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 06/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class FloatingButtonController: UIViewController {


    private(set) var button: UIButton!
    private let window:FloatingButtonWindow = FloatingButtonWindow()
    private static let instance:FloatingButtonController = FloatingButtonController()
    private var initialButtonCenter: CGPoint?

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private init() {
        super.init(nibName: nil, bundle: nil)
    }

    public static func getInstance() -> FloatingButtonController {
        return instance
    }

    public func showFloatingButton() {
        window.windowLevel = UIWindow.Level(rawValue: CGFloat.greatestFiniteMagnitude)
        window.isHidden = false
        window.rootViewController = self
    }

    public func hideFloatingButton() {
        window.windowLevel = UIWindow.Level(rawValue: 0)
        window.isHidden = true
        window.rootViewController = self
    }

    override func loadView() {
        let view = UIView()
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(white: 0, alpha: 0.5)
        button.addTarget(self, action: #selector(onClickStickyButton), for: .touchUpInside)
        button.frame = CGRect(x: (UIApplication.shared.keyWindow?.frame.width)!-50, y: (UIApplication.shared.keyWindow?.frame.height)!/2, width: 50, height: 50)
        button.layer.cornerRadius = button.frame.height/2
        view.addSubview(button)
        self.view = view
        self.button = button
        window.button = button
        
        // Add pan gesture recognizer to make button draggable
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        button.addGestureRecognizer(panGesture)
    }

    @objc public func onClickStickyButton() {
        let mainStoryboard = UIStoryboard(name: "TimerTab", bundle: Bundle.main)
        let notificationSetterViewController = mainStoryboard.instantiateViewController(withIdentifier: "NotificationSetterViewController")
        guard  let mainViewController = UIApplication.shared.keyWindow!.rootViewController as? UITabBarController else {
            return
        }
        if let presentedViewController = mainViewController.presentedViewController {
            guard let navigationController = presentedViewController.navigationController else {
                presentedViewController.present(notificationSetterViewController, animated: true, completion: nil)
                return
            }
            navigationController.pushViewController(notificationSetterViewController, animated: true)

        } else {
            guard let navigationController = mainViewController.navigationController else {
                mainViewController.present(notificationSetterViewController, animated: true, completion: nil)
                return
            }
            navigationController.pushViewController(notificationSetterViewController, animated: true)

        }
    }

    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let buttonView = gesture.view!
        
        switch gesture.state {
        case .began:
            // Save initial position and disable button action temporarily
            initialButtonCenter = buttonView.center
            button.removeTarget(self, action: #selector(onClickStickyButton), for: .touchUpInside)
            
        case .changed:
            // Move the button with the gesture
            let translation = gesture.translation(in: view)
            buttonView.center = CGPoint(
                x: buttonView.center.x + translation.x,
                y: buttonView.center.y + translation.y
            )
            gesture.setTranslation(.zero, in: view)
            
            // Keep button within screen bounds
            let screenBounds = UIScreen.main.bounds
            let halfButtonWidth = buttonView.bounds.width / 2
            let halfButtonHeight = buttonView.bounds.height / 2
            
            if buttonView.center.x < halfButtonWidth {
                buttonView.center.x = halfButtonWidth
            } else if buttonView.center.x > screenBounds.width - halfButtonWidth {
                buttonView.center.x = screenBounds.width - halfButtonWidth
            }
            
            if buttonView.center.y < halfButtonHeight {
                buttonView.center.y = halfButtonHeight
            } else if buttonView.center.y > screenBounds.height - halfButtonHeight {
                buttonView.center.y = screenBounds.height - halfButtonHeight
            }
            
        case .ended, .cancelled:
            // Animate to the nearest corner
            animateToNearestCorner(buttonView)
            
            // Re-enable button action after drag ends
            button.addTarget(self, action: #selector(onClickStickyButton), for: .touchUpInside)
            
        default:
            break
        }
    }
    
    private func animateToNearestCorner(_ buttonView: UIView) {
        let screenBounds = UIScreen.main.bounds
        let buttonWidth = buttonView.bounds.width
        let buttonHeight = buttonView.bounds.height
        let margin: CGFloat = 10.0
        
        // Current position
        let currentX = buttonView.center.x
        let currentY = buttonView.center.y
        
        // Calculate distances to each edge
        let distanceToLeftEdge = currentX
        let distanceToRightEdge = screenBounds.width - currentX
        let distanceToTopEdge = currentY
        let distanceToBottomEdge = screenBounds.height - currentY
        
        // Find the nearest edge
        let minDistance = min(distanceToLeftEdge, distanceToRightEdge, distanceToTopEdge, distanceToBottomEdge)
        
        var targetPoint = buttonView.center
        
        // Determine which edge is closest and calculate the target point
        if minDistance == distanceToLeftEdge {
            // Left edge
            targetPoint.x = buttonWidth/2 + margin
        } else if minDistance == distanceToRightEdge {
            // Right edge
            targetPoint.x = screenBounds.width - buttonWidth/2 - margin
        } else if minDistance == distanceToTopEdge {
            // Top edge
            targetPoint.y = buttonHeight/2 + margin
        } else {
            // Bottom edge
            targetPoint.y = screenBounds.height - buttonHeight/2 - margin
        }
        
        // Animate the button to the nearest edge
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
            buttonView.center = targetPoint
        }, completion: nil)
    }
    
    private func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        let xDistance = point1.x - point2.x
        let yDistance = point1.y - point2.y
        return sqrt(xDistance * xDistance + yDistance * yDistance)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

private class FloatingButtonWindow: UIWindow {
    var button: UIButton?

    init() {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = nil
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let button = button else { return false }
        let buttonPoint = convert(point, to: button)
        return button.point(inside: buttonPoint, with: event)
    }

}
