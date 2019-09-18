//
//  IngredientsFloatingButton.swift
//  EpicuriousClone
//
//  Created by Tringapps on 18/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class IngredientsFloatingButton: UIViewController {


    private var button: UIButton!
    private let window:FloatingButtonWindow = FloatingButtonWindow()
    private static let instance:IngredientsFloatingButton = IngredientsFloatingButton()
    public var isOverScreen:Bool = false
    public var ingredientsList:[String]!
    public var isOnIngredientsPage:Bool = false
    fileprivate var presentedViewControllerObject:UIViewController!

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private init() {
        super.init(nibName: nil, bundle: nil)
    }

    public static func getInstance() -> IngredientsFloatingButton {
        return instance
    }

    public func showFloatingButton() {
        isOverScreen = true
        window.windowLevel = UIWindow.Level(rawValue: CGFloat.greatestFiniteMagnitude)
        window.isHidden = false
        window.rootViewController = self
    }

    public func slideInFloatinButton() {
        showFloatingButton()
        button.slideIn(horizontally: 50)
    }

    public func hideFloatingButton() {
        isOverScreen = false
        window.windowLevel = UIWindow.Level(rawValue: 0)
        window.isHidden = true
        window.rootViewController = self
    }

    public func slideOutFloatingButton() {
        button.slideIn(horizontally: -50)
        hideFloatingButton()
    }

    override func loadView() {
        let view = UIView()
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.red
        button.frame = CGRect(x: (UIApplication.shared.keyWindow?.frame.width)!-50, y: (UIApplication.shared.keyWindow?.frame.height)!/2 + 100, width: 50, height: 50)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(onClickStickyButton), for: .touchUpInside)
        view.addSubview(button)
        self.view = view
        self.button = button
        window.button = button
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    @objc public func onClickStickyButton() {
        print("Ingredients Page \(isOnIngredientsPage)")
        if(isOnIngredientsPage) {
            isOnIngredientsPage = false
            presentedViewControllerObject.dismiss(animated: true, completion: nil)
        } else {
            presentIngredientsViewController(ingredients: ingredientsList)
        }
    }

    fileprivate func presentIngredientsViewController(ingredients ingredientsToAdd:[String]) {
        let mainStoryboard = UIStoryboard(name: "HomeTab", bundle: Bundle.main)
        let ingredientsViewController = mainStoryboard.instantiateViewController(withIdentifier: "IngredientsPageStoryboardIdentifier") as! IngredientsPageViewController
        ingredientsViewController.ingredients = ingredientsToAdd
        presentedViewControllerObject = ingredientsViewController
        ingredientsViewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        guard  let mainViewController = UIApplication.shared.keyWindow!.rootViewController as? UITabBarController else { return }
        if let presentedViewController = mainViewController.presentedViewController {
        guard let navigationController = presentedViewController.navigationController else {
            presentedViewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            presentedViewController.present(ingredientsViewController, animated: true, completion: nil)
            return
        }
        navigationController.pushViewController(ingredientsViewController, animated: true)

        } else {
            guard let navigationController = mainViewController.navigationController else {
            mainViewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            mainViewController.present(ingredientsViewController, animated: true, completion: nil)
            return
        }
            navigationController.pushViewController(ingredientsViewController, animated: true)
        }
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
