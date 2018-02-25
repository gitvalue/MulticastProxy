# MulticastProxy
Provides a proxy that forwards invocations to multiple receivers

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites

- iOS 8.0+
- Xcode 9.0+
- Swift 4

### Installing

#### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate MulticastProxy into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'MulticastProxy', '<release version>'
end
```

Then, run the following command:

```bash
$ pod install
```

#### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate MulticastProxy into your project manually by adding [Multicaster.h](/Sources/MulticastProxy/Multicaster.h), [Multicaster.m](/Sources/MulticastProxy/Multicaster.m), [WeakRef.h](/Sources/MulticastProxy/WeakRef.h), [Multicaster.h](/Sources/MulticastProxy/WeakRef.m) and [MulticastProxy.swift](/Sources/MulticastProxy/MulticastProxy.swift) source files to your project.

## Deployment

### Quick Start

```swift
import UIKit
import MulticastProxy

class A: UIScrollViewDelegate {

}

class B: UIScrollViewDelegate {

}

class MyViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet private weak var scrollView: UIScrollView!

    private var a = A()
    private var b = B()

    private lazy var proxyDelegate: UIScrollViewDelegate? = {
        return MulticastProxy.create([a, b, self] as [UIScrollViewDelegate?])
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = proxyDelegate
    }
}

```

## Notes

TBD

## Versioning

This repo uses [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/gitvalue/MulticastProxy/tags). 

## Authors

* **Dmitry Volosach** - *Initial work* - [@vlk1994](https://twitter.com/vlk1994)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
