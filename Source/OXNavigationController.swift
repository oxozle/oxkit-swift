//
//  OXNavigationController.swift
//  Pods
//
//  Created by Dmitriy on 04.04.16.
//
//

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
