//
//  OXNavigationBar.swift
//  OXKit
//
//  Created by Dmitriy on 04.04.16.
//
//

import UIKit


open class OXNavigationBar: UINavigationBar {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override init(frame: CGRect) {
        super.init(frame: frame)
        barStyle = UIBarStyle.black
        shadowImage = UIImage()
        isTranslucent = false
        setBackgroundImage(UIImage(), for: .default)
        tintColor = UIColor.white
    }
}
