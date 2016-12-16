//
//  OXGradientView.swift
//  Pods
//
//  Created by Dmitriy Azarov on 04/07/16.
//
//

import Foundation
import UIKit

@IBDesignable
open class OXGradientView: UIView {
    @IBInspectable
    open var topColor: UIColor? = UIColor.clear
    
    @IBInspectable
    open var bottomColor: UIColor? = UIColor.clear
    
    fileprivate let gradientLayer = CAGradientLayer()
    
    fileprivate func updateGradient() {
        if gradientLayer.superlayer == nil { layer.addSublayer(gradientLayer)}
        
        if let top = topColor, let bottom = bottomColor {
            gradientLayer.colors = [top.cgColor, bottom.cgColor]
            gradientLayer.locations = [0.0, 1.0]
        }
    }
    
    open override func layoutSubviews() {
        gradientLayer.frame = layer.frame
        updateGradient()
        
        super.layoutSubviews()
    }
}
