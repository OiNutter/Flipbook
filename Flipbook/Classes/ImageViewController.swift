//
//  ImageViewController.swift
//  FBSnapshotTestCase
//
//  Created by Will McKenzie on 24/08/2018.
//

import UIKit

class ImageViewController: UIViewController {
    var image:UIImage!
    var contentMode:UIView.ContentMode = .scaleAspectFill
    
    override func loadView() {
        view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        
        imageView.contentMode = contentMode
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        
        imageView.expandToParent(view)
    }
}
