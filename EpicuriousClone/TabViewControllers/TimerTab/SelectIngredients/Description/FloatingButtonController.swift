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
    private let window = FloatingButtonWindow()

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        window.windowLevel = UIWindow.Level(rawValue: CGFloat.greatestFiniteMagnitude)
        window.isHidden = false
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
        print("Sticky Button Tapped")
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
