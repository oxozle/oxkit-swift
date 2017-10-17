//
//  Data.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 06/09/2017.
//  Copyright © 2017 Oxozle. All rights reserved.
//

import Foundation


extension Data {
    public func hexString() -> String {
        return self.reduce("") { string, byte in
            string + String(format: "%02X", byte)
        }
    }
}
