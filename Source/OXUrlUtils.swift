//
//  OXUrlUtils.swift
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
