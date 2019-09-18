//
//  PreparationStepsViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 27/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class PreparationStepsViewController: UIViewController {

    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var isScrollviewDismissing:Bool = false
    var recipeNameString:String!
    var recipeProcedureArray:[(String, String)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setDefaultValues()
        setupPanGestureRecognizer()
        setScrollViewDelegate()
        print("Preparation Steps View Loaded")
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

    fileprivate func setDefaultValues() {
        recipeName.text = recipeNameString
    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        print("Cancel Button Clicked")
        self.dismiss(animated: true, completion: nil)
    }

    deinit {
        print("Preparation Steps View Safe From Memory Leaks")
    }
}

extension PreparationStepsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PreparationStepsReusableCellTableViewCell.reusableIdentity) as! PreparationStepsReusableCellTableViewCell
        cell.setStepValue(number: indexPath.row, procedure: recipeProcedureArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeProcedureArray.count
    }
}

extension PreparationStepsViewController: UIScrollViewDelegate {
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
        print(scrollOffsetY, " ", dismissThreshold)
        if(scrollOffsetY > dismissThreshold) {
            self.dismiss(animated: true, completion: nil)
        } else {
            let pointToMove:CGPoint = CGPoint(x: 0, y: scrollOffsetY)
            moveScreen(toPoint: pointToMove, isEnded: true)
            isScrollviewDismissing = false
        }
    }
}
