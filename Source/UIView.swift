//
//  UIView.swift
//  OXKit
//
//  Created by Dmitriy on 25.05.16.
//
//

import Foundation
import UIKit

extension UIView {
    
    /// Return view transform and view.layer transform to origin
    ///
    /// - Returns: self
    public func toOrigin() -> UIView {
        self.transform = CGAffineTransform.identity
        self.layer.transform = CATransform3DIdentity
        return self
    }
    
    
    /// Translate view to new coordinates
    ///
    /// - Parameters:
    ///   - tx: new x
    ///   - ty: new y
    /// - Returns: self
    public func translate(_ tx: CGFloat, _ ty: CGFloat) -> UIView {
        var scaleFactor: CGFloat = 1
        scaleFactor = UIScreen.main.scale
        self.transform = self.transform.translatedBy(x: tx*scaleFactor, y: ty*scaleFactor)
        return self
    }
    
    /// Scale view
    ///
    /// - Parameters:
    ///   - sx: scale x
    ///   - sy: scale y
    /// - Returns: self
    public func scale(_ sx: CGFloat, _ sy: CGFloat) -> UIView {
        self.transform = self.transform.scaledBy(x: sx, y: sy)
        return self
    }
    
    
    /// Rotate view
    ///
    /// - Parameter angle: rotate angle in radians
    /// - Returns: self 
    public func rotate(_ angle: CGFloat) -> UIView {
        self.transform = self.transform.rotated(by: angle)
        return self
    }
}
