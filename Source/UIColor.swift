//
//  UIColor.swift
//  Pods
//
//  Created by Dmitriy Azarov on 10/04/16.
//
//

import UIKit

extension UIColor {
    
    
    /// Return Hex value of color. For white color return "FFFFFF" without '#' symbol
    public var hex: String{
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"%06x", rgb)
    }
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        var hexValue = hex
        if hex.hasPrefix("#") {
            hexValue = hex.replacingOccurrences(of: "#", with: "")
        }
        
        
        if hexValue.characters.count == 6 {
            let scanner = Scanner(string: hexValue)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat((hexNumber & 0x0000ff) >> 0) / 255
                a = 1.0
                
                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        } else if hexValue.characters.count == 8 {
            let scanner = Scanner(string: hexValue)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                
                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        
        
        return nil
    }
    
}

