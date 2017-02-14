//
//  URL.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 13/02/2017.
//  Copyright © 2017 Oxozle. All rights reserved.
//

import Foundation

extension URL {
    public var parameters: [String: String] {
        var result: [String: String] = [:]
        
        var keyValuePairs: [String] = []
        
        if let query: String = self.query {
            keyValuePairs += query.components(separatedBy: "&")
        }
        
        if let hash: String = self.fragment {
            keyValuePairs += hash.components(separatedBy: "&")
        }
        
        if keyValuePairs.isEmpty == false {
            for keyValueString in keyValuePairs {
                var keyValueArray: [String] = keyValueString.components(separatedBy: "=")
                let key: String = keyValueArray[0]
                if keyValueArray.count < 2 {
                    result[key] = "1"
                } else {
                    let value: String = keyValueArray[1]
                    result[key] = value
                }
            }
        }
        return result
    }
}
