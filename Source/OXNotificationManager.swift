//
//  OXNotificationManager.swift
//  OXKit
//
//  Created by Dmitriy on 29.03.16.
//
//

import Foundation
import Async


///http://moreindirection.blogspot.ru/2014/08/nsnotificationcenter-swift-and-blocks.html
open class OXNotificationManager {
    fileprivate var observerTokens: [AnyObject] = []
    fileprivate var observerNames: [[Any]] = []
    
    public init() {
        
    }
    
    deinit {
        deregisterAll()
    }
    
    open func deregisterAll() {
        for token in observerTokens {
            NotificationCenter.default.removeObserver(token)
        }
        
        observerTokens = []
        observerNames = []
    }
    
    open func unregisterObserverToken(_ token: Any) {
        NotificationCenter.default.removeObserver(token)
        
        for (index, record) in observerTokens.enumerated() {
            if record.isEqual(token) {
                observerTokens.remove(at: index)
            }
        }
        for (index, record) in observerNames.enumerated() {
            if let recordObject = record[0] as? AnyObject {
                if recordObject.isEqual(token) {
                    observerNames.remove(at: index)
                }
            }
        }
    }

    
    /// Register main thread observer
    ///
    /// - Parameters:
    ///   - name: notification name
    ///   - block: It is very important to use block as {[weak self] (note: Notification) in
    /// - Returns: object of added observer
    @discardableResult
    open func registerMTObserver(_ name: Notification.Name, block: @escaping (Notification -> Void)) -> AnyObject {
        let newToken = NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) {note in
            Async.main{
                block(note)
            }
        }
        
        observerTokens.append(newToken)
        observerNames.append([newToken, name])
        
        return newToken
    }
    
    /// Register background thread observer
    ///
    /// - Parameters:
    ///   - name: notification name
    ///   - block: It is very important to use block as {[weak self] (note: Notification) in
    /// - Returns: object of added observer

    open func registerBTObserver(_ name: Notification.Name, block: @escaping ((Notification!) -> Void)) -> AnyObject {
        let newToken = NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) { note in
            
            Async.background {
                block(note)
            }
        }
        
        observerTokens.append(newToken)
        observerNames.append([newToken, name])
        
        return newToken
    }
}
