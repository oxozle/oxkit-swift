//
//  UIImage.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 23/10/2016.
//
//

import Foundation
import UIKit
import Async

public extension UIImage {
    
    public convenience init?(diameter: CGFloat, color: UIColor) {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: diameter, height: diameter), false, 0.0)
        let ctx = UIGraphicsGetCurrentContext()!
        ctx.saveGState()
        let rect = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        ctx.setFillColor(color.cgColor)
        ctx.fillEllipse(in: rect)
        ctx.restoreGState()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    ///Create UIImage with solid color
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    public func addImagePadding(x: CGFloat, y: CGFloat) -> UIImage {
        let width: CGFloat = self.size.width + x
        let height: CGFloat = self.size.width + y
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)
        guard let context: CGContext = UIGraphicsGetCurrentContext() else { fatalError() }
        
        UIGraphicsPushContext(context)
        let origin: CGPoint = CGPoint(x: (width - self.size.width) / 2, y: (height - self.size.height) / 2)
        self.draw(at: origin)
        UIGraphicsPopContext()
        guard let imageWithPadding = UIGraphicsGetImageFromCurrentImageContext() else { fatalError() }
        
        UIGraphicsEndImageContext()
        return imageWithPadding
    }
    
    /// Resize current image and return new sized image. Method return new image with the same proportions.
    ///
    /// - Parameter targetSize: Maximum size
    /// - Returns: new UIImage
    public func resizeImage(targetSize: CGSize) -> UIImage {
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    /// Blur image in background thread. Callback calls from background thread (!)
    ///
    /// - Parameters:
    ///   - radius: gaussian blur radius
    public func applyGaussianBlurEffect(radius: CGFloat, callback: @escaping (_ blurredImage: UIImage?) -> Void){
        Async.background {
            let imageToBlur = CIImage(image: self)
            guard let blurfilter = CIFilter(name: "CIGaussianBlur") else { callback(nil); return}
            blurfilter.setValue(imageToBlur, forKey: kCIInputImageKey)
            blurfilter.setValue(radius, forKey: kCIInputRadiusKey)
            guard let resultImage = blurfilter.value(forKey: kCIOutputImageKey) as? CIImage else { callback(nil); return}
            let blurredImage = UIImage(ciImage: resultImage)
            callback(blurredImage)
        }
    }
    
}

