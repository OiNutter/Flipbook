//
//  ImageDataSource.swift
//  FBSnapshotTestCase
//
//  Created by Will McKenzie on 24/08/2018.
//

import UIKit

class ImageDataSource: NSObject, UIPageViewControllerDataSource {
    
    var imageList:[UIImage] = [UIImage]()
    var contentMode:UIView.ContentMode = .scaleAspectFill
    var shouldLoop:Bool = true
    
    convenience init(withImages images:[UIImage]) {
        self.init()
        imageList = images
    }
    
    func indexOfViewController(_ viewController: ImageViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return imageList.index(of: viewController.image) ?? NSNotFound
    }
    
    func viewControllerAtIndex(_ index: Int) -> ImageViewController? {
        // Return the data view controller for the given index.
        if (self.imageList.count == 0) || (index >= self.imageList.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let imageViewController = ImageViewController()
        imageViewController.image = self.imageList[index]
        imageViewController.contentMode = contentMode
        return imageViewController
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! ImageViewController)
        if (index == NSNotFound) {
            return nil
        }
        
        if (index == 0) {
            if (shouldLoop) {
                index = imageList.count
            } else {
                return nil
            }
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! ImageViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.imageList.count {
            if (shouldLoop) {
                index = 0
            } else {
                return nil
            }
        }
        return self.viewControllerAtIndex(index)
    }
    
}
