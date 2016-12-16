//
//  UIAlertController.swift
//  OXKit
//
//  Created by Dmitriy on 16/12/2016.
//  Copyright © 2016 Oxozle. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    public func addCancel(title: String) {
        self.addAction(UIAlertAction(title: title, style: .cancel, handler: nil))
    }
}
