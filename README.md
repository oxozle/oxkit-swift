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
    pod 'OXKit', :git => 'https://github.com/oxozle/oxkit-swift.git', :branch => 'master'
end
```

Then, run the following command:

```bash
$ pod install
```