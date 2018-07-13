//Controls page view controller.

//  PageViewController.swift
//  ALS Calculator
//
//  Created by Cassandra Lam on 2018-07-10.
//  Copyright © 2018 Cassandra Lam. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate  {
   
    lazy var viewControllerList:[UIViewController] = {
        // Creating array of view contollers we will be using and instantiating them
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "UmnViewController")
        let vc2 = sb.instantiateViewController(withIdentifier: "LmnViewController")
        let vc3 = sb.instantiateViewController(withIdentifier: "FibViewController")
        let vc4 = sb.instantiateViewController(withIdentifier: "FasViewController")
        let vc5 = sb.instantiateViewController(withIdentifier: "NeuroViewController")
        
        return [vc1, vc2, vc3, vc4, vc5]
    }()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
    
        self.dataSource = self   //set ourselves as datasource
        
        if let firstViewController = viewControllerList.first {
            //Checks IF there are any view controllers in the list. If one exists,
            
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil) //setViewControllers is part of page view controller's functions
        }
        
        self.delegate = self
        configurePageControl()
        
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = viewControllerList.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
        
        
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Handles view controller that comes before current view controller.
        // note: 'viewController' is an argument of this delegate function
        
        //Prevents you from scrolling too far back (where no view controller exists)
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}   //get index of viewControllerList
        
        let previousIndex = vcIndex - 1 //get index of view controller before current one
        
        guard previousIndex >= 0 else {
            return nil  //prevents swiping through indefinitely (doesnt loop back to last page)
        }
        
        guard viewControllerList.count > previousIndex else {
            return nil
        }
        
        return viewControllerList[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //handles view controller that comes after current view controller
        
        //Prevents you from scrolling too far forward (where no view controller exists)
        guard let vcIndex = viewControllerList.index(of: viewController) else{return nil}
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else {
            return nil
        }
        
        guard viewControllerList.count > nextIndex else {
            return nil
        }
        
        return viewControllerList[nextIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = viewControllerList.index(of: pageContentViewController)!
    }

}
