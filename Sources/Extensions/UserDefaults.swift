//
//  OXNSUserDefaults.swift
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

private let UserDefaultsLockPrefix = "LOCK_"
public extension UserDefaults {
    public class func isLocked(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: getLockKey(key)) != nil
    }
    
    public class func lock(key: String) {
        UserDefaults.standard.set(true, forKey: getLockKey(key))
        UserDefaults.standard.synchronize()
    }
    
    private class func getLockKey(_ key: String) -> String {
        return "\(UserDefaultsLockPrefix)\(key.uppercased())"
    }
    
    public func bool(forKey defaultName: String, defaultValue: Bool) -> Bool {
        if object(forKey: defaultName) == nil {
            return defaultValue
        }
        return bool(forKey: defaultName)
    }
    
    public func saveJson<T: Encodable>(object: T, for key: String) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: key)
            synchronize()
        } catch {
            print(error)
        }
    }
    
    public func loadJson<T: Decodable>(_ type: T.Type, key: String) -> T? {
        if let data = data(forKey: key) {
            let decoder = JSONDecoder()
            do {
                let user = try decoder.decode(type, from: data)
                return user
            } catch {
                
            }
        }
        return nil
    }
}
