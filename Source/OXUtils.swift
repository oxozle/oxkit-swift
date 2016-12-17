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
    
    
    /// Return identifierForVendor. For simulator return "4a8aec61-7b8d-4151-a12d-781903cedc67".
    /// Can return N/A if there is no identifierForVendor
    ///
    /// - Returns: <#return value description#>
    public class func getAdvId() -> String {
        #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
            return "4a8aec61-7b8d-4151-a12d-781903cedc67"
        #else
            return UIDevice.current.identifierForVendor?.uuidString ?? "N/A"
        #endif
    }
    
    
    public class var appVersionAndBuild: String {
        return "\(OXUtils.getVersion()) (\(OXUtils.getBuild()))"
    }
    
    /// Return current version
    ///
    /// - Returns: 1.0
    public class func getVersion() -> String {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        return version
    }
    
    /// Return current build
    ///
    /// - Returns: 25
    public class func getBuild() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }

}
