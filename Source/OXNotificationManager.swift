//
//  OXNotificationManager.swift
//  OXKit
//
//  Created by Dmitriy on 29.03.16.
//
//

import Foundation

open class OXNotificationManager {
    fileprivate var observerTokens: [NotificationTokenWithName] = []
    
    struct NotificationTokenWithName {
        var token: NSObjectProtocol
        var name: Notification.Name
    }
    
    public init() {
        
    }
    
    deinit {
        deregisterAll()
    }
    
    open func deregisterAll() {
        for token in observerTokens {
            NotificationCenter.default.removeObserver(token.token)
        }
        
        observerTokens.removeAll(keepingCapacity: false)
    }
    
    
    /// Unregister objserver by Notification.Name
    ///
    /// - Parameter name: Notification.Name
    open func unregisterObserver(name: Notification.Name) {
        if let index = observerTokens.index(where: { $0.name.rawValue == name.rawValue }) {
            NotificationCenter.default.removeObserver(observerTokens[index])
            observerTokens.remove(at: index)
        }
    }
    
    /// Register main thread observer
    ///
    /// - Parameters:
    ///   - name: notification name
    ///   - block: It is very important to use block as {[weak self] (note: Notification) in
    /// - Returns: object of added observer
    @discardableResult
    open func registerMTObserver(_ name: Notification.Name, block: @escaping ((_ notification: Notification) -> Void)) -> NSObjectProtocol {
        let newToken = NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) {note in
            DispatchQueue.main.async {
                block(note)
            }
        }
        
        observerTokens.append(NotificationTokenWithName(token: newToken, name: name))
        return newToken
    }
    
    /// Register background thread observer
    ///
    /// - Parameters:
    ///   - name: notification name
    ///   - block: It is very important to use block as {[weak self] (note: Notification) in
    /// - Returns: object of added observer
    @discardableResult
    open func registerBTObserver(_ name: Notification.Name, block: @escaping ((_ notification: Notification) -> Void)) -> NSObjectProtocol {
        let newToken = NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) { note in
            DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
                block(note)
            }
        }
        
        observerTokens.append(NotificationTokenWithName(token: newToken, name: name))
        return newToken
    }
}
