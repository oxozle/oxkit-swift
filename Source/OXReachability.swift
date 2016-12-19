//
//  OXReachability.swift
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
import Alamofire


/// Reachability observer
open class OXReachability {
    open static let shared = OXReachability()
    
    private var _manager: NetworkReachabilityManager?
    
    private init() {
        getManager()
    }
    
    @discardableResult
    private func getManager() -> NetworkReachabilityManager? {
        if _manager == nil {
            _manager = NetworkReachabilityManager()
            
            _manager?.listener = { status in
                print("🌐 Network \(status)")
                ReachabilityChanged.post()
            }
        }
        return _manager
    }
    
    
    /// Subscribe to reachability change events
    open func startListening() {
        if let manager = getManager() {
            manager.startListening()
        }
    }
    
    
    /// Unsubscribe reachability change events
    open func stopListening() {
        getManager()?.stopListening()
    }
    
    
    /// Property to check current reachability status. If no information return `true`
    open var isReachableOrTrue: Bool {
        if let manager = getManager() {
            return manager.isReachable
        }
        return true
    }
}
