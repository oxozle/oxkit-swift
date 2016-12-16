//
//  OXView.swift
//  OXKit
//
//  Created by Dmitriy on 31.05.16.
//
//

import Foundation
import UIKit

public class OXView: UIView {
    public class func loadFromNib(_ data: Any? = nil) -> OXView {
        let view = UINib(nibName: "\(self)", bundle: Bundle.main).instantiate(withOwner: self, options: nil).first as! OXView
        view.setupData(data)
        view.configureView()
        return view
    }
    
    
    public func configureView() {
        
    }
    
    public func setupData(_ data: Any? = nil) {
        
    }
}

