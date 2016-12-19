# OXKit

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/OXKit.svg)](https://img.shields.io/cocoapods/v/OXKit.svg)
[![License](https://img.shields.io/cocoapods/l/OXKit.svg?style=flat)](https://cocoapods.org/pods/OXKit)
[![Platform](https://img.shields.io/cocoapods/p/OXKit.svg?style=flat)](http://cocoapods.org/pods/OXKit)
[![Language](https://img.shields.io/badge/swift-3.0-orange.svg)](http://swift.org)

OXKit is a set of utilities to make working with swift better.

## Requirements

- iOS 9.0+ / macOS 10.10+
- Xcode 8.1+
- Swift 3.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate OXkit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
	# for stable release
    pod 'OXKit'

    # for latest release
    pod 'OXKit', :git => 'https://github.com/oxozle/oxkit-swift.git', :branch => 'master'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### View Controller

Create view controller base on `OXViewController`

```swift
class MenuViewController: OXViewController {
    override class var storyboardName: String {  return "Master" }     
}
```

Create controller instance

```swift
let sidebarViewController = MenuViewController.getController()
```
