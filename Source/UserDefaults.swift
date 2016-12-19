//
//  OXNSUserDefaults.swift
//  OXKit
//
//  Created by Dmitriy on 04.03.16.
//  Copyright © 2016 Oxozle. All rights reserved.
//

import Foundation
import SwiftyJSON


public extension UserDefaults {
    open func bool(forKey defaultName: String, defaultValue: Bool) -> Bool {
        if UserDefaults.standard.object(forKey: defaultName) == nil {
            return defaultValue
        }
        return UserDefaults.standard.bool(forKey: defaultName)
    }
}
