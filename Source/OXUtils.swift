//
//  OXUtils.swift
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

import Foundation
import UIKit


/// Collection of useful utilities
public final class OXUtils {
    
    /// Return true if current platform is ipad
    public class var isIpad: Bool {
        get {
            return UIDevice.current.userInterfaceIdiom == .pad
        }
    }
   
    
    /// Return current app version with build 1.0 (25)
    public class var appVersionAndBuild: String {
        return "\(OXUtils.appVersion) (\(OXUtils.appBuild))"
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
    
    public class func getAdvId() -> String {
        #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
            return "a15aa882-85df-480c-ac10-3686a57f3232"
        #else
            return UIDevice.current.identifierForVendor?.uuidString ?? "N/A"
        #endif
    }
}


