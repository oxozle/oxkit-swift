//
//  OXView.swift
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
import UIKit

open class OXView: UIView {
    public class func loadFromNib(_ data: Any? = nil) -> OXView {
        let view = UINib(nibName: "\(self)", bundle: Bundle.main).instantiate(withOwner: self, options: nil).first as! OXView
        view.setupData(data)
        view.configureView()
        return view
    }
    
    
    open func configureView() {
        
    }
    
    open func setupData(_ data: Any? = nil) {
        
    }
}

open class OXControl: UIControl {
    public class func loadFromNib(_ data: Any? = nil) -> OXControl {
        let view = UINib(nibName: "\(self)", bundle: Bundle.main).instantiate(withOwner: self, options: nil).first as! OXControl
        view.setupData(data)
        view.configureView()
        return view
    }
    
    
    open func configureView() {
        
    }
    
    open func setupData(_ data: Any? = nil) {
        
    }
}

extension UIView {
    open func currentFirstResponder() -> UIResponder? {
        if self.isFirstResponder {
            return self
        }
        
        for view in self.subviews {
            if let responder = view.currentFirstResponder() {
                return responder
            }
        }
        
        return nil
    }
    
    public func setBorder(cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        if(self.layer.cornerRadius > 0){
            self.layer.masksToBounds = true
        }
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }

}


public var isIphone5: Bool {
    return UIScreen.main.bounds.height == 568
}

public var isIphone4: Bool {
    return UIScreen.main.bounds.height < 568
}

public var isScreenMoreOrLike6: Bool {
    return UIScreen.main.bounds.height >= 667
}

public var isScreenMoreOrLike5: Bool {
    return UIScreen.main.bounds.height >= 568
}
