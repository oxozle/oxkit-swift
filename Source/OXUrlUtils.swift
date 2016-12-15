//
//  OXUrlUtils.swift
//  OXKit
//
//  Created by Dmitriy on 06.07.16.

import Foundation

/// Add or update query parameter in url
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
