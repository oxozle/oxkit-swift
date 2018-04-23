//
//  UIView.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 17/10/2017.
//  Copyright © 2017 Oxozle. All rights reserved.
//

import UIKit

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

public var isIphoneSix: Bool {
    return UIScreen.main.bounds.height == 667
}
public var isIphoneSixPlus: Bool {
    return UIScreen.main.bounds.height == 736
}
public var isIphone5: Bool {
    return UIScreen.main.bounds.height == 568
}

public var isIphoneX: Bool {
    return UIScreen.main.bounds.height == 812
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


public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    public static var reuseIdentifier: String { return String(describing: self) }
}

extension UICollectionViewCell: Reusable {    
}

extension UICollectionReusableView: Reusable {
}
