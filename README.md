# Flipbook

[![CI Status](https://img.shields.io/travis/OiNutter/Flipbook.svg?style=flat)](https://travis-ci.org/OiNutter/Flipbook)
[![Version](https://img.shields.io/cocoapods/v/Flipbook.svg?style=flat)](https://cocoapods.org/pods/Flipbook)
[![License](https://img.shields.io/cocoapods/l/Flipbook.svg?style=flat)](https://cocoapods.org/pods/Flipbook)
[![Platform](https://img.shields.io/cocoapods/p/Flipbook.svg?style=flat)](https://cocoapods.org/pods/Flipbook)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Flipbook is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Flipbook'
```

## Usage

```swift

override func viewDidLoad() {
    super.viewDidLoad()

    var images:[String] = [String]()
    for i in 1...5 {
        images.append("image\(i)")
    }

    let flipbook:Flipbook = Flipbook(withImages: images)

    addChild(flipbook)
    view.addSubview(flipbook.view)
    flipbook.view.expandToParent(view)
    flipbook.didMove(toParent: self)
}
```

Images can be an array of `UIImage`s, `String`s or `URL`s.

## Configuration

The following options are customisable and should be set before you add the
view.

- `contentMode:UIView.ContentMode`: The content mode of the `UIImageView` used
to display an image. Defaults to `.scaleAspectFill`
- `transitionStyle:UIPageViewController.TransitionStyle`: The transition style
used when paging through images. Defaults to `.scroll`
- `direction:UIPageViewController.NavigationDirection`: The navigation direction
of the page controller. Defaults to `.forward`
- `orientation:UIPageViewController.NavigationOrientation`: The navigation
orientation of the page controller. Defaults to `.horizontal`
- `options:[UIPageViewController.OptionsKey:Any]`: Any options to pass to the
page view controller on creation. Defaults to `nil`
- `animated:Bool`: Whether the page view controller should use animations.
Defaults to `true`
- `pageControlActiveTint:UIColor`: The colour to use for the active dot.
Defaults to `UIColor.black`
- `pageControlInactiveTint:UIColor`: The colour to use for the inactive dots.
Defaults to `UIColor.lightGray`

## Author

OiNutter, will@oinutter.co.uk

## License

Flipbook is available under the MIT license. See the LICENSE file for more info.
