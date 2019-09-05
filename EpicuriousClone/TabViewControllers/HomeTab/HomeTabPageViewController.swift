//
//  HomeTabPageViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 23/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class HomeTabPageViewController: UIPageViewController {
    lazy var orderedViewControllers:[UIViewController] = {
        return [Constants.ViewControllers.NEWEST_RECIPIES.instantiateViewController(inStoryboard: "HomeTab"),
        Constants.ViewControllers.BEST_GRILLED_VEGETABLES.instantiateViewController(inStoryboard: "HomeTab"),
        Constants.ViewControllers.NEWEST_VIDEOS.instantiateViewController(inStoryboard: "HomeTab")]
    }()
    var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        instantiatePageViewController()
        configurePageControl()
        print("HomeTab PageViewController Loaded")
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        pageControl.isHidden = false
//        tabBarController?.tabBar.setTabBarVisibility(true)
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        pageControl.isHidden = true
//        tabBarController?.tabBar.setTabBarVisibility(false)
//    }

    fileprivate func instantiatePageViewController() {
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    fileprivate func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: (view.frame.width/2)-50, y: 30 , width: 100, height: 50))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
        print("Page Control Is Set")
    }
}

extension HomeTabPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard  let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {return nil}
        guard viewControllerIndex > 0 else {return nil}
        let previousViewControllerIndex = viewControllerIndex - 1
        return orderedViewControllers[previousViewControllerIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard  let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {return nil}
        guard viewControllerIndex < orderedViewControllers.count-1 else {return nil}
        let nextViewControllerIndex = viewControllerIndex + 1
        return orderedViewControllers[nextViewControllerIndex]
    }
}

extension HomeTabPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController )!
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.orderedViewControllers.count
    }
}
