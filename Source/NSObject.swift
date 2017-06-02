//
//  NSObject.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 02/06/2017.
//  Copyright © 2017 Oxozle. All rights reserved.
//

import Foundation

extension NSObject {
    public var className: String {
        return String(describing: type(of: self))
    }
    
    public class var className: String {
        return String(describing: self)
    }
}
