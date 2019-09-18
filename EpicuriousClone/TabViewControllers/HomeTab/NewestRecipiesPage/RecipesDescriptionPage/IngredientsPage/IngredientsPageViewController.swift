//
//  IngredientsPageViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 16/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class IngredientsPageViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var ingredients:[String] = []
    var isScrollviewDismissing:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setRoundCancelButton()
        setupPanGestureRecognizer()
        setScrollViewDelegate()
        setUpFloatingButton()
        print("Ingredients Page View Loaded")
    }

    fileprivate func setUpFloatingButton() {
        let floatingButton = IngredientsFloatingButton.getInstance()
        floatingButton.isOnIngredientsPage = true
    }

    fileprivate func setScrollViewDelegate() {
        let scrollView = view.subviews.filter { $0 is UIScrollView }.first as! UIScrollView
        scrollView.delegate = self
    }

    fileprivate func setupPanGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(onPanning(_:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
    }

    @objc fileprivate func onPanning(_ gesture:UIPanGestureRecognizer) {
        let translatedPoint:CGPoint = gesture.translation(in: view)
        let pointToMove:CGPoint = CGPoint(x: 0, y: translatedPoint.y)
        let isPanGestureEnded:Bool = gesture.state == UIGestureRecognizer.State.ended
        moveScreen(toPoint: pointToMove, isEnded: isPanGestureEnded)
    }

    fileprivate func moveScreen(toPoint point:CGPoint, isEnded:Bool) {
        if(isEnded) {
            if(point.y > view.frame.height/2) {
                IngredientsFloatingButton.getInstance().isOnIngredientsPage = false
                self.dismiss(animated: true, completion: nil)
            } else {
                let originPoint:CGPoint = CGPoint(x: 0, y: 0)
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.view.frame.origin = originPoint
                }
            }
        } else {
            view.frame.origin = point
        }
    }

    fileprivate func setRoundCancelButton() {
        cancelButton.layer.cornerRadius = cancelButton.frame.height/2
    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        IngredientsFloatingButton.getInstance().isOnIngredientsPage = false
        self.dismiss(animated: true, completion: nil)
    }

    deinit {
        print("Ingredients Page Safe From Memory Leaks")
    }
}

extension IngredientsPageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return self.ingredients.count
        default:
            print("Internal Error")
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsViewHeaderCellTableViewCell.reusableIdentity) as! IngredientsViewHeaderCellTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientNameTableViewCell.reusableIdentity) as! IngredientNameTableViewCell
            cell.setValue(name: self.ingredients[indexPath.row])
            return cell
        default:
            print("Internal Error")
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsViewHeaderCellTableViewCell.reusableIdentity) as! IngredientsViewHeaderCellTableViewCell
            return cell
        }
    }
}

extension IngredientsPageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(isScrollviewDismissing) {return}
        let scrollOffsetY = scrollView.contentOffset.y
        if(scrollOffsetY <= 0) {
            let pointToScroll:CGPoint = CGPoint(x: 0, y: abs(scrollOffsetY))
            moveScreen(toPoint: pointToScroll, isEnded: false)
        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        isScrollviewDismissing = true
        let scrollOffsetY = abs(scrollView.contentOffset.y)
        let dismissThreshold:CGFloat = self.view.frame.height/4
        if(scrollOffsetY > dismissThreshold) {
            IngredientsFloatingButton.getInstance().isOnIngredientsPage = false
            self.dismiss(animated: true, completion: nil)
        } else {
            let pointToMove:CGPoint = CGPoint(x: 0, y: scrollOffsetY)
            moveScreen(toPoint: pointToMove, isEnded: true)
            isScrollviewDismissing = false
        }
    }
}
