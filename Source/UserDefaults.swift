//
//  OXNSUserDefaults.swift
//  OXKit
//
//  Created by Dmitriy on 04.03.16.
//  Copyright © 2016 Oxozle. All rights reserved.
//

import Foundation
import SwiftyJSON


/// Class for work with user defaults settings
open class OXUserDefaults{
    
    public class func getJSON(_ key: String) -> JSON? {
        if let savedData = getString(key) {
            return JSON.parse(savedData)
        } else {
            return nil
        }
        
    }
    
    public class func getObject(_ key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    public class func getInt(_ key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    public class func getBool(_ key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    public class func getFloat(_ key: String) -> Float {
        return UserDefaults.standard.float(forKey: key)
    }
    
    public class func getString(_ key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    public class func getData(_ key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }
    
    public class func getArray(_ key: String) -> [Any]? {
        return UserDefaults.standard.array(forKey: key)
    }
    
    public class func getDictionary(_ key: String) -> [String: Any]? {
        return UserDefaults.standard.dictionary(forKey: key)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Get value with default value
    //-------------------------------------------------------------------------------------------
    
    public class func getObject(_ key: String, defaultValue: Any) -> Any? {
        if getObject(key) == nil {
            return defaultValue
        }
        return getObject(key)
    }
    
    public  class func getInt(_ key: String, defaultValue: Int) -> Int {
        if getObject(key) == nil {
            return defaultValue
        }
        return getInt(key)
    }
    
    public  class func getBool(_ key: String, defaultValue: Bool) -> Bool {
        if getObject(key) == nil {
            return defaultValue
        }
        return getBool(key)
    }
    
    public class func getFloat(_ key: String, defaultValue: Float) -> Float {
        if getObject(key) == nil {
            return defaultValue
        }
        return getFloat(key)
    }
    
    public  class func getString(_ key: String, defaultValue: String) -> String? {
        if getObject(key) == nil {
            return defaultValue
        }
        return getString(key)
    }
    
    public  class func getData(_ key: String, defaultValue: Data) -> Data? {
        if getObject(key) == nil {
            return defaultValue
        }
        return getData(key)
    }
    
    public class func getArray(_ key: String, defaultValue: [Any]) -> [Any]? {
        if getObject(key) == nil {
            return defaultValue
        }
        return getArray(key)
    }
    
    public class func getDictionary(_ key: String, defaultValue: [String: Any]) -> [String: Any]? {
        if getObject(key) == nil {
            return defaultValue
        }
        return getDictionary(key)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Set value
    //-------------------------------------------------------------------------------------------
    
    public  class func setJSON(_ key: String, value: JSON?) {
        if let value = value {
            if let jsonData = value.rawString(String.Encoding.utf8, options: []) {
                setString(key, value: jsonData)
            }
        } else {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    
    public class func setObject(_ key: String, value: Any?) {
        if value == nil {
            UserDefaults.standard.removeObject(forKey: key)
        } else {
            UserDefaults.standard.set(value, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    public  class func setInt(_ key: String, value: Int) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    public  class func setBool(_ key: String, value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    public   class func setFloat(_ key: String, value: Float) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    public  class func setString(_ key: String, value: String?) {
        if value == nil {
            UserDefaults.standard.removeObject(forKey: key)
        } else {
            UserDefaults.standard.set(value, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    public     class func setData(_ key: String, value: Data) {
        setObject(key, value: value as AnyObject?)
    }
    
    public class func setArray(_ key: String, value: [Any]) {
        setObject(key, value: value)
    }
    
    public  class func setDictionary(_ key: String, value: [String: Any]) {
        setObject(key, value: value)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Synchronize
    //-------------------------------------------------------------------------------------------
    
    public   class func sync() {
        UserDefaults.standard.synchronize()
    }
}
