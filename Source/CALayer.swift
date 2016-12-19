//
//  CALAyer.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 25/10/2016.

import Foundation
import UIKit


// MARK: - Extensions fo CALayer
extension CALayer {

    
    /// Make current layer rasterizable
    public func makeRasterizable() {
        self.shouldRasterize = true
        self.rasterizationScale = UIScreen.main.scale
    }
    

    
    /// Add shadow to layer
    ///
    /// - Parameters:
    ///   - color: Shadow Color
    ///   - opacity: Opacity
    ///   - radius: Shadow radius
    ///   - offset: Shadow offset
    public func addShadow(_ color: UIColor, opacity: Float = 1, radius: CGFloat = 0, offset: CGSize) {
        self.shadowColor = color.cgColor
        self.shadowOffset = offset
        self.shadowOpacity = opacity
        self.shadowRadius = radius
    }
    

    
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
    public func translate(x: CGFloat, y: CGFloat, z: CGFloat) -> CALayer {
        self.transform = CATransform3DTranslate(self.transform, x, y, z)
        return self
    }
    
    
    /// Scale layer and returns self
    ///
    /// - Parameters:
    ///   - x: X Scale
    ///   - y: Y Scale
    ///   - z: Z Scale
    /// - Returns: self
    @discardableResult
    public func scale(x: CGFloat, y: CGFloat, z: CGFloat) -> CALayer {
        self.transform = CATransform3DScale(self.transform, x, y, z)
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
    
    
    /// Return current layer 2D translation. Common usage to get info while animating object.
    ///
    /// - Returns: CGPoint translation
    public func get2DTranlation() -> CGPoint {
        let x = CGFloat((value(forKeyPath: "transform.translation.x") as? NSNumber)?.floatValue ?? 0)
        let y = CGFloat((value(forKeyPath: "transform.translation.y") as? NSNumber)?.floatValue ?? 0)
        return CGPoint(x: x, y: y)
    }
}
