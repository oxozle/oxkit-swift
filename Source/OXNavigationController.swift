//
//  OXNavigationController.swift
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

import UIKit


/// Base class for Navigation Controller
open class OXNavigationController: UINavigationController {
    
    
    /// Create new instance of OXNavigation controller with root view controller and OXNavigationNar
    ///
    /// - Parameter rootViewController: root controller placed first viewControllers
    /// - Returns: OXNavigationController isntance
    open class func makeNavigationController(_ rootViewController: OXViewController) -> OXNavigationController {
        let nc = OXNavigationController(navigationBarClass: OXNavigationBar.self, toolbarClass: UIToolbar.self)
        nc.setViewControllers([rootViewController], animated: false)
        return nc
    }
}
