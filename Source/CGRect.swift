//
//  CGRect.swift
//  Pods
//
//  Created by Dmitriy Azarov on 16/04/16.
//
//

import Foundation

extension CGRect {
    
    /// Return X origin position
    public var x: CGFloat {
        get {
            return self.origin.x
        }
    }
    
    
    /// Return Y origin position
    public var y: CGFloat {
        get {
            return self.origin.y
        }
    }
    
    
    /// Return bottom position (y + height)
    public var bottom: CGFloat {
        get {
            return self.origin.y + self.height
        }
    }
    
    
    /// Return right position (x + width)
    public var right: CGFloat {
        get {
            return self.origin.x + self.width
        }
    }
}
