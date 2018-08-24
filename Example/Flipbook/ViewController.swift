//
//  ViewController.swift
//  Flipbook
//
//  Created by OiNutter on 08/24/2018.
//  Copyright (c) 2018 OiNutter. All rights reserved.
//

import UIKit
import Flipbook

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderView:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Do any additional setup after loading the view, typically from a nib.
        var images:[String] = [String]()
        for i in 1...5 {
            images.append("image\(i)")
        }
        
        let flipbook:Flipbook = Flipbook(withImages: images)

        addChild(flipbook)
        sliderView.addSubview(flipbook.view)
        flipbook.view.expandToParent(sliderView)
        flipbook.didMove(toParent: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

