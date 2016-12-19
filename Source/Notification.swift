//
//  OXNotifications.swift
//  OXKit
//
//  Created by Dmitriy on 03.03.16.
//  Copyright © 2016 Oxozle. All rights reserved.
//

import Foundation

public extension Notification.Name {
    public func post() {
        NotificationCenter.default.post(name: self, object: nil)
    }
    
    public func post(object: Any) {
        NotificationCenter.default.post(name: self, object: nil, userInfo: [self.rawValue: object])
    }
}

public let ReachabilityChanged = Notification.Name.init(rawValue: "com.oxkit.reachability.changed")


