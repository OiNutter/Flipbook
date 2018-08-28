// https://github.com/Quick/Quick

import Quick
import Nimble
import UIKit
@testable import Flipbook

class FlipbookSpec: QuickSpec {
    override func spec() {
        describe("setup") {

            it("should succeed with images") {
                
                var images:[UIImage] = [UIImage]()
                for i in 1...5 {
                    images.append(UIImage(named:"image\(i)")!)
                }
                let flipbook:Flipbook = Flipbook(withImages: images)
                
                expect(flipbook).toNot(beNil())
                
                flipbook.loadView()
                
                expect(flipbook.view.subviews.count).to(equal(2))
                expect(flipbook.view.subviews[0]).to(beAKindOf(UIView.self))
                expect(flipbook.view.subviews[1]).to(beAKindOf(UIPageControl.self))
                
                let pageControl = flipbook.view.subviews[1] as! UIPageControl
                
                expect(pageControl.numberOfPages).to(equal(5))
                
            }
            
            it("should succeed with strings") {
                // Do any additional setup after loading the view, typically from a nib.
                var images:[String] = [String]()
                for i in 1...5 {
                    images.append("image\(i)")
                }
                
                let flipbook:Flipbook = Flipbook(withImages: images)
                
                expect(flipbook).toNot(beNil())
                
                flipbook.loadView()
                expect(flipbook.view.subviews.count).to(equal(2))
                expect(flipbook.view.subviews[0]).to(beAKindOf(UIView.self))
                expect(flipbook.view.subviews[1]).to(beAKindOf(UIPageControl.self))
                
                let pageControl = flipbook.view.subviews[1] as! UIPageControl
                
                expect(pageControl.numberOfPages).to(equal(5))
            }
            
            it("should succeed with URLs") {
                // Do any additional setup after loading the view, typically from a nib.
                var images:[URL] = [URL]()
                for i in 1...5 {
                    images.append(URL(string:"https://github.com/OiNutter/Flipbook/raw/master/Example/Flipbook/Images.xcassets/image\(i).imageset/image\(i).jpg")!)
                }
                
                let flipbook:Flipbook = Flipbook(withImages: images)
                
                expect(flipbook).toNot(beNil())
                
                flipbook.loadView()
                
                expect(flipbook.view.subviews.count).to(equal(2))
                expect(flipbook.view.subviews[0]).to(beAKindOf(UIView.self))
                expect(flipbook.view.subviews[1]).to(beAKindOf(UIPageControl.self))
                
                let pageControl = flipbook.view.subviews[1] as! UIPageControl
                
                expect(pageControl.numberOfPages).to(equal(5))
            }
            
            it("should be empty if passed invalid images") {
                
                // Do any additional setup after loading the view, typically from a nib.
                var images:[String] = [String]()
                for i in 1...5 {
                    images.append("blah\(i)")
                }
                
                let flipbook:Flipbook = Flipbook(withImages: images)
                
                expect(flipbook).toNot(beNil())
                
                flipbook.loadView()
                expect(flipbook.view.subviews.count).to(equal(2))
                expect(flipbook.view.subviews[0]).to(beAKindOf(UIView.self))
                expect(flipbook.view.subviews[1]).to(beAKindOf(UIPageControl.self))
                
                let pageControl = flipbook.view.subviews[1] as! UIPageControl
                
                expect(pageControl.numberOfPages).to(equal(0))
                
            }
            
        }
    }
}
