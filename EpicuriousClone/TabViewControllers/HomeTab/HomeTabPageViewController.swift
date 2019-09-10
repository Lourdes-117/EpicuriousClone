//
//  HomeTabPageViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 23/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit

class HomeTabPageViewController: UIPageViewController {
    var startOffset = CGFloat(0)
    fileprivate static var colorComponents:(CGFloat, CGFloat, CGFloat) = (00.0, 255.0, 00.0)
    lazy var orderedViewControllers:[UIViewController] = {
        return [Constants.ViewControllers.NEWEST_RECIPIES.instantiateViewController(inStoryboard: "HomeTab"),
        Constants.ViewControllers.BEST_GRILLED_VEGETABLES.instantiateViewController(inStoryboard: "HomeTab"),
        Constants.ViewControllers.NEWEST_VIDEOS.instantiateViewController(inStoryboard: "HomeTab")]
    }()
    var pageControl = UIPageControl()

    override func viewDidLoad() {
        setBackgroundColor()
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        instantiatePageViewController()
        configurePageControl()
        setScrollViewDelegate()
        print("HomeTab PageViewController Loaded")
    }

    fileprivate func setBackgroundColor() {
        view.backgroundColor = UIColor(red: HomeTabPageViewController.colorComponents.0/255, green: HomeTabPageViewController.colorComponents.1/255, blue: HomeTabPageViewController.colorComponents.2/255, alpha: 1)
    }

    fileprivate func instantiatePageViewController() {
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    fileprivate func setScrollViewDelegate() {
        let scrollView = view.subviews.filter { $0 is UIScrollView }.first as! UIScrollView
        scrollView.delegate = self
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
        setBackgroundColorAfterScrolling()
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.orderedViewControllers.count
    }

    fileprivate func setBackgroundColorAfterScrolling() {
        switch self.pageControl.currentPage {
        case 0:
            HomeTabPageViewController.colorComponents = (00.0, 255.0, 00.0)
        case 1:
            HomeTabPageViewController.colorComponents = (255.0, 00.0, 00.0)
        case 2:
            HomeTabPageViewController.colorComponents = (00.0, 00.0, 255.0)
        default:
            print("Internal Error: Unexpected Page In PageViewController")
        }
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = UIColor(red: HomeTabPageViewController.colorComponents.0/255, green: HomeTabPageViewController.colorComponents.1/255, blue: HomeTabPageViewController.colorComponents.2/255, alpha: 1)
        }
    }
}

extension HomeTabPageViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOffset = scrollView.contentOffset.x
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var scrollingRight:Bool = true
        if startOffset < scrollView.contentOffset.x {
            scrollingRight = true
        }else {
            scrollingRight = false
        }
        let screenWidth:CGFloat = view.frame.width
        let colorChangeToMake:CGFloat = (screenWidth/255)*2

        switch self.pageControl.currentPage {
        case 0:
            if(scrollingRight) {
                HomeTabPageViewController.colorComponents.0 = HomeTabPageViewController.colorComponents.0 + colorChangeToMake
                HomeTabPageViewController.colorComponents.1 = HomeTabPageViewController.colorComponents.1 - colorChangeToMake
                HomeTabPageViewController.colorComponents.2 = HomeTabPageViewController.colorComponents.2 - colorChangeToMake
            } else {
                HomeTabPageViewController.colorComponents.0 = HomeTabPageViewController.colorComponents.0 - colorChangeToMake
                HomeTabPageViewController.colorComponents.1 = HomeTabPageViewController.colorComponents.1 + colorChangeToMake
                HomeTabPageViewController.colorComponents.2 = HomeTabPageViewController.colorComponents.2 - colorChangeToMake
            }
        case 1:
            if(scrollingRight) {
                HomeTabPageViewController.colorComponents.0 = HomeTabPageViewController.colorComponents.0 - colorChangeToMake
                HomeTabPageViewController.colorComponents.1 = HomeTabPageViewController.colorComponents.1 - colorChangeToMake
                HomeTabPageViewController.colorComponents.2 = HomeTabPageViewController.colorComponents.2 + colorChangeToMake
            } else {
                HomeTabPageViewController.colorComponents.0 = HomeTabPageViewController.colorComponents.0 - colorChangeToMake
                HomeTabPageViewController.colorComponents.1 = HomeTabPageViewController.colorComponents.1 + colorChangeToMake
                HomeTabPageViewController.colorComponents.2 = HomeTabPageViewController.colorComponents.2 - colorChangeToMake
            }
        case 2:
            if(scrollingRight) {
                HomeTabPageViewController.colorComponents.0 = HomeTabPageViewController.colorComponents.0 - colorChangeToMake
                HomeTabPageViewController.colorComponents.1 = HomeTabPageViewController.colorComponents.1 - colorChangeToMake
                HomeTabPageViewController.colorComponents.2 = HomeTabPageViewController.colorComponents.2 + colorChangeToMake
            } else {
                HomeTabPageViewController.colorComponents.0 = HomeTabPageViewController.colorComponents.0 + colorChangeToMake
                HomeTabPageViewController.colorComponents.1 = HomeTabPageViewController.colorComponents.1 - colorChangeToMake
                HomeTabPageViewController.colorComponents.2 = HomeTabPageViewController.colorComponents.2 - colorChangeToMake
            }
        default:
            print("Internal Error In PageController")
        }
        view.backgroundColor = UIColor(red: HomeTabPageViewController.colorComponents.0/255, green: HomeTabPageViewController.colorComponents.1/255, blue: HomeTabPageViewController.colorComponents.2/255, alpha: 1)
        checkColorValues()
    }

    fileprivate func checkColorValues() {
        if HomeTabPageViewController.colorComponents.0 < 0 {
            HomeTabPageViewController.colorComponents.0 = 0
        } else if HomeTabPageViewController.colorComponents.0 > 255 {
            HomeTabPageViewController.colorComponents.0 = 255
        }

        if HomeTabPageViewController.colorComponents.1 < 0 {
            HomeTabPageViewController.colorComponents.1 = 0
        } else if HomeTabPageViewController.colorComponents.1 > 255 {
            HomeTabPageViewController.colorComponents.1 = 255
        }

        if HomeTabPageViewController.colorComponents.2 < 0 {
            HomeTabPageViewController.colorComponents.2 = 0
        } else if HomeTabPageViewController.colorComponents.2 > 255 {
            HomeTabPageViewController.colorComponents.2 = 255
        }
    }
}
