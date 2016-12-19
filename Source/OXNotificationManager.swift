//
//  OXNotificationManager.swift
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


/// Class provide the ability to subscribe for NotificationCenter notifications in different queues.
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
    
    
    /// Unregister for all registered observers
    open func deregisterAll() {
        for token in observerTokens {
            NotificationCenter.default.removeObserver(token.token)
        }
        
        observerTokens.removeAll(keepingCapacity: false)
    }
    
    
    /// Unregister observer by Notification.Name
    ///
    /// - Parameter name: name of the notification to remove observer
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
