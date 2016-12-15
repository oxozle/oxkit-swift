//
//  OXReachability.swift
//  OXKit
//
//  Created by Dmitriy on 03.03.16.
//  Copyright © 2016 Oxozle. All rights reserved.
//

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
    
    open func startListening() {
        if let manager = getManager() {
            manager.startListening()
        }
    }
    
    open func stopListening() {
        getManager()?.stopListening()
    }
    
    open var isReachableOrTrue: Bool {
        if let manager = getManager() {
            return manager.isReachable
        }
        return true
    }
}
