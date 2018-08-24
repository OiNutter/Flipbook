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

## Author

OiNutter, will@oinutter.co.uk

## License

Flipbook is available under the MIT license. See the LICENSE file for more info.
