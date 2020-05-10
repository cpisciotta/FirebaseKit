# FirebaseKit
> An easy way to include Firebase in iOS projects.

<!--
[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

-->

One to two paragraph statement about your product and what it does.

<!--
![](header.png)
-->

## Features

- [x] Feature 1
- [x] Feature 2
- [x] Feature 3
- [x] Feature 4
- [x] Feature 5

## Requirements

- iOS 11.0+
- Xcode 11.0+

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `FirebaseKit` by adding it to your `Podfile`:

```ruby
platform :ios, '11.0'
use_frameworks!
pod 'FirebaseKit', :git => 'https://github.com/cpisciottadeveloping/FirebaseKit.git'
```

To get the full benefits import `FirebaseKit` wherever you import UIKit

``` swift
import UIKit
import FirebaseKit
```

<!--
#### Carthage
Create a `Cartfile` that lists the framework and run `carthage update`. Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add `$(SRCROOT)/Carthage/Build/iOS/YourLibrary.framework` to an iOS project.

```
github "yourUsername/yourlibrary"
```
-->

#### Manually
1. Download and drop ```FirebaseKit.swift``` in your project.  
2. Congratulations!  

## Usage example

1. Import the framework.
```swift
import FirebaseKit
```

2. Create a static variable for the collection name.
```swift
extension FirestoreCollectionName {
    static var events: Self {
        FirestoreCollectionName(name: "events")
    }
}
```

3. Create a static function to find the proper document.
```swift
extension FirestoreDocumentName {
    static func event(withID eventID: UUID) -> Self {
        FirestoreDocumentName(name: eventID.uuidString)
    }
}
```

4. Create a function in `FirestoreManager` to make a get request.
```swift
extension FirestoreManager where T == NVEvent {
    func getEvent(withID eventID: UUID, completion: @escaping FirestoreRequestResultCallback) {
        router.getDocument(.getEvent(withID: eventID)) { (result) in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let documentSnapshot): completion(FirestoreDecoder().decodeDocumentSnapshot(documentSnapshot))
            }
        }
    }
}
```

## Contribute

Please feel free to contribute to **FirebaseKit**, check the ``LICENSE`` file for more info.

## Meta

Charles Pisciotta – cpisciottadeveloping@gmail.com

Distributed under the MIT license. See ``LICENSE`` for more information.

GitHub: [cpisciottadeveloping](https://github.com/cpisciottadeveloping)

<!--
[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
-->
