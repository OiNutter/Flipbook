//
//  Flipbook.swift
//
//  Created by Will Mckenzie on 23/08/2018.
//  Copyright © 2018 Bearded Apps. All rights reserved.
//

import UIKit

public class Flipbook:UIViewController {
    
    var imageList:[UIImage] = [UIImage]()
    var pageController:UIPageViewController!
    var pageControl:UIPageControl!
    var pageDelegate:PageViewDelegate!
    
    public var contentMode:UIView.ContentMode = .scaleAspectFill
    public var transitionStyle:UIPageViewController.TransitionStyle = .scroll
    public var direction:UIPageViewController.NavigationDirection = .forward
    public var orientation:UIPageViewController.NavigationOrientation = .horizontal
    public var options:[UIPageViewController.OptionsKey:Any]? = nil
    public var animated = true
    public var pageControlActiveTint:UIColor = UIColor.black
    public var pageControlInactiveTint:UIColor = UIColor.lightGray
    
    public convenience init(withImages images:[Any] = [Any](), andOptions options:[UIPageViewController.OptionsKey:Any]? = nil) {
        self.init()
        self.options = options
        loadImages(images)
    }
    
    private func loadImages(_ images:[Any]) {
        for (_, image) in images.enumerated() {
            switch(image) {
            case is UIImage:
                imageList.append(image as! UIImage)
                break
            case is URL:
                guard
                    let data = try? Data(contentsOf: image as! URL),
                    let newImage = UIImage(data:data)
                    else { break }
                imageList.append(newImage)
                break
            case is String:
                guard
                    let newImage = UIImage(named: image as! String)
                    else { break }
                imageList.append(newImage)
                break
            default:
                break
            }
        }
    }
    
    override public func loadView() {
        view = UIView()
        
        pageController = UIPageViewController(
            transitionStyle: transitionStyle,
            navigationOrientation: orientation,
            options: options)
        
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: view.bounds.width/2,height: 50))
        pageControl.numberOfPages = imageList.count
        pageControl.currentPage = 0
        pageControl.tintColor = view.tintColor
        pageControl.pageIndicatorTintColor = pageControlInactiveTint
        pageControl.currentPageIndicatorTintColor = pageControlActiveTint
        
        pageDelegate = PageViewDelegate(withImages: imageList, andControl: pageControl)
        pageController!.delegate = pageDelegate
        
        if (imageList.count > 0) {
            let startingViewController: ImageViewController = dataSource.viewControllerAtIndex(0)!
            let viewControllers = [startingViewController]
            pageController!.setViewControllers(
                viewControllers,
                direction: direction,
                animated: animated,
                completion: {done in }
            )
        }
        
        pageController!.dataSource = dataSource
        
        addChild(pageController!)
        view.addSubview(pageController!.view)
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
        pageController!.view.expandToParent(view)
        
        pageController!.didMove(toParent: self)
    }
    
    var dataSource: ImageDataSource {
        // Return the model controller object, creating it if necessary.
        // In more complex implementations, the model controller may be passed to the view controller.
        if _dataSource == nil {
            _dataSource = ImageDataSource(withImages: imageList)
            _dataSource?.contentMode = contentMode
        }
        return _dataSource!
    }
    
    var _dataSource: ImageDataSource? = nil
        
}
