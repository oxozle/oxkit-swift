//
//  OXAViewController.swift
//  OXKit
//
//  Created by Dmitriy on 04.04.16.
//
//

import UIKit

///Base class for safe use view controllers
public class OXViewController: UIViewController {
    
    open var notificationManager: OXNotificationManager = OXNotificationManager()
    
    
    /// Init controller with data. Should return false if data is incorrect or controller could not be initialized
    ///
    /// - Parameter data: dictionary with data
    public func initController(_ data: [String:Any]?) -> Bool {
        return true
    }
    
  
    
    //MARK: View Life
    deinit {
        notificationManager.deregisterAll()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    
    //MARK: Public
    
    public class var storyboardName: String { return "" }
    public class var controllerIdentifier: String {  return "" }
    
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




