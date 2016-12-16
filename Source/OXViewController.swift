//
//  OXAViewController.swift
//  OXKit
//
//  Created by Dmitriy on 04.04.16.
//
//

import UIKit

///Base class for safe use view controllers
open class OXViewController: UIViewController {
    
    public var notificationManager: OXNotificationManager = OXNotificationManager()
    
    open  class func showController(_ parent: OXViewController, data: [String:Any]? = nil) {
        if let controller = getController(data) {
            parent.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    open func controllerClose() {
        navigationController?.popViewController(animated: true)
    }
    
    
    /// Init controller with data. Should return false if data is incorrect or controller could not be initialized
    ///
    /// - Parameter data: dictionary with data
    open func initController(_ data: [String:Any]?) -> Bool {
        return true
    }
    
  
    
    //MARK: View Life
    deinit {
        notificationManager.deregisterAll()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    
    //MARK: Public
    
    open class var storyboardName: String { return "" }
    open class var controllerIdentifier: String {  return "" }
    
    public class func getController(_ data: [String:Any]? = nil) -> OXViewController? {
        let controller = getViewController()
        if !controller.initController(data) {
            return nil
        }
        return controller
    }
    
    class func getViewController() -> OXViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        var identifier = controllerIdentifier
        if identifier.isEmpty {
            identifier = "\(self)"
        }
        return storyboard.instantiateViewController(withIdentifier: identifier) as! OXViewController
    }
}




