//
//  OXAViewController.swift
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
    
    // MARK: Keyboard
    
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //To not prevent other tap events
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.view.endEditing(true)
        }
//        view.endEditing(true)
    }
    
}




