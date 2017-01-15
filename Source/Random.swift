//
//  Random.swift
//  OXKit
//
//  Created by Dmitriy on 29/12/2016.
//  Copyright © 2016 Oxozle. All rights reserved.
//

import Foundation
import UIKit

// accepts Rand(0 ..< 5)
public func rand(_ range: Range<Int>) -> Int {
    let min = range.lowerBound
    let max = range.upperBound
    return Int(arc4random_uniform(UInt32(max - min))) + min
}

// accepts Rand(1 ... 5)
public func rand(_ range: ClosedRange<Int>) -> Int {
    let min = range.lowerBound
    let max = range.upperBound
    return Int(arc4random_uniform(UInt32(max - min))) + min
}

public func rand(_ range: Range<CGFloat>) -> CGFloat {
    let min = range.lowerBound
    let max = range.upperBound
    return CGFloat(arc4random_uniform(UInt32(max - min))) + min
}

//// accepts Rand(1 ... 5)
//public func rand(_ range: ClosedRange<Int>) -> Int {
//    return Int(range.lowerBound + arc4random_uniform(range.upperBound + 1 - range.lowerBound))
//}
