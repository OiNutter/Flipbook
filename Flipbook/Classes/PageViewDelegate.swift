//
//  PageViewDelegate.swift
//  FBSnapshotTestCase
//
//  Created by Will McKenzie on 24/08/2018.
//

import UIKit

class PageViewDelegate: NSObject, UIPageViewControllerDelegate {
    
    var imageList: [UIImage]?
    var pageControl: UIPageControl?
    
    init(withImages images:[UIImage], andControl control:UIPageControl) {
        super.init()
        imageList = images
        pageControl = control
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0] as! ImageViewController
        pageControl?.currentPage = (imageList?.index(of: pageContentViewController.image)) ?? 0
    }
    
}
