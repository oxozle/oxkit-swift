//
//  OXUtils.swift
//  Pods
//
//  Created by Dmitriy on 24.05.16.
//
//

import Foundation
import UIKit


/// little utilities
public final class OXUtils {
    
    /// Return true if current platform is ipad
    public class var isIpad: Bool {
        get {
            return UIDevice.current.userInterfaceIdiom == .pad
        }
    }
   
    
    /// Return current app version with build 1.0 (25)
    public class var appVersionAndBuild: String {
        return "\(OXUtils.getVersion()) (\(OXUtils.getBuild()))"
    }
    
    /// Return current version
    ///
    /// - Returns: 1.0
    public class var appVersion: String {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        return version
    }
    
    /// Return current build
    ///
    /// - Returns: 25
    public class var appBuild: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }

}
