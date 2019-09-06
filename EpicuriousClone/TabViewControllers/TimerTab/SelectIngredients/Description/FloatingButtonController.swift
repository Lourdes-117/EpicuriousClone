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
    }

    @objc public func onClickStickyButton() {
        let mainStoryboard = UIStoryboard(name: "TimerTab", bundle: Bundle.main)
        let notificationSetterViewController = mainStoryboard.instantiateViewController(withIdentifier: "NotificationSetterViewController") as! UIViewController
        guard  let mainViewController = UIApplication.shared.keyWindow!.rootViewController as? UITabBarController else {
            return
        }
        if let presentedViewController = mainViewController.presentedViewController {
            presentedViewController.present(notificationSetterViewController, animated: true, completion: nil)
        } else {
            mainViewController.present(notificationSetterViewController, animated: true, completion: nil)
        }
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
