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

/// Add or update query parameter in url string
///
/// - Parameters:
///   - url: current url
///   - key: query string key
///   - value: query string value
/// - Returns: new url
public func addOrUpdateQueryStringParameter(_ url: String, key: String, value: String?) -> String {
    if var components = URLComponents(string: url) {
        var queryItems = components.queryItems ?? []
        
        for (index, item) in queryItems.enumerated() {
            if item.name.uppercased() == key.uppercased() {
                if let v = value {
                    queryItems[index] = URLQueryItem(name: key, value: v)
                } else {
                    queryItems.remove(at: index)
                }
                components.queryItems = queryItems.count > 0 ? queryItems : nil
                return components.string!
            }
        }
        
        if let v = value {
            queryItems.append(URLQueryItem(name: key, value: v))
            components.queryItems = queryItems
            return components.string!
        }
    }
    
    return url
}
