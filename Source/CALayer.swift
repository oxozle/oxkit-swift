//
//  CALayer.swift
//  OXKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Dmitriy Azarov. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


import Foundation

extension CALayer {
    
    /// Set transform to CATransform3DIdentity
    ///
    /// - Returns: self
    @discardableResult
    public func toOrigin() -> CALayer {
        self.transform = CATransform3DIdentity
        return self
    }
    
    /// Translate layer and returns self
    ///
    /// - Parameters:
    ///   - x: X Value
    ///   - y: Y Value
    ///   - z: Z Value
    /// - Returns: self
    @discardableResult
    public func translate2D(x: CGFloat, y: CGFloat) -> CALayer {
        self.transform = CATransform3DTranslate(self.transform, x, y, 0)
        return self
    }
    
    /// Scale X+Y with the same value
    ///
    /// - Parameter value: Scale value
    /// - Returns: self
    @discardableResult
    public func scaleXY(_ value: CGFloat) -> CALayer {
        self.transform = CATransform3DScale(self.transform, value, value, 1)
        return self
    }
    
    /// Rotate layer
    ///
    /// - Parameters:
    ///   - angle: Angle in radians
    ///   - x: X Radians
    ///   - y: Y Radians
    ///   - z: Z Radians
    /// - Returns: self
    @discardableResult
    public func rotate(angle: CGFloat, x: CGFloat = 0, y: CGFloat = 0, z: CGFloat = 1) -> CALayer {
        self.transform = CATransform3DRotate(self.transform, angle, x, y, z)
        return self
    }
}
