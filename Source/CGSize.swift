//
//  CGSize.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 06/09/2017.
//  Copyright © 2017 Oxozle. All rights reserved.
//

import Foundation

public func / (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width / right.width, height: left.height / right.height)
}
